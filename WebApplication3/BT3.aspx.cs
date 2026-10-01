using System;

namespace WebApplication3
{
    public partial class ReviewConfirm : System.Web.UI.Page
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
            // =========================
            // ROUTE DETAILS
            // =========================

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
                ?? "Not selected";

            lblInstructions.InnerText =
                Session["Instructions"]?.ToString()
                ?? "None";


            // =========================
            // LOAD DETAILS
            // =========================

            lblLoadType.InnerText =
                Session["LoadType"]?.ToString()
                ?? "Packaged Goods";

            lblWeight.InnerText =
                (Session["Weight"]?.ToString() ?? "0")
                + " kg";

            lblPackages.InnerText =
                (Session["Packages"]?.ToString() ?? "0")
                + " Packages";


            string length =
                Session["Length"]?.ToString()
                ?? "0";

            string width =
                Session["Width"]?.ToString()
                ?? "0";

            string height =
                Session["Height"]?.ToString()
                ?? "0";


            lblDimensions.InnerText =
                length + " x " +
                width + " x " +
                height + " cm";


            lblHandling.InnerText =
                Session["SpecialHandling"]?.ToString()
                ?? "None";
        }


        // =========================
        // BACK BUTTON
        // =========================

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoadDetails.aspx");
        }


        // =========================
        // CONFIRM BUTTON
        // =========================

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            // Temporary booking ID
            // Database saving can be added later.

            string bookingId =
                "BK-" +
                new Random().Next(1000, 9999);

            Session["BookingID"] = bookingId;

            Response.Redirect("BookingSuccess.aspx");
        }
    }
}