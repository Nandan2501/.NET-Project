using System;
using System.Data;
using System.IO;

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
                else if (k == "SmtpHost" && !string.IsNullOrEmpty(v)) txtSmtpHost.Text = v;
                else if (k == "SmtpPort" && !string.IsNullOrEmpty(v)) txtSmtpPort.Text = v;
                else if (k == "SmtpEmail") txtSmtpEmail.Text = v;
                else if (k == "CompanyLogoPath" && !string.IsNullOrEmpty(v))
                {
                    imgCompanyLogo.ImageUrl = v;
                    imgCompanyLogo.Visible = true;
                    litLogoEmoji.Visible = false;
                }
            }
        }

        protected void btnUploadLogo_Click(object sender, EventArgs e)
        {
            if (!fuCompanyLogo.HasFile)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please choose an image file first.";
                return;
            }

            string ext = Path.GetExtension(fuCompanyLogo.FileName)?.ToLowerInvariant();
            if (ext != ".png" && ext != ".jpg" && ext != ".jpeg" && ext != ".webp")
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Only PNG, JPG, or WEBP logos are allowed.";
                return;
            }

            string dir = Server.MapPath("~/Uploads/Company/");
            Directory.CreateDirectory(dir);
            string fileName = "logo_" + DateTime.Now.Ticks + ext;
            fuCompanyLogo.SaveAs(Path.Combine(dir, fileName));
            string relPath = "~/Uploads/Company/" + fileName;

            DbHelper.SaveAppSetting("CompanyLogoPath", relPath);
            imgCompanyLogo.ImageUrl = relPath;
            imgCompanyLogo.Visible = true;
            litLogoEmoji.Visible = false;

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Company logo uploaded and saved to database.";
        }

        protected void btnRemoveLogo_Click(object sender, EventArgs e)
        {
            DbHelper.SaveAppSetting("CompanyLogoPath", "");
            imgCompanyLogo.Visible = false;
            litLogoEmoji.Visible = true;
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Company logo removed.";
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

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
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please fill in all required company profile fields.";
                return;
            }

            try
            {
                DbHelper.SaveAppSetting("CompanyName", companyName);
                DbHelper.SaveAppSetting("State", state);
                DbHelper.SaveAppSetting("StreetAddress", address);
                DbHelper.SaveAppSetting("Pincode", pincode);
                DbHelper.SaveAppSetting("City", city);
                DbHelper.SaveAppSetting("Country", country);
                DbHelper.SaveAppSetting("BillingEmail", email);

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Company profile updated and saved to database successfully.";
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error saving settings: " + ex.Message;
            }
        }

        protected void btnSaveSmtp_Click(object sender, EventArgs e)
        {
            string host = string.IsNullOrWhiteSpace(txtSmtpHost.Text) ? "smtp.gmail.com" : txtSmtpHost.Text.Trim();
            string port = string.IsNullOrWhiteSpace(txtSmtpPort.Text) ? "587" : txtSmtpPort.Text.Trim();
            string smtpEmail = txtSmtpEmail.Text.Trim();
            string smtpPass = txtSmtpPassword.Text.Trim();

            if (string.IsNullOrWhiteSpace(smtpEmail))
            {
                lblSmtpMessage.ForeColor = System.Drawing.Color.Red;
                lblSmtpMessage.Text = "Please enter the sender Gmail address.";
                return;
            }

            DbHelper.SaveAppSetting("SmtpHost", host);
            DbHelper.SaveAppSetting("SmtpPort", port);
            DbHelper.SaveAppSetting("SmtpEmail", smtpEmail);
            DbHelper.SaveAppSetting("SmtpEnableSsl", "true");
            if (!string.IsNullOrWhiteSpace(smtpPass))
            {
                DbHelper.SaveAppSetting("SmtpPassword", smtpPass);
            }

            lblSmtpMessage.ForeColor = System.Drawing.Color.Green;
            lblSmtpMessage.Text = "Email SMTP settings saved to database.";
        }

        protected void btnTestEmail_Click(object sender, EventArgs e)
        {
            string toEmail = txtSmtpEmail.Text.Trim();
            if (string.IsNullOrWhiteSpace(toEmail))
                toEmail = DbHelper.GetAppSetting("SmtpEmail", "");

            if (string.IsNullOrWhiteSpace(toEmail))
            {
                lblSmtpMessage.ForeColor = System.Drawing.Color.Red;
                lblSmtpMessage.Text = "Enter and save your Gmail address & App Password first.";
                return;
            }

            string err;
            string otp = EmailHelper.Generate4DigitOtp();
            if (EmailHelper.SendOtpEmail(toEmail, "Admin Test", otp, "SMTP Test", out err))
            {
                lblSmtpMessage.ForeColor = System.Drawing.Color.Green;
                lblSmtpMessage.Text = "Test OTP (" + otp + ") sent to " + toEmail + "!";
            }
            else
            {
                lblSmtpMessage.ForeColor = System.Drawing.Color.Red;
                lblSmtpMessage.Text = err;
            }
        }
    }
}
