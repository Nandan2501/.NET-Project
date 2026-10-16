using System;

namespace WebApplication3
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            if (string.IsNullOrEmpty(fullName))
            {
                lblMessage.Text = "Please enter your full name.";
                return;
            }

            if (string.IsNullOrEmpty(email))
            {
                lblMessage.Text = "Please enter your email.";
                return;
            }

            if (string.IsNullOrEmpty(phone))
            {
                lblMessage.Text = "Please enter your phone number.";
                return;
            }

            if (string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter a password.";
                return;
            }

            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            string dbError;
            if (!DbHelper.RegisterUser(fullName, email, phone, password, out dbError))
            {
                if (!string.IsNullOrEmpty(dbError))
                {
                    lblMessage.Text = dbError;
                    return;
                }
            }

            Session["UserName"] = fullName;
            Session["FullName"] = fullName;
            Session["Role"] = "Customer";
            Session["UserEmail"] = email;
            Session["UserPhone"] = phone;
            Session["UserPassword"] = password;

            Response.Redirect("Login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}