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
            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT 
                    b.BookingNumber AS BookingID,
                    (ISNULL(b.PickupCity, 'Rajkot') + ' → ' + ISNULL(b.DropCity, 'Surat')) AS Route,
                    FORMAT(b.PreferredDate, 'dd MMM yyyy, hh:mm tt') AS Date,
                    b.BookingStatus AS Status,
                    '₹' + CAST(CAST(ISNULL(p.Amount, 10000.00) AS INT) AS VARCHAR) AS Amount
                FROM Bookings b
                LEFT JOIN Payments p ON b.BookingId = p.BookingId
                WHERE b.CustomerId = @UserId
                ORDER BY b.BookingId DESC",
                new SqlParameter("@UserId", userId));

            gvBookings.DataSource = dt;
            gvBookings.DataBind();
        }

        protected string GetStatusClass(string status)
        {
            switch (status?.ToLower())
            {
                case "ongoing":
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
            if (e.CommandName == "ViewBooking")
            {
                string bookingId = e.CommandArgument.ToString();
                Session["SelectedBookingId"] = bookingId;
                Response.Redirect("BookDetails.aspx?id=" + Server.UrlEncode(bookingId));
            }
        }
    }
}
