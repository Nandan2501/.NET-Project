using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication3.Driver
{
    public partial class ActiveTrip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadActiveTrip();
            }
        }

        private void LoadActiveTrip()
        {
            int driverId = DbHelper.GetLoggedInDriverId(Session);
            string bookingNo = Request.QueryString["id"];

            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT TOP 1 
                    b.BookingId,
                    b.BookingNumber,
                    b.BookingStatus,
                    ISNULL(b.PickupCity, b.PickupAddress) AS PickupCity,
                    ISNULL(b.DropCity, b.DropAddress) AS DropCity,
                    b.PickupAddress,
                    b.DropAddress,
                    ISNULL(b.BaseFare, 8000) AS BaseFare,
                    FORMAT(b.PreferredDate, 'dd MMM, hh:mm tt') AS PickupTime,
                    FORMAT(DATEADD(hour, 4, b.PreferredDate), 'dd MMM, hh:mm tt') AS DropTime,
                    ISNULL(b.DistanceKm, 210) AS DistanceKm,
                    ISNULL(ld.LoadType, 'Standard Cargo') AS LoadType,
                    ISNULL(ld.WeightKg, 850) AS WeightKg,
                    ISNULL(ld.PackageCount, 1) AS PackageCount,
                    ISNULL(NULLIF(ld.SpecialHandling, ''), 'Standard') AS SpecialHandling,
                    ISNULL(u.FullName, 'Customer') + ' (' + ISNULL(u.Phone, '-') + ')' AS CustomerContact,
                    ISNULL((SELECT TOP 1 MilestoneStatus FROM TripMilestones tm WHERE tm.BookingId = b.BookingId AND tm.MilestoneType = 'Pickup'), 'Pending') AS PickupMs,
                    ISNULL((SELECT TOP 1 MilestoneStatus FROM TripMilestones tm WHERE tm.BookingId = b.BookingId AND tm.MilestoneType = 'Drop'), 'Pending') AS DropMs
                FROM Bookings b
                LEFT JOIN BookingLoadDetails ld ON b.BookingId = ld.BookingId
                LEFT JOIN Users u ON b.CustomerId = u.UserId
                WHERE b.DriverId = @DriverId
                  AND ((@BookingNo IS NOT NULL AND b.BookingNumber = @BookingNo)
                       OR (@BookingNo IS NULL AND b.BookingStatus IN ('Ongoing', 'Confirmed')))
                ORDER BY CASE WHEN b.BookingStatus = 'Ongoing' THEN 0 ELSE 1 END, b.BookingId DESC",
                new SqlParameter("@DriverId", driverId),
                new SqlParameter("@BookingNo", string.IsNullOrEmpty(bookingNo) ? (object)DBNull.Value : bookingNo.Trim()));

            if (dt.Rows.Count > 0)
            {
                var r = dt.Rows[0];
                int bookingId = Convert.ToInt32(r["BookingId"]);
                ViewState["ActiveBookingId"] = bookingId;
                string status = r["BookingStatus"].ToString();
                string pickupMs = r["PickupMs"].ToString();
                string dropMs = r["DropMs"].ToString();

                decimal totalShare = DbHelper.GetDriverTotalShare(Convert.ToDecimal(r["BaseFare"]));
                decimal half1 = Math.Round(totalShare / 2m, 0);
                decimal half2 = totalShare - half1;

                litTrackingId.Text = r["BookingNumber"].ToString();
                litTripStatus.Text = status;
                litPickupLocation.Text = Server.HtmlEncode(r["PickupCity"] + " — " + r["PickupAddress"]);
                litDropLocation.Text = Server.HtmlEncode(r["DropCity"] + " — " + r["DropAddress"]);
                litPickupTime.Text = r["PickupTime"].ToString();
                litDropTime.Text = r["DropTime"].ToString();
                litCustomer.Text = Server.HtmlEncode(r["CustomerContact"].ToString());
                litCities.Text = Server.HtmlEncode(r["PickupCity"] + " → " + r["DropCity"]);
                litDistance.Text = Convert.ToDecimal(r["DistanceKm"]).ToString("N0") + " km";
                litLoadType.Text = Server.HtmlEncode(r["LoadType"].ToString());
                litSpecialHandling.Text = Server.HtmlEncode(r["SpecialHandling"].ToString());

                decimal weight = Convert.ToDecimal(r["WeightKg"]);
                string weightText = weight >= 1000 ? (weight / 1000).ToString("0.0") + " Tons" : weight.ToString("N0") + " kg";
                litCargoWeight.Text = weightText + " (" + r["PackageCount"] + " pkgs)";

                int paidHalf1 = Convert.ToInt32(DbHelper.ExecuteScalar(
                    "SELECT COUNT(1) FROM DriverEarnings WHERE BookingId = @B AND EarningStage IN ('Half1', 'Full') AND PayoutStatus = 'Paid'",
                    new SqlParameter("@B", bookingId)) ?? 0);
                int paidHalf2 = Convert.ToInt32(DbHelper.ExecuteScalar(
                    "SELECT COUNT(1) FROM DriverEarnings WHERE BookingId = @B AND EarningStage IN ('Half2', 'Full') AND PayoutStatus = 'Paid'",
                    new SqlParameter("@B", bookingId)) ?? 0);

                litHalf1Status.Text = paidHalf1 > 0 ? "₹" + half1.ToString("N0") + " Credited" : "₹" + half1.ToString("N0") + " (Pending customer arrival confirm)";
                litHalf2Status.Text = paidHalf2 > 0 ? "₹" + half2.ToString("N0") + " Credited" : "₹" + half2.ToString("N0") + " (Pending customer completion confirm)";

                btnMarkArrived.Visible = status.Equals("Confirmed", StringComparison.OrdinalIgnoreCase) && !pickupMs.Equals("DriverArrived", StringComparison.OrdinalIgnoreCase);
                btnMarkDelivered.Visible = status.Equals("Ongoing", StringComparison.OrdinalIgnoreCase) && !dropMs.Equals("DriverDelivered", StringComparison.OrdinalIgnoreCase);

                if (status == "Confirmed" && pickupMs == "DriverArrived")
                    litPayoutBanner.Text = "You marked arrived at pickup. Waiting for customer to confirm your arrival so 1st half (₹" + half1.ToString("N0") + ") is credited.";
                else if (status == "Confirmed")
                    litPayoutBanner.Text = "Trip confirmed! Drive to pickup location and click 'I Have Arrived at Pickup'.";
                else if (status == "Ongoing" && dropMs == "DriverDelivered")
                    litPayoutBanner.Text = "1st half (₹" + half1.ToString("N0") + ") credited! You marked delivery complete — waiting for customer confirmation to release 2nd half (₹" + half2.ToString("N0") + ").";
                else if (status == "Ongoing")
                    litPayoutBanner.Text = "1st half (₹" + half1.ToString("N0") + ") credited! Complete the delivery and click 'Mark Trip Delivered'.";
                else if (status == "Completed")
                    litPayoutBanner.Text = "Trip completed! Both halves (₹" + totalShare.ToString("N0") + ") have been credited to your account.";
                else
                    litPayoutBanner.Text = "Trip status: " + status;
            }
            else
            {
                litTrackingId.Text = "No Active Trip";
                litTripStatus.Text = "Idle";
                btnMarkArrived.Visible = false;
                btnMarkDelivered.Visible = false;
            }
        }

        protected void btnMarkArrived_Click(object sender, EventArgs e)
        {
            if (ViewState["ActiveBookingId"] == null) return;
            int bookingId = Convert.ToInt32(ViewState["ActiveBookingId"]);

            DbHelper.ExecuteNonQuery(@"
                UPDATE TripMilestones
                SET MilestoneStatus = 'DriverArrived', ActualTime = SYSDATETIME()
                WHERE BookingId = @BookingId AND MilestoneType = 'Pickup';",
                new SqlParameter("@BookingId", bookingId));

            lblActiveMsg.Text = "Marked arrived at pickup! Waiting for customer confirmation to credit 1st half (50%) to your account.";
            LoadActiveTrip();
        }

        protected void btnMarkDelivered_Click(object sender, EventArgs e)
        {
            if (ViewState["ActiveBookingId"] == null) return;
            int bookingId = Convert.ToInt32(ViewState["ActiveBookingId"]);

            DbHelper.ExecuteNonQuery(@"
                UPDATE TripMilestones
                SET MilestoneStatus = 'DriverDelivered', ActualTime = SYSDATETIME()
                WHERE BookingId = @BookingId AND MilestoneType = 'Drop';",
                new SqlParameter("@BookingId", bookingId));

            lblActiveMsg.Text = "Marked trip delivered! Waiting for customer confirmation to credit 2nd half (50%) to your account.";
            LoadActiveTrip();
        }
    }
}
