using System;

namespace WebApplication
{
    public partial class VerifyCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            string code =
                txtOtp1.Text.Trim() +
                txtOtp2.Text.Trim() +
                txtOtp3.Text.Trim() +
                txtOtp4.Text.Trim();

            if (code.Length != 4)
            {
                lblMessage.Text = "Please enter the 4-digit code.";
                return;
            }

            // Temporary verification
            // Database/email verification can be added later.

            if (code == "4821")
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Green;

                lblMessage.Text =
                    "Code verified successfully!";

                // Example:
                // Response.Redirect("ResetPassword.aspx");
            }
            else
            {
                lblMessage.Text =
                    "Invalid verification code.";
            }
        }


        protected void btnResend_Click(object sender, EventArgs e)
        {
            // Email/SMS resend functionality
            // can be connected later.

            lblMessage.ForeColor =
                System.Drawing.Color.Green;

            lblMessage.Text =
                "A new verification code has been sent.";
        }
    }
}