using System;
using System.Data;

namespace WebApplication3
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadReportsData();
            }
        }

        private void LoadReportsData()
        {
            object totalBookings = DbHelper.ExecuteScalar("SELECT COUNT(*) FROM Bookings");
            litTotalBookings.Text = Convert.ToInt32(totalBookings ?? 0).ToString("N0");

            object totalRevenue = DbHelper.ExecuteScalar("SELECT ISNULL(SUM(Amount), 0) FROM Payments WHERE PaymentStatus = 'Paid'");
            litTotalRevenue.Text = "₹" + Convert.ToDecimal(totalRevenue ?? 0).ToString("N0");

            object avgTrip = DbHelper.ExecuteScalar("SELECT ISNULL(AVG(Amount), 0) FROM Payments WHERE PaymentStatus = 'Paid'");
            litAvgTripValue.Text = "₹" + Convert.ToDecimal(avgTrip ?? 0).ToString("N0");

            object activeVehicles = DbHelper.ExecuteScalar("SELECT COUNT(*) FROM Vehicles WHERE VehicleStatus = 'Active'");
            litActiveVehicles.Text = Convert.ToInt32(activeVehicles ?? 0).ToString("N0");

            object totalDrivers = DbHelper.ExecuteScalar("SELECT COUNT(*) FROM Drivers");
            litTotalDrivers.Text = Convert.ToInt32(totalDrivers ?? 0).ToString("N0");

            DataTable dtDrivers = DbHelper.ExecuteQuery(@"
                SELECT TOP 5
                    d.DriverId,
                    u.FullName,
                    UPPER(LEFT(u.FullName, 2)) AS Initials,
                    d.VerificationStatus,
                    ISNULL(d.Rating, 5.0) AS Rating,
                    (SELECT COUNT(*) FROM Bookings b WHERE b.DriverId = d.DriverId) AS TripCount
                FROM Drivers d
                INNER JOIN Users u ON d.UserId = u.UserId
                ORDER BY TripCount DESC, d.Rating DESC");

            rptTopDrivers.DataSource = dtDrivers;
            rptTopDrivers.DataBind();

            DataTable dtBreakdown = DbHelper.ExecuteQuery(@"
                SELECT 
                    b.BookingStatus,
                    COUNT(*) AS BookingCount,
                    ISNULL(SUM(p.Amount), 0) AS TotalAmount
                FROM Bookings b
                LEFT JOIN Payments p ON b.BookingId = p.BookingId
                GROUP BY b.BookingStatus
                ORDER BY BookingCount DESC");

            rptStatusBreakdown.DataSource = dtBreakdown;
            rptStatusBreakdown.DataBind();
        }
    }
}
