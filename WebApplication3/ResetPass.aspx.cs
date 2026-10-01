using System;

namespace WebApplication
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            string newPassword = txtNewPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            // Check empty fields
            if (string.IsNullOrEmpty(newPassword) ||
                string.IsNullOrEmpty(confirmPassword))
            {
                lblMessage.Text =
                    "Please fill in both password fields.";

                return;
            }

            // Check minimum length
            if (newPassword.Length < 8)
            {
                lblMessage.Text =
                    "Password must be at least 8 characters.";

                return;
            }

            // Check passwords
            if (newPassword != confirmPassword)
            {
                lblMessage.Text =
                    "Passwords do not match.";

                return;
            }

            // Temporary success message
            lblMessage.ForeColor =
                System.Drawing.Color.Green;

            lblMessage.Text =
                "Password updated successfully!";

            // Later you can update the password in MySQL
            // and redirect to Login.aspx.
        }
    }
}