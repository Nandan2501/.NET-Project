using System;
using System.Web.UI.WebControls;

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
                string loadType = Session["LoadType"].ToString().Trim();
                ListItem item = ddlLoadType.Items.FindByText(loadType);
                if (item != null)
                {
                    ddlLoadType.ClearSelection();
                    item.Selected = true;
                }
            }

            if (Session["Weight"] != null)
                txtWeight.Text = Session["Weight"].ToString();

            if (Session["Packages"] != null)
                txtPackages.Text = Session["Packages"].ToString();

            if (Session["Length"] != null)
                txtLength.Text = Session["Length"].ToString();

            if (Session["Width"] != null)
                txtWidth.Text = Session["Width"].ToString();

            if (Session["Height"] != null)
                txtHeight.Text = Session["Height"].ToString();

            if (Session["SpecialHandling"] != null)
                txtHandling.Text = Session["SpecialHandling"].ToString();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            SaveToSession();
            Response.Redirect("BookTransportation.aspx");
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            SaveToSession();
            Response.Redirect("BT3.aspx");
        }

        private void SaveToSession()
        {
            Session["LoadType"] = ddlLoadType.SelectedItem.Text.Trim();
            Session["Weight"] = CleanNumeric(txtWeight.Text);
            Session["Packages"] = CleanNumeric(txtPackages.Text);
            Session["Length"] = CleanNumeric(txtLength.Text);
            Session["Width"] = CleanNumeric(txtWidth.Text);
            Session["Height"] = CleanNumeric(txtHeight.Text);
            Session["SpecialHandling"] = txtHandling.Text.Trim();
        }

        private static string CleanNumeric(string input)
        {
            if (string.IsNullOrWhiteSpace(input)) return string.Empty;
            return input.Replace("L:", "").Replace("W:", "").Replace("H:", "").Trim();
        }
    }
}
