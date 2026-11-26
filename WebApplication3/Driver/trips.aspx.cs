using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication3.Driver
{
    public partial class trips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["TripFilter"] = "ALL";
                LoadAvailableTrips();
                LoadMyTrips();
            }
        }

        private void LoadAvailableTrips()
        {
            DataTable dtOpen = DbHelper.ExecuteQuery(@"
                SELECT 
                    b.BookingId,
                    b.BookingNumber,
                    (ISNULL(b.PickupCity, b.PickupAddress) + N' → ' + ISNULL(b.DropCity, b.DropAddress)) AS CitiesRoute,
                    b.PickupAddress,
                    b.DropAddress,
                    ISNULL(b.VehicleType, 'Medium Truck') AS VehicleType,
                    FORMAT(b.PreferredDate, 'dd MMM yyyy, hh:mm tt') AS DepartureTime,
                    ISNULL(ld.LoadType, 'Cargo') AS LoadType,
                    CAST(CAST(ISNULL(ld.WeightKg, 0) AS INT) AS VARCHAR) AS WeightKg,
                    ISNULL(ld.PackageCount, 0) AS PackageCount,
                    CAST(CAST(ISNULL(ld.LengthCm, 0) AS INT) AS VARCHAR) + 'x' +
                    CAST(CAST(ISNULL(ld.WidthCm, 0) AS INT) AS VARCHAR) + 'x' +
                    CAST(CAST(ISNULL(ld.HeightCm, 0) AS INT) AS VARCHAR) + ' cm' AS Dimensions,
                    ISNULL(NULLIF(ld.SpecialHandling, ''), 'Standard') AS SpecialHandling,
                    N'₹' + FORMAT(ROUND(ISNULL(b.BaseFare, 8000) * 0.70, 0), 'N0') AS TotalPayout,
                    N'₹' + FORMAT(ROUND((ISNULL(b.BaseFare, 8000) * 0.70) / 2.0, 0), 'N0') AS HalfPayout
                FROM Bookings b
                LEFT JOIN BookingLoadDetails ld ON b.BookingId = ld.BookingId
                WHERE b.DriverId IS NULL AND b.BookingStatus = 'Pending'
                ORDER BY b.BookingId DESC");

            rptAvailableTrips.DataSource = dtOpen;
            rptAvailableTrips.DataBind();
            litOpenCount.Text = dtOpen.Rows.Count.ToString();
            litNoOpen.Visible = dtOpen.Rows.Count == 0;
        }

        private void LoadMyTrips()
        {
            int driverId = DbHelper.GetLoggedInDriverId(Session);
            string filter = ViewState["TripFilter"]?.ToString() ?? "ALL";

            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT 
                    b.BookingId,
                    b.BookingNumber,
                    (ISNULL(b.PickupCity, b.PickupAddress) + N' → ' + ISNULL(b.DropCity, b.DropAddress)) AS Route,
                    FORMAT(b.PreferredDate, 'dd MMM yyyy, hh:mm tt') AS DepartureTime,
                    b.BookingStatus,
                    ISNULL(ld.LoadType, 'Cargo') + ' • ' + CAST(CAST(ISNULL(ld.WeightKg, 0) AS INT) AS VARCHAR) + ' kg (' + CAST(ISNULL(ld.PackageCount, 0) AS VARCHAR) + ' pkgs)' AS LoadSummary,
                    N'₹' + FORMAT(ISNULL((SELECT SUM(de.NetAmount) FROM DriverEarnings de WHERE de.BookingId = b.BookingId AND de.DriverId = @DriverId AND de.PayoutStatus = 'Paid'), 0), 'N0') AS CreditedLabel,
                    N'₹' + FORMAT(ROUND(ISNULL(b.BaseFare, 8000) * 0.70, 0), 'N0') AS TotalShareLabel,
                    ISNULL((SELECT TOP 1 MilestoneStatus FROM TripMilestones tm WHERE tm.BookingId = b.BookingId AND tm.MilestoneType = 'Pickup'), 'Pending') AS PickupMs,
                    ISNULL((SELECT TOP 1 MilestoneStatus FROM TripMilestones tm WHERE tm.BookingId = b.BookingId AND tm.MilestoneType = 'Drop'), 'Pending') AS DropMs
                FROM Bookings b
                LEFT JOIN BookingLoadDetails ld ON b.BookingId = ld.BookingId
                WHERE b.DriverId = @DriverId
                  AND (@Filter = 'ALL' OR b.BookingStatus = @Filter)
                ORDER BY b.BookingId DESC",
                new SqlParameter("@DriverId", driverId),
                new SqlParameter("@Filter", filter));

            dt.Columns.Add("MilestoneNote", typeof(string));
            dt.Columns.Add("CanMarkArrived", typeof(bool));
            dt.Columns.Add("CanMarkDelivered", typeof(bool));

            foreach (DataRow r in dt.Rows)
            {
                string st = r["BookingStatus"].ToString();
                string pMs = r["PickupMs"].ToString();
                string dMs = r["DropMs"].ToString();

                bool canArrived = st.Equals("Confirmed", StringComparison.OrdinalIgnoreCase) && !pMs.Equals("DriverArrived", StringComparison.OrdinalIgnoreCase);
                bool canDelivered = st.Equals("Ongoing", StringComparison.OrdinalIgnoreCase) && !dMs.Equals("DriverDelivered", StringComparison.OrdinalIgnoreCase);
                r["CanMarkArrived"] = canArrived;
                r["CanMarkDelivered"] = canDelivered;

                if (st == "Confirmed" && pMs == "DriverArrived")
                    r["MilestoneNote"] = "Arrived at pickup — waiting customer confirm (50%)";
                else if (st == "Confirmed")
                    r["MilestoneNote"] = "Go to pickup & click Arrived";
                else if (st == "Ongoing" && dMs == "DriverDelivered")
                    r["MilestoneNote"] = "Delivered — waiting customer confirm (2nd 50%)";
                else if (st == "Ongoing")
                    r["MilestoneNote"] = "1st half (50%) credited — in transit";
                else if (st == "Completed")
                    r["MilestoneNote"] = "100% credited to account";
                else
                    r["MilestoneNote"] = "";
            }

            rptTrips.DataSource = dt;
            rptTrips.DataBind();
        }

        protected void FilterTrips_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (btn != null)
            {
                ViewState["TripFilter"] = btn.CommandArgument;
                UpdateFilterStyles(btn.CommandArgument);
                LoadMyTrips();
            }
        }

        private void UpdateFilterStyles(string activeFilter)
        {
            btnFilterAll.CssClass = activeFilter == "ALL" ? "driver-trips-filter-active" : "btn btn-outline-secondary btn-sm";
            btnFilterConfirmed.CssClass = activeFilter == "Confirmed" ? "driver-trips-filter-active" : "btn btn-outline-secondary btn-sm";
            btnFilterOngoing.CssClass = activeFilter == "Ongoing" ? "driver-trips-filter-active" : "btn btn-outline-secondary btn-sm";
            btnFilterCompleted.CssClass = activeFilter == "Completed" ? "driver-trips-filter-active" : "btn btn-outline-secondary btn-sm";
            btnFilterCancelled.CssClass = activeFilter == "Cancelled" ? "driver-trips-filter-active" : "btn btn-outline-secondary btn-sm";
        }

        protected string GetTripStatusClass(string status)
        {
            switch ((status ?? "").ToLowerInvariant())
            {
                case "ongoing":
                case "confirmed":
                    return "trip-status in-transit";
                case "completed":
                    return "trip-status delivered";
                case "cancelled":
                    return "trip-status cancelled";
                default:
                    return "trip-status";
            }
        }

        protected void rptTrips_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int bookingId;
            if (!int.TryParse(e.CommandArgument.ToString(), out bookingId))
                return;

            int driverId = DbHelper.GetLoggedInDriverId(Session);

            if (e.CommandName == "AcceptTrip")
            {
                string msg;
                bool ok = DbHelper.AcceptTripByDriver(bookingId, driverId, out msg);
                lblTripsMessage.ForeColor = ok ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                lblTripsMessage.Text = msg;
            }
            else if (e.CommandName == "MarkArrived")
            {
                DbHelper.ExecuteNonQuery(@"
                    UPDATE TripMilestones
                    SET MilestoneStatus = 'DriverArrived', ActualTime = SYSDATETIME()
                    WHERE BookingId = @BookingId AND MilestoneType = 'Pickup'",
                    new SqlParameter("@BookingId", bookingId));

                lblTripsMessage.ForeColor = System.Drawing.Color.Green;
                lblTripsMessage.Text = "Arrival marked! Customer can now confirm your arrival to credit the 1st half (50%) to your account.";
            }
            else if (e.CommandName == "MarkDelivered")
            {
                DbHelper.ExecuteNonQuery(@"
                    UPDATE TripMilestones
                    SET MilestoneStatus = 'DriverDelivered', ActualTime = SYSDATETIME()
                    WHERE BookingId = @BookingId AND MilestoneType = 'Drop'",
                    new SqlParameter("@BookingId", bookingId));

                lblTripsMessage.ForeColor = System.Drawing.Color.Green;
                lblTripsMessage.Text = "Delivery marked! Customer can now confirm trip completion to credit the 2nd half (50%) to your account.";
            }

            LoadAvailableTrips();
            LoadMyTrips();
        }
    }
}
