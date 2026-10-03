using System;

namespace WebApplication3
{
    public partial class AdminSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCompanyDetails();
            }
        }


        private void LoadCompanyDetails()
        {
            txtCompanyName.Text = "tata";
            txtState.Text = "Gujarat";
            txtStreetAddress.Text = "401-404, Dev Prime, Corporate Road";
            txtPincode.Text = "380051";
            txtCity.Text = "Ahmedabad";

            if (ddlCountry.Items.FindByValue("India") != null)
            {
                ddlCountry.SelectedValue = "India";
            }

            txtBillingEmail.Text = "accounts@transpo.com";
        }


        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            string companyName = txtCompanyName.Text.Trim();
            string state = txtState.Text.Trim();
            string address = txtStreetAddress.Text.Trim();
            string pincode = txtPincode.Text.Trim();
            string city = txtCity.Text.Trim();
            string country = ddlCountry.SelectedValue;
            string email = txtBillingEmail.Text.Trim();


            if (string.IsNullOrWhiteSpace(companyName))
            {
                lblMessage.Text = "Please enter company name.";
                return;
            }


            if (string.IsNullOrWhiteSpace(state))
            {
                lblMessage.Text = "Please enter state / province.";
                return;
            }


            if (string.IsNullOrWhiteSpace(address))
            {
                lblMessage.Text = "Please enter street address.";
                return;
            }


            if (string.IsNullOrWhiteSpace(pincode))
            {
                lblMessage.Text = "Please enter pincode.";
                return;
            }


            if (string.IsNullOrWhiteSpace(city))
            {
                lblMessage.Text = "Please enter city.";
                return;
            }


            if (string.IsNullOrWhiteSpace(email))
            {
                lblMessage.Text = "Please enter billing contact email.";
                return;
            }


            lblMessage.Text =
                "Company profile updated successfully.";
        }
    }
}