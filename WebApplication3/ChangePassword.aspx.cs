using System;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string currentPassword = txtCurrentPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrWhiteSpace(currentPassword))
            {
                lblMessage.Text = "Please enter your current password.";
                return;
            }

            if (string.IsNullOrWhiteSpace(newPassword))
            {
                lblMessage.Text = "Please enter a new password.";
                return;
            }

            if (newPassword.Length < 6)
            {
                lblMessage.Text = "Password must be at least 6 characters.";
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "New password and confirm password do not match.";
                return;
            }

            int userId = DbHelper.GetLoggedInUserId(Session);
            var storedPass = DbHelper.ExecuteScalar(
                "SELECT PasswordHash FROM Users WHERE UserId = @UserId",
                new SqlParameter("@UserId", userId));

            if (storedPass == null || !string.Equals(storedPass.ToString(), currentPassword))
            {
                lblMessage.Text = "Current password is incorrect.";
                return;
            }

            DbHelper.ExecuteNonQuery(
                "UPDATE Users SET PasswordHash = @Password WHERE UserId = @UserId",
                new SqlParameter("@Password", newPassword),
                new SqlParameter("@UserId", userId));

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Password updated successfully.";

            txtCurrentPassword.Text = "";
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}
