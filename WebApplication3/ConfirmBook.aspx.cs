using System;

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


        // =========================================================
        // LOAD BOOKING DETAILS
        // =========================================================

        private void LoadBookingDetails()
        {
            // Booking ID

            lblBookingId.Text =
                Session["BookingID"]?.ToString()
                ?? "BK-2026-08174";


            // Route

            string from =
                Session["FromLocation"]?.ToString()
                ?? "Rajkot, Gujarat";

            string to =
                Session["ToLocation"]?.ToString()
                ?? "Baroda, Gujarat";

            lblRoute.Text =
                from + " → " + to;


            // Vehicle

            lblVehicle.Text =
                Session["VehicleType"]?.ToString()
                ?? "Medium Truck (6-Wheeler)";


            // Load

            string packages =
                Session["Packages"]?.ToString()
                ?? "12";

            string weight =
                Session["Weight"]?.ToString()
                ?? "850";

            lblLoad.Text =
                packages +
                " Packages (" +
                weight +
                " kg Total)";


            // Pickup Date

            string date =
                Session["PreferredDate"]?.ToString()
                ?? "2026-08-17";

            DateTime pickupDate;

            if (DateTime.TryParse(date, out pickupDate))
            {
                lblPickupDate.Text =
                    pickupDate.ToString("dddd, dd MMMM yyyy");
            }
            else
            {
                lblPickupDate.Text = date;
            }
        }


        // =========================================================
        // BOOK ANOTHER
        // =========================================================

        protected void btnBookAnother_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect("BookTransportation.aspx");
        }


        // =========================================================
        // VIEW MY BOOKINGS
        // =========================================================

        protected void btnMyBookings_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect("Bookings.aspx");
        }
    }
}