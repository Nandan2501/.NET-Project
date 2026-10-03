using System;

namespace WebApplication3
{
    public partial class FPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSendReset_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                lblMessage.Text = "Please enter your email address.";
                return;
            }

            // Temporary functionality
            // Add your email/OTP logic here later.

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Reset code has been sent successfully.";
        }
    }
}