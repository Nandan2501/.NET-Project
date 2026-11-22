using System;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class ResetPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            if (string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter a new password.";
                return;
            }

            if (password.Length < 6)
            {
                lblMessage.Text = "Password must be at least 6 characters.";
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

            int userId = Session["ResetUserId"] != null ? Convert.ToInt32(Session["ResetUserId"]) : 0;
            if (userId > 0)
            {
                DbHelper.ExecuteNonQuery(
                    "UPDATE Users SET PasswordHash = @Password WHERE UserId = @UserId",
                    new SqlParameter("@Password", password),
                    new SqlParameter("@UserId", userId));
            }
            else if (Session["ResetEmail"] != null)
            {
                DbHelper.ExecuteNonQuery(
                    "UPDATE Users SET PasswordHash = @Password WHERE LOWER(Email) = LOWER(@Email)",
                    new SqlParameter("@Password", password),
                    new SqlParameter("@Email", Session["ResetEmail"].ToString()));
            }

            Session.Remove("ResetUserId");
            Session.Remove("ResetEmail");
            Session.Remove("CodeVerified");

            Response.Redirect("Login.aspx");
        }
    }
}
