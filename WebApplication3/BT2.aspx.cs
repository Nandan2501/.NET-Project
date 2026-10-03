using System;

namespace WebApplication3
{
    public partial class BT2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSavedDetails();
            }
        }

        private void LoadSavedDetails()
        {
            if (Session["LoadType"] != null)
            {
                string loadType = Session["LoadType"].ToString();

                if (ddlLoadType.Items.FindByText(loadType) != null)
                {
                    ddlLoadType.SelectedValue = loadType;
                }
            }

            if (Session["Weight"] != null)
            {
                txtWeight.Text = Session["Weight"].ToString();
            }

            if (Session["Packages"] != null)
            {
                txtPackages.Text = Session["Packages"].ToString();
            }

            if (Session["Length"] != null)
            {
                txtLength.Text = Session["Length"].ToString();
            }

            if (Session["Width"] != null)
            {
                txtWidth.Text = Session["Width"].ToString();
            }

            if (Session["Height"] != null)
            {
                txtHeight.Text = Session["Height"].ToString();
            }

            if (Session["SpecialHandling"] != null)
            {
                txtHandling.Text =
                    Session["SpecialHandling"].ToString();
            }
        }


        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookTransportation.aspx");
        }


        protected void btnNext_Click(object sender, EventArgs e)
        {
            // Save Load Details

            Session["LoadType"] =
                ddlLoadType.SelectedItem.Text;

            Session["Weight"] =
                txtWeight.Text.Trim();

            Session["Packages"] =
                txtPackages.Text.Trim();

            Session["Length"] =
                txtLength.Text.Trim();

            Session["Width"] =
                txtWidth.Text.Trim();

            Session["Height"] =
                txtHeight.Text.Trim();

            Session["SpecialHandling"] =
                txtHandling.Text.Trim();


            // Go to Step 3

            Response.Redirect("BT3.aspx");
        }
    }
}