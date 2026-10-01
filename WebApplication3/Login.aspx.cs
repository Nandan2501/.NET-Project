using System;

namespace WebApplication
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Basic validation

            if (string.IsNullOrEmpty(email))
            {
                lblMessage.Text = "Please enter your email or phone.";
                return;
            }

            if (string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter your password.";
                return;
            }

            // Temporary login
            // Replace this with database authentication later.

            if (email == "driver@transpo.com" &&
                password == "123456")
            {
                Session["User"] = email;

                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid email/phone or password.";
            }
        }
    }
}