using System;

namespace WebApplication3
{
    public partial class AddDriver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Drivers.aspx");
        }

        protected void btnSaveDriver_Click(object sender, EventArgs e)
        {
            // Database insertion can be added here later.

            Response.Redirect("Drivers.aspx");
        }
    }
}