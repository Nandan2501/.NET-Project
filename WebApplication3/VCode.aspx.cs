using System;

namespace WebApplication3
{
    public partial class VCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            string code =
                txtCode1.Text.Trim() +
                txtCode2.Text.Trim() +
                txtCode3.Text.Trim() +
                txtCode4.Text.Trim();

            if (code.Length != 4)
            {
                lblMessage.Text = "Please enter the complete 4-digit code.";
                return;
            }

            // Temporary verification.
            // Replace this with your database/email OTP verification later.

            Session["VerificationCode"] = code;

            Response.Redirect("ResetPass.aspx");
        }

        protected void btnResend_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "A new verification code has been sent.";
        }
    }
}