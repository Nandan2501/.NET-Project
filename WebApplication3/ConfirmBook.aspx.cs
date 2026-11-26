using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class BookingSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookingDetails();
            }
        }

        private void LoadBookingDetails()
        {
            string bookingId = Request.QueryString["id"] ?? Session["BookingID"]?.ToString();
            int customerId = DbHelper.GetLoggedInUserId(Session);

            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT TOP 1
                    b.BookingNumber,
                    b.BookingStatus,
                    (b.PickupAddress + N' → ' + b.DropAddress) AS Route,
                    b.VehicleType,
                    FORMAT(b.PreferredDate, 'dddd, dd MMMM yyyy') AS FormattedDate,
                    ISNULL(ld.PackageCount, 1) AS PackageCount,
                    ISNULL(ld.WeightKg, 0) AS WeightKg,
                    ISNULL(p.Amount, ISNULL(b.BaseFare, 0) + ISNULL(b.TollsTaxes, 0)) AS TotalAmount
                FROM Bookings b
                LEFT JOIN BookingLoadDetails ld ON b.BookingId = ld.BookingId
                LEFT JOIN Payments p ON b.BookingId = p.BookingId
                WHERE (@BookingNo IS NOT NULL AND b.BookingNumber = @BookingNo)
                   OR (@BookingNo IS NULL AND b.CustomerId = @CustomerId)
                ORDER BY b.BookingId DESC",
                new SqlParameter("@BookingNo", string.IsNullOrEmpty(bookingId) ? (object)DBNull.Value : bookingId),
                new SqlParameter("@CustomerId", customerId));

            if (dt.Rows.Count > 0)
            {
                var r = dt.Rows[0];
                lblBookingId.Text = r["BookingNumber"].ToString();
                lblStatus.Text = r["BookingStatus"].ToString();
                lblRoute.Text = r["Route"].ToString();
                lblVehicle.Text = r["VehicleType"].ToString();
                lblLoad.Text = r["PackageCount"] + " Packages (" + Convert.ToDecimal(r["WeightKg"]).ToString("N0") + " kg Total)";
                lblPickupDate.Text = r["FormattedDate"].ToString();
                lblCost.Text = "₹" + Convert.ToDecimal(r["TotalAmount"]).ToString("N0");
            }
        }

        protected void btnBookAnother_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookTransportation.aspx");
        }

        protected void btnMyBookings_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bookings.aspx");
        }

        protected void btnViewBookings_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bookings.aspx");
        }
    }
}
