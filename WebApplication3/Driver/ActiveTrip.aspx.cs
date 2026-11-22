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
            try
            {
                int driverId = DbHelper.GetLoggedInDriverId(Session);
                DataTable dt = DbHelper.ExecuteQuery(@"
                    SELECT TOP 1 
                        b.BookingNumber,
                        b.PickupAddress,
                        b.DropAddress,
                        FORMAT(b.PreferredDate, 'hh:mm tt') AS PickupTime,
                        FORMAT(DATEADD(hour, 4, b.PreferredDate), 'hh:mm tt') AS DropTime,
                        ISNULL(ld.WeightKg, 4200) AS WeightKg
                    FROM Bookings b
                    LEFT JOIN BookingLoadDetails ld ON b.BookingId = ld.BookingId
                    WHERE b.DriverId = @DriverId AND b.BookingStatus IN ('Ongoing', 'In Transit', 'Confirmed', 'Pending')
                    ORDER BY b.BookingId DESC",
                    new SqlParameter("@DriverId", driverId));

                if (dt.Rows.Count > 0)
                {
                    var r = dt.Rows[0];
                    litTrackingId.Text = r["BookingNumber"].ToString();
                    litPickupLocation.Text = r["PickupAddress"].ToString();
                    litDropLocation.Text = r["DropAddress"].ToString();
                    litPickupTime.Text = r["PickupTime"]?.ToString() ?? "10:00 AM";
                    litDropTime.Text = r["DropTime"]?.ToString() ?? "01:30 PM";
                    decimal weight = Convert.ToDecimal(r["WeightKg"]);
                    litCargoWeight.Text = (weight >= 1000 ? (weight / 1000).ToString("0.0") + " Tons" : weight + " kg");
                }
            }
            catch
            {
                // Fallbacks retained from template
            }
        }
    }
}
