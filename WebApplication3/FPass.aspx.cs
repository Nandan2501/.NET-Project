using System;

namespace WebApplication
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                lblMessage.Text = "Please enter your email.";
                return;
            }

            // Temporary message
            // Database/email functionality can be added later.

            lblMessage.ForeColor =
                System.Drawing.Color.Green;

            lblMessage.Text =
                "Reset code has been sent to your email.";
        }
    }
}