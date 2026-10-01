using System;

namespace WebApplication3
{
    public partial class LoadDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Do not redirect here while testing
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookTransportation.aspx");
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            // Save Step 2 information

            Session["LoadType"] = ddlLoadType.SelectedValue;

            Session["Weight"] = txtWeight.Text.Trim();

            Session["Packages"] = txtPackages.Text.Trim();

            Session["Length"] = txtLength.Text.Trim();

            Session["Width"] = txtWidth.Text.Trim();

            Session["Height"] = txtHeight.Text.Trim();

            Session["SpecialHandling"] =
                txtSpecialHandling.Text.Trim();


            // Go directly to Step 3

            Response.Redirect("ReviewConfirm.aspx");
        }
    }
}