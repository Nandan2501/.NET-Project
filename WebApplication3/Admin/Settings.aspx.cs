using System;
using System.Data;
using System.Data.SqlClient;

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
            try
            {
                DataTable dt = DbHelper.ExecuteQuery("SELECT SettingKey, SettingValue FROM AppSettings");
                foreach (DataRow r in dt.Rows)
                {
                    string k = r["SettingKey"]?.ToString();
                    string v = r["SettingValue"]?.ToString() ?? "";

                    if (k == "CompanyName") txtCompanyName.Text = v;
                    else if (k == "State") txtState.Text = v;
                    else if (k == "StreetAddress") txtStreetAddress.Text = v;
                    else if (k == "Pincode") txtPincode.Text = v;
                    else if (k == "City") txtCity.Text = v;
                    else if (k == "Country" && ddlCountry.Items.FindByValue(v) != null) ddlCountry.SelectedValue = v;
                    else if (k == "BillingEmail") txtBillingEmail.Text = v;
                }
            }
            catch
            {
                // Fallbacks
                txtCompanyName.Text = "tata";
                txtState.Text = "Gujarat";
                txtStreetAddress.Text = "401-404, Dev Prime, Corporate Road";
                txtPincode.Text = "380051";
                txtCity.Text = "Ahmedabad";
                txtBillingEmail.Text = "accounts@transpo.com";
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string companyName = txtCompanyName.Text.Trim();
            string state = txtState.Text.Trim();
            string address = txtStreetAddress.Text.Trim();
            string pincode = txtPincode.Text.Trim();
            string city = txtCity.Text.Trim();
            string country = ddlCountry.SelectedValue;
            string email = txtBillingEmail.Text.Trim();

            if (string.IsNullOrWhiteSpace(companyName) || string.IsNullOrWhiteSpace(state) ||
                string.IsNullOrWhiteSpace(address) || string.IsNullOrWhiteSpace(pincode) ||
                string.IsNullOrWhiteSpace(city) || string.IsNullOrWhiteSpace(email))
            {
                lblMessage.Text = "Please fill in all required company profile fields.";
                return;
            }

            try
            {
                SaveSetting("CompanyName", companyName);
                SaveSetting("State", state);
                SaveSetting("StreetAddress", address);
                SaveSetting("Pincode", pincode);
                SaveSetting("City", city);
                SaveSetting("Country", country);
                SaveSetting("BillingEmail", email);

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Company profile updated and saved to database successfully.";
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error saving settings: " + ex.Message;
            }
        }

        private void SaveSetting(string key, string value)
        {
            DbHelper.ExecuteNonQuery(@"
                IF EXISTS (SELECT 1 FROM AppSettings WHERE SettingKey = @Key)
                    UPDATE AppSettings SET SettingValue = @Val, UpdatedAt = SYSUTCDATETIME() WHERE SettingKey = @Key
                ELSE
                    INSERT INTO AppSettings (SettingKey, SettingValue) VALUES (@Key, @Val)",
                new SqlParameter("@Key", key),
                new SqlParameter("@Val", value ?? ""));
        }
    }
}
