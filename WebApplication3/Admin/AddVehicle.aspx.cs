using System;

namespace WebApplication3
{
    public partial class AddVehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Vehicles.aspx");
        }

        protected void btnAddVehicle_Click(object sender, EventArgs e)
        {
            // Add database insertion here later.

            Response.Redirect("Vehicles.aspx");
        }
    }
}