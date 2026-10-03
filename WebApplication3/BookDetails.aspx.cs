using System;

namespace WebApplication3
{
    public partial class BookingDetails : System.Web.UI.Page
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
            string bookingId = Session["SelectedBookingId"]?.ToString();

            if (string.IsNullOrEmpty(bookingId))
            {
                bookingId = "TRP-1004";
            }

            lblBookingTitle.InnerText = "#" + bookingId;

            // Sample booking information
            lblStatus.InnerText = "Ongoing";
            lblBookingDate.InnerText = "17 Aug 2026, 10:00 AM";
            lblPaymentStatus.InnerText = "Paid";
            lblPaymentMethod.InnerText = "Online";
            lblTotalAmount.InnerText = "₹250.00";

            // Load details
            lblVehicle.InnerText = "Medium Truck (6-Wheeler)";
            lblLoadType.InnerText = "Industrial Raw Material";
            lblWeight.InnerText = "4.5 Tons";

            // Customer details
            lblCompany.InnerText = "Lumen Enterprises";
            lblContactPerson.InnerText = "Vraj Akbari";
            lblEmail.InnerText = "vraj55652@gmail.com";
            lblPhone.InnerText = "+919865745215";
        }
    }
}