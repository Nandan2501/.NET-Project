using System;

namespace WebApplication3
{
    public partial class BookTransportation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set today's date as the minimum selectable date
                txtPreferredDate.Attributes["min"] =
                    DateTime.Today.ToString("yyyy-MM-dd");

                // Default date
                txtPreferredDate.Text =
                    DateTime.Today.ToString("yyyy-MM-dd");
            }
        }


        protected void btnNext_Click(object sender, EventArgs e)
        {
            string fromLocation =
                txtFromLocation.Text.Trim();

            string toLocation =
                txtToLocation.Text.Trim();

            string vehicle =
                ddlVehicleType.SelectedValue;

            string preferredDate =
                txtPreferredDate.Text.Trim();

            string instructions =
                txtInstructions.Text.Trim();


            // Validation

            if (string.IsNullOrEmpty(fromLocation))
            {
                lblMessage.Text =
                    "Please enter the starting location.";

                return;
            }


            if (string.IsNullOrEmpty(toLocation))
            {
                lblMessage.Text =
                    "Please enter the destination.";

                return;
            }


            if (string.IsNullOrEmpty(preferredDate))
            {
                lblMessage.Text =
                    "Please select a preferred date.";

                return;
            }


            // Save data temporarily in Session

            Session["FromLocation"] = fromLocation;
            Session["ToLocation"] = toLocation;
            Session["VehicleType"] = vehicle;
            Session["PreferredDate"] = preferredDate;
            Session["Instructions"] = instructions;


            // Go to next step

            Response.Redirect("LoadDetails.aspx");
        }
    }
}