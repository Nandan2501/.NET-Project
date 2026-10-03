using System;

namespace WebApplication3
{
    public partial class ResetPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            if (string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter a new password.";
                return;
            }

            if (password.Length < 8)
            {
                lblMessage.Text = "Password must be at least 8 characters.";
                return;
            }

            if (string.IsNullOrEmpty(confirmPassword))
            {
                lblMessage.Text = "Please confirm your new password.";
                return;
            }

            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            // Add your database password update logic here later.

            Response.Redirect("Login.aspx");
        }
    }
}