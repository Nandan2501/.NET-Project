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
            string bookingId = Session["BookingID"]?.ToString();
            if (!string.IsNullOrEmpty(bookingId))
            {
                DataTable dt = DbHelper.ExecuteQuery(@"
                    SELECT TOP 1
                        b.BookingNumber,
                        (b.PickupAddress + ' → ' + b.DropAddress) AS Route,
                        b.VehicleType,
                        FORMAT(b.PreferredDate, 'dddd, dd MMMM yyyy') AS FormattedDate,
                        ISNULL(ld.PackageCount, 12) AS PackageCount,
                        ISNULL(ld.WeightKg, 850) AS WeightKg
                    FROM Bookings b
                    LEFT JOIN BookingLoadDetails ld ON b.BookingId = ld.BookingId
                    WHERE b.BookingNumber = @BookingNo",
                    new SqlParameter("@BookingNo", bookingId));

                if (dt.Rows.Count > 0)
                {
                    var r = dt.Rows[0];
                    lblBookingId.Text = r["BookingNumber"].ToString();
                    lblRoute.Text = r["Route"].ToString();
                    lblVehicle.Text = r["VehicleType"].ToString();
                    lblLoad.Text = r["PackageCount"] + " Packages (" + r["WeightKg"] + " kg Total)";
                    lblPickupDate.Text = r["FormattedDate"].ToString();
                    return;
                }
            }

            lblBookingId.Text = bookingId ?? "BK-2026-08174";
            lblRoute.Text = (Session["FromLocation"] ?? "Rajkot, Gujarat") + " → " + (Session["ToLocation"] ?? "Baroda, Gujarat");
            lblVehicle.Text = Session["VehicleType"]?.ToString() ?? "Medium Truck (6-Wheeler)";
            lblLoad.Text = (Session["Packages"] ?? "12") + " Packages (" + (Session["Weight"] ?? "850") + " kg Total)";
            lblPickupDate.Text = Session["PreferredDate"]?.ToString() ?? DateTime.Now.ToString("dddd, dd MMMM yyyy");
        }

        protected void btnBookAnother_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookTransportation.aspx");
        }

        protected void btnViewBookings_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bookings.aspx");
        }
    }
}
