using System;
using System.Data.SqlClient;

namespace WebApplication3.Driver
{
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPreferences();
            }
        }

        private void LoadPreferences()
        {
            int userId = DbHelper.GetLoggedInUserId(Session);
            string lang = DbHelper.GetUserSetting(userId, "Language", "English (India)");
            string tz = DbHelper.GetUserSetting(userId, "TimeZone", "GMT+5:30 (India Standard Time)");

            if (ddlLanguage.Items.FindByValue(lang) != null)
                ddlLanguage.SelectedValue = lang;
            if (ddlTimeZone.Items.FindByValue(tz) != null)
                ddlTimeZone.SelectedValue = tz;
        }

        protected void btnSavePreferences_Click(object sender, EventArgs e)
        {
            int userId = DbHelper.GetLoggedInUserId(Session);
            DbHelper.SaveUserSetting(userId, "Language", ddlLanguage.SelectedValue);
            DbHelper.SaveUserSetting(userId, "TimeZone", ddlTimeZone.SelectedValue);

            lblPrefMessage.ForeColor = System.Drawing.Color.Green;
            lblPrefMessage.Text = "Preferences saved to database.";
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string currentPassword = txtCurrentPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(currentPassword) ||
                string.IsNullOrEmpty(newPassword) ||
                string.IsNullOrEmpty(confirmPassword))
            {
                lblPasswordMessage.ForeColor = System.Drawing.Color.Red;
                lblPasswordMessage.Text = "Please fill in all password fields.";
                return;
            }

            if (newPassword.Length < 6)
            {
                lblPasswordMessage.ForeColor = System.Drawing.Color.Red;
                lblPasswordMessage.Text = "New password must be at least 6 characters.";
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblPasswordMessage.ForeColor = System.Drawing.Color.Red;
                lblPasswordMessage.Text = "Passwords do not match.";
                return;
            }

            int userId = DbHelper.GetLoggedInUserId(Session);
            var storedPass = DbHelper.ExecuteScalar(
                "SELECT PasswordHash FROM Users WHERE UserId = @UserId",
                new SqlParameter("@UserId", userId));

            if (storedPass == null || !string.Equals(storedPass.ToString(), currentPassword))
            {
                lblPasswordMessage.ForeColor = System.Drawing.Color.Red;
                lblPasswordMessage.Text = "Current password is incorrect.";
                return;
            }

            DbHelper.ExecuteNonQuery(
                "UPDATE Users SET PasswordHash = @Password WHERE UserId = @UserId",
                new SqlParameter("@Password", newPassword),
                new SqlParameter("@UserId", userId));

            lblPasswordMessage.ForeColor = System.Drawing.Color.Green;
            lblPasswordMessage.Text = "Password updated successfully.";

            txtCurrentPassword.Text = "";
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}
