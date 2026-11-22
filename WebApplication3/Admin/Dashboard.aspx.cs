using System;
using System.Data;

namespace WebApplication3
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStats();
                LoadRecentBookings();
            }
        }

        private void LoadStats()
        {
            try
            {
                object totalBookings = DbHelper.ExecuteScalar("SELECT COUNT(*) FROM Bookings");
                litTotalBookings.Text = (totalBookings ?? 0).ToString();

                object totalRev = DbHelper.ExecuteScalar("SELECT ISNULL(SUM(Amount), 0) FROM Payments WHERE PaymentStatus = 'Paid'");
                litTotalRevenue.Text = "₹" + Convert.ToDecimal(totalRev ?? 0).ToString("N0");

                object activeVehicles = DbHelper.ExecuteScalar("SELECT COUNT(*) FROM Vehicles WHERE VehicleStatus = 'Active'");
                litActiveVehicles.Text = (activeVehicles ?? 0).ToString();

                object activeDrivers = DbHelper.ExecuteScalar("SELECT COUNT(*) FROM Drivers WHERE VerificationStatus = 'Active'");
                litActiveDrivers.Text = (activeDrivers ?? 0).ToString();
            }
            catch
            {
                // Fallbacks if tables empty
            }
        }

        private void LoadRecentBookings()
        {
            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT TOP 10
                    b.BookingNumber AS BookingId,
                    ISNULL(u.FullName, 'Customer') AS Customer,
                    ISNULL(b.VehicleType, 'Vehicle') AS Vehicle,
                    FORMAT(b.PreferredDate, 'dd MMM yyyy') AS Date,
                    ISNULL(b.BookingStatus, 'Pending') AS Status,
                    N'₹' + FORMAT(ISNULL(p.Amount, 0), 'N2') AS Amount
                FROM Bookings b
                LEFT JOIN Users u ON b.CustomerId = u.UserId
                LEFT JOIN Payments p ON b.BookingId = p.BookingId
                ORDER BY b.BookingId DESC");

            gvRecentBookings.DataSource = dt;
            gvRecentBookings.DataBind();
        }

        public string GetStatusClass(string status)
        {
            if (string.IsNullOrEmpty(status)) return "admin-status";
            switch (status.ToLower())
            {
                case "delivered":
                case "completed":
                    return "admin-status delivered";
                case "in transit":
                case "ongoing":
                    return "admin-status transit";
                case "pending":
                    return "admin-status pending";
                case "cancelled":
                    return "admin-status cancelled";
                default:
                    return "admin-status";
            }
        }
    }
}
