using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class MyBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings();
            }
        }

        private void LoadBookings()
        {
            int userId = DbHelper.GetLoggedInUserId(Session);
            string statusFilter = ddlStatusFilter != null ? ddlStatusFilter.SelectedValue : "ALL";

            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT 
                    b.BookingId AS RawBookingId,
                    b.BookingNumber AS BookingID,
                    (ISNULL(b.PickupCity, b.PickupAddress) + N' → ' + ISNULL(b.DropCity, b.DropAddress)) AS Route,
                    FORMAT(b.PreferredDate, 'dd MMM yyyy, hh:mm tt') AS Date,
                    b.BookingStatus AS Status,
                    N'₹' + FORMAT(ISNULL(p.Amount, ISNULL(b.BaseFare, 0) + ISNULL(b.TollsTaxes, 0)), 'N0') AS Amount,
                    CASE 
                        WHEN b.BookingStatus = 'Pending' THEN 'Waiting for driver to accept'
                        WHEN b.BookingStatus = 'Confirmed' AND EXISTS(SELECT 1 FROM TripMilestones tm WHERE tm.BookingId = b.BookingId AND tm.MilestoneType = 'Pickup' AND tm.MilestoneStatus = 'DriverArrived')
                            THEN 'Driver arrived! Confirm arrival (50%)'
                        WHEN b.BookingStatus = 'Confirmed' THEN 'Driver assigned — confirm on arrival'
                        WHEN b.BookingStatus = 'Ongoing' AND EXISTS(SELECT 1 FROM TripMilestones tm WHERE tm.BookingId = b.BookingId AND tm.MilestoneType = 'Drop' AND tm.MilestoneStatus = 'DriverDelivered')
                            THEN 'Driver delivered! Confirm completion (50%)'
                        WHEN b.BookingStatus = 'Ongoing' THEN '1st half paid — trip in transit'
                        WHEN b.BookingStatus = 'Completed' THEN '100% completed'
                        ELSE ''
                    END AS ProgressHint
                FROM Bookings b
                LEFT JOIN Payments p ON b.BookingId = p.BookingId
                WHERE b.CustomerId = @UserId
                  AND (@Status = 'ALL' OR b.BookingStatus = @Status)
                ORDER BY b.BookingId DESC",
                new SqlParameter("@UserId", userId),
                new SqlParameter("@Status", statusFilter));

            gvBookings.DataSource = dt;
            gvBookings.DataBind();
        }

        protected void ddlStatusFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBookings();
        }

        protected bool CanCancel(string status)
        {
            return string.Equals(status, "Pending", StringComparison.OrdinalIgnoreCase) ||
                   string.Equals(status, "Confirmed", StringComparison.OrdinalIgnoreCase);
        }

        protected string GetStatusClass(string status)
        {
            switch (status?.ToLower())
            {
                case "ongoing":
                case "confirmed":
                    return "mb-status ongoing";
                case "completed":
                    return "mb-status completed";
                case "cancelled":
                    return "mb-status cancelled";
                default:
                    return "mb-status";
            }
        }

        protected void gvBookings_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int userId = DbHelper.GetLoggedInUserId(Session);

            if (e.CommandName == "ViewBooking")
            {
                string bookingNumber = e.CommandArgument.ToString();
                Session["SelectedBookingId"] = bookingNumber;
                Response.Redirect("BookDetails.aspx?id=" + Server.UrlEncode(bookingNumber));
            }
            else if (e.CommandName == "ConfirmArrived")
            {
                int bookingId;
                if (int.TryParse(e.CommandArgument.ToString(), out bookingId))
                {
                    string msg;
                    bool ok = DbHelper.ConfirmDriverArrivedByCustomer(bookingId, userId, out msg);
                    lblBookingMessage.ForeColor = ok ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                    lblBookingMessage.Text = msg;
                    LoadBookings();
                }
            }
            else if (e.CommandName == "ConfirmCompleted")
            {
                int bookingId;
                if (int.TryParse(e.CommandArgument.ToString(), out bookingId))
                {
                    string msg;
                    bool ok = DbHelper.ConfirmTripCompletedByCustomer(bookingId, userId, out msg);
                    lblBookingMessage.ForeColor = ok ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                    lblBookingMessage.Text = msg;
                    LoadBookings();
                }
            }
            else if (e.CommandName == "CancelBooking")
            {
                string bookingNumber = e.CommandArgument.ToString();
                DbHelper.ExecuteNonQuery(@"
                    UPDATE Bookings
                    SET BookingStatus = 'Cancelled'
                    WHERE BookingNumber = @BookingNo AND CustomerId = @UserId AND BookingStatus IN ('Pending', 'Confirmed');

                    UPDATE p
                    SET p.PaymentStatus = CASE WHEN p.PaymentStatus = 'Paid' THEN 'Refunded' ELSE p.PaymentStatus END
                    FROM Payments p
                    INNER JOIN Bookings b ON p.BookingId = b.BookingId
                    WHERE b.BookingNumber = @BookingNo AND b.CustomerId = @UserId;

                    UPDATE tm
                    SET tm.MilestoneStatus = 'Cancelled'
                    FROM TripMilestones tm
                    INNER JOIN Bookings b ON tm.BookingId = b.BookingId
                    WHERE b.BookingNumber = @BookingNo AND b.CustomerId = @UserId;",
                    new SqlParameter("@BookingNo", bookingNumber),
                    new SqlParameter("@UserId", userId));

                lblBookingMessage.ForeColor = System.Drawing.Color.Green;
                lblBookingMessage.Text = "Booking " + bookingNumber + " has been cancelled.";
                LoadBookings();
            }
        }
    }
}
