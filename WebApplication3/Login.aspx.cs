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
            if (!Page.IsValid)
                return;

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

            string normalizedEmail = email.ToLower();

            // Check registered user in Session first (if any)
            string registeredEmail = Session["UserEmail"]?.ToString();
            string registeredPhone = Session["UserPhone"]?.ToString();
            string registeredPassword = Session["UserPassword"]?.ToString();

            if (!string.IsNullOrEmpty(registeredEmail) &&
                (string.Equals(email, registeredEmail, StringComparison.OrdinalIgnoreCase) ||
                 (!string.IsNullOrEmpty(registeredPhone) && email == registeredPhone)))
            {
                if (string.IsNullOrEmpty(registeredPassword) || password == registeredPassword || password == "123456")
                {
                    Session["UserEmail"] = registeredEmail;
                    Session["Role"] = Session["Role"] ?? "Customer";
                    Session["FullName"] = Session["FullName"] ?? Session["UserName"] ?? "Customer";

                    Response.Redirect("Dashboard.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }
            }

            // Customer Login
            if ((normalizedEmail == "customer@transpo.com" || normalizedEmail == "customer" || normalizedEmail == "9876543210" || normalizedEmail == "98765-43210") && password == "123456")
            {
                Session["UserEmail"] = "customer@transpo.com";
                Session["Role"] = "Customer";
                Session["FullName"] = "Nandan Nasit";

                Response.Redirect("Dashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            // Driver Login
            else if ((normalizedEmail == "driver@transpo.com" || normalizedEmail == "driver" || normalizedEmail == "9327468707" || normalizedEmail == "93274 68707") && password == "123456")
            {
                Session["UserEmail"] = "driver@transpo.com";
                Session["Role"] = "Driver";
                Session["FullName"] = "Yashrajsinh";

                Response.Redirect("Driver/dashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            // Admin Login
            else if ((normalizedEmail == "admin@transpo.com" || normalizedEmail == "admin") && password == "123456")
            {
                Session["UserEmail"] = "admin@transpo.com";
                Session["Role"] = "Admin";
                Session["FullName"] = "Admin User";

                Response.Redirect("Admin/Dashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            else 
            {
                lblMessage.Text = "Invalid email/phone or password. (Demo password: 123456)";
            }
        }
    }
}