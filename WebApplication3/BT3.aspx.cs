using System;

namespace WebApplication3
{
    public partial class BT3 : System.Web.UI.Page
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
            lblFrom.InnerText =
                Session["FromLocation"]?.ToString()
                ?? "Rajkot, Gujarat";

            lblTo.InnerText =
                Session["ToLocation"]?.ToString()
                ?? "Baroda, Gujarat";

            lblVehicle.InnerText =
                Session["VehicleType"]?.ToString()
                ?? "Medium Truck (6-Wheeler)";

            lblDate.InnerText =
                Session["PreferredDate"]?.ToString()
                ?? "Monday, 17 Aug 2026";

            lblInstructions.InnerText =
                Session["Instructions"]?.ToString()
                ?? "Fragile load. Needs careful stacking.";

            lblLoadType.InnerText =
                Session["LoadType"]?.ToString()
                ?? "Packaged Goods";

            lblWeight.InnerText =
                (Session["Weight"]?.ToString() ?? "850") + " kg";

            lblPackages.InnerText =
                (Session["Packages"]?.ToString() ?? "12") + " Packages";

            string length =
                Session["Length"]?.ToString() ?? "120";

            string width =
                Session["Width"]?.ToString() ?? "80";

            string height =
                Session["Height"]?.ToString() ?? "60";

            lblDimensions.InnerText =
                length + " x " + width + " x " + height + " cm";

            lblHandling.InnerText =
                Session["SpecialHandling"]?.ToString()
                ?? "Temperature sensitive. Keep below 25°C.";
        }


        // BACK BUTTON
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("BT2.aspx");
        }


        // CONFIRM BUTTON
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string bookingId =
                "BK-" + new Random().Next(1000, 9999);

            Session["BookingID"] = bookingId;

            Response.Redirect("ConfirmBook.aspx");
        }
    }
}