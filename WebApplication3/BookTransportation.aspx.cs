using System;

namespace WebApplication3
{
    public partial class BookTransportation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(txtDate.Text))
                {
                    txtDate.Text = DateTime.Now
                        .AddDays(1)
                        .ToString("yyyy-MM-dd");
                }
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            // Save Step 1 details
            Session["FromLocation"] = txtFrom.Text.Trim();

            Session["ToLocation"] = txtTo.Text.Trim();

            Session["VehicleType"] = ddlVehicle.SelectedItem.Text;

            Session["PreferredDate"] = txtDate.Text;

            Session["Instructions"] = txtInstructions.Text.Trim();

            // Go to Step 2
            Response.Redirect("BT2.aspx");
        }
    }
}