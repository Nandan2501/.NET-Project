using System;

namespace WebApplication3
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdatePassword_Click(
            object sender,
            EventArgs e)
        {
            string currentPassword = txtCurrentPassword.Text;
            string newPassword = txtNewPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

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

            if (newPassword.Length < 8)
            {
                lblMessage.Text =
                    "Password must be at least 8 characters.";
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblMessage.Text =
                    "New password and confirm password do not match.";
                return;
            }

            lblMessage.Text =
                "Password updated successfully.";

            txtCurrentPassword.Text = "";
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}