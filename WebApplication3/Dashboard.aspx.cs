using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            int userId = DbHelper.GetLoggedInUserId(Session);

            // User Name
            string name = Session["FullName"]?.ToString();
            if (string.IsNullOrEmpty(name))
            {
                var nameObj = DbHelper.ExecuteScalar(
                    "SELECT FullName FROM Users WHERE UserId = @UserId",
                    new SqlParameter("@UserId", userId));
                name = nameObj?.ToString() ?? "Customer";
            }
            litUserName.Text = Server.HtmlEncode(name);

            // Stat Cards
            var activeObj = DbHelper.ExecuteScalar(@"
                SELECT COUNT(1) FROM Bookings 
                WHERE CustomerId = @UserId AND BookingStatus IN ('Pending', 'Confirmed', 'Ongoing')",
                new SqlParameter("@UserId", userId));
            litActiveBookings.Text = (activeObj ?? 0).ToString();

            var upcomingObj = DbHelper.ExecuteScalar(@"
                SELECT COUNT(1) FROM Bookings 
                WHERE CustomerId = @UserId AND PreferredDate >= CAST(GETDATE() AS DATE)",
                new SqlParameter("@UserId", userId));
            litUpcomingTrips.Text = (upcomingObj ?? 0).ToString();

            var completedObj = DbHelper.ExecuteScalar(@"
                SELECT COUNT(1) FROM Bookings 
                WHERE CustomerId = @UserId AND BookingStatus = 'Completed'",
                new SqlParameter("@UserId", userId));
            litCompletedTrips.Text = (completedObj ?? 0).ToString();

            var pendingPayObj = DbHelper.ExecuteScalar(@"
                SELECT COUNT(1) FROM Payments p 
                INNER JOIN Bookings b ON p.BookingId = b.BookingId 
                WHERE b.CustomerId = @UserId AND p.PaymentStatus = 'Pending'",
                new SqlParameter("@UserId", userId));
            litPendingPayments.Text = (pendingPayObj ?? 0).ToString();

            // Recent Bookings
            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT TOP 5 
                    b.BookingNumber,
                    (ISNULL(b.PickupCity, b.PickupAddress) + N' → ' + ISNULL(b.DropCity, b.DropAddress)) AS Route,
                    ISNULL(b.VehicleType, 'Medium Truck') AS VehicleType,
                    FORMAT(b.PreferredDate, 'dd MMM yyyy') AS FormattedDate,
                    b.BookingStatus
                FROM Bookings b
                WHERE b.CustomerId = @UserId
                ORDER BY b.BookingId DESC",
                new SqlParameter("@UserId", userId));

            rptRecentBookings.DataSource = dt;
            rptRecentBookings.DataBind();

            // Upcoming Trip Card
            DataTable dtUpcoming = DbHelper.ExecuteQuery(@"
                SELECT TOP 1 
                    (ISNULL(b.PickupCity, b.PickupAddress) + N' → ' + ISNULL(b.DropCity, b.DropAddress)) AS Route,
                    ISNULL(b.VehicleType, 'Medium Truck') AS VehicleType,
                    FORMAT(b.PreferredDate, 'dddd, dd MMM yyyy') AS FormattedDate
                FROM Bookings b
                WHERE b.CustomerId = @UserId AND b.BookingStatus IN ('Confirmed', 'Ongoing', 'Pending')
                ORDER BY b.PreferredDate ASC",
                new SqlParameter("@UserId", userId));

            if (dtUpcoming.Rows.Count > 0)
            {
                var r = dtUpcoming.Rows[0];
                litUpcomingRoute.Text = r["Route"]?.ToString();
                litUpcomingVehicle.Text = r["VehicleType"]?.ToString();
                litUpcomingDate.Text = r["FormattedDate"]?.ToString();
            }
        }

        protected string GetStatusClass(string status)
        {
            switch (status?.ToLower())
            {
                case "active":
                case "ongoing":
                    return "active-status";
                case "completed":
                    return "completed-status";
                case "pending":
                    return "pending-status";
                default:
                    return "";
            }
        }
    }
}
