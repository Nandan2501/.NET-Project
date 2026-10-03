using System;

namespace WebApplication3
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

            if (string.IsNullOrEmpty(email))
            {
                lblMessage.Text = "Please enter your email or phone number.";
                return;
            }

            if (string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter your password.";
                return;
            }

            // Temporary login logic.
            // Replace this with your database authentication later.

            if (email == "customer@transpo.com" && password == "123456")
            {
                Session["UserEmail"] = email;

                Response.Redirect("Dashboard.aspx");
            }
            if (email == "driver@transpo.com" && password == "123456")
            {
                Session["UserEmail"] = email;

                Response.Redirect("Driver/dashboard.aspx");
            }
            else 
            {
                lblMessage.Text = "Invalid email/phone or password.";
            }
        }
    }
}