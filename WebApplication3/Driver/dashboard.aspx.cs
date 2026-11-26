using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication3.Driver
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDriverDashboard();
            }
        }

        private void LoadDriverDashboard()
        {
            int userId = DbHelper.GetLoggedInUserId(Session);
            int driverId = DbHelper.GetLoggedInDriverId(Session);

            object nameObj = DbHelper.ExecuteScalar("SELECT FullName FROM Users WHERE UserId = @UserId",
                new SqlParameter("@UserId", userId));
            litDriverName.Text = Server.HtmlEncode(nameObj?.ToString() ?? Session["FullName"]?.ToString() ?? "Driver");

            object openObj = DbHelper.ExecuteScalar(@"
                SELECT COUNT(1) FROM Bookings 
                WHERE DriverId IS NULL AND BookingStatus = 'Pending'");
            litOpenTrips.Text = Convert.ToInt32(openObj ?? 0).ToString();

            object activeObj = DbHelper.ExecuteScalar(@"
                SELECT COUNT(1) FROM Bookings 
                WHERE DriverId = @DriverId AND BookingStatus IN ('Confirmed', 'Ongoing')",
                new SqlParameter("@DriverId", driverId));
            litActiveTrips.Text = Convert.ToInt32(activeObj ?? 0).ToString();

            object distObj = DbHelper.ExecuteScalar(@"
                SELECT ISNULL(SUM(ISNULL(DistanceKm, 200)), 0)
                FROM Bookings
                WHERE DriverId = @DriverId AND BookingStatus <> 'Cancelled'",
                new SqlParameter("@DriverId", driverId));
            litTotalDistance.Text = Convert.ToDecimal(distObj ?? 0).ToString("N0") + " km";

            object earnObj = DbHelper.ExecuteScalar(@"
                SELECT ISNULL(SUM(NetAmount), 0)
                FROM DriverEarnings
                WHERE DriverId = @DriverId AND PayoutStatus = 'Paid'",
                new SqlParameter("@DriverId", driverId));
            litTotalEarnings.Text = "₹" + Convert.ToDecimal(earnObj ?? 0).ToString("N0");

            DataTable dtOpen = DbHelper.ExecuteQuery(@"
                SELECT TOP 5
                    b.BookingId,
                    b.BookingNumber,
                    (ISNULL(b.PickupCity, b.PickupAddress) + N' → ' + ISNULL(b.DropCity, b.DropAddress)) AS CitiesRoute,
                    ISNULL(b.VehicleType, 'Medium Truck') AS VehicleType,
                    ISNULL(ld.LoadType, 'Cargo') + ' • ' + CAST(CAST(ISNULL(ld.WeightKg, 0) AS INT) AS VARCHAR) + ' kg • ' + CAST(ISNULL(ld.PackageCount, 0) AS VARCHAR) + ' pkgs' AS LoadSummary,
                    N'₹' + FORMAT(ROUND(ISNULL(b.BaseFare, 8000) * 0.70, 0), 'N0') AS TotalPayout
                FROM Bookings b
                LEFT JOIN BookingLoadDetails ld ON b.BookingId = ld.BookingId
                WHERE b.DriverId IS NULL AND b.BookingStatus = 'Pending'
                ORDER BY b.BookingId DESC");

            rptOpenTrips.DataSource = dtOpen;
            rptOpenTrips.DataBind();
            litNoOpenTrips.Visible = dtOpen.Rows.Count == 0;

            DataTable dtRoute = DbHelper.ExecuteQuery(@"
                SELECT TOP 1
                    (ISNULL(b.PickupCity, '') + ': ' + b.PickupAddress) AS PickupFull,
                    (ISNULL(b.DropCity, '') + ': ' + b.DropAddress) AS DropFull,
                    FORMAT(b.PreferredDate, 'hh:mm tt') AS PickupTime,
                    FORMAT(DATEADD(hour, 4, b.PreferredDate), 'hh:mm tt') + ' (Est.)' AS DropTime
                FROM Bookings b
                WHERE b.DriverId = @DriverId AND b.BookingStatus IN ('Ongoing', 'Confirmed')
                ORDER BY CASE WHEN b.BookingStatus = 'Ongoing' THEN 0 ELSE 1 END, b.PreferredDate ASC",
                new SqlParameter("@DriverId", driverId));

            if (dtRoute.Rows.Count > 0)
            {
                var r = dtRoute.Rows[0];
                litPickupLoc.Text = Server.HtmlEncode(r["PickupFull"].ToString());
                litPickupTime.Text = r["PickupTime"].ToString();
                litDropLoc.Text = Server.HtmlEncode(r["DropFull"].ToString());
                litDropTime.Text = r["DropTime"].ToString();
            }
            else
            {
                litPickupLoc.Text = "No active trip";
                litPickupTime.Text = "-";
                litDropLoc.Text = "Confirm an open trip above to get started";
                litDropTime.Text = "-";
            }
        }

        protected void rptOpenTrips_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AcceptTrip")
            {
                int bookingId;
                if (int.TryParse(e.CommandArgument.ToString(), out bookingId))
                {
                    int driverId = DbHelper.GetLoggedInDriverId(Session);
                    string msg;
                    bool ok = DbHelper.AcceptTripByDriver(bookingId, driverId, out msg);
                    lblDashMsg.ForeColor = ok ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                    lblDashMsg.Text = msg;
                    LoadDriverDashboard();
                }
            }
        }
    }
}
