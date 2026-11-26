using System;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["registered"] == "1")
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Account created successfully! Please log in.";
            }
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

            // 1. Authenticate with TranspoDB database
            int dbUserId;
            string dbFullName, dbRole, dbEmail, dbPhone;
            if (DbHelper.ValidateUser(email, password, out dbUserId, out dbFullName, out dbRole, out dbEmail, out dbPhone))
            {
                Session["UserId"] = dbUserId;
                Session["UserEmail"] = dbEmail;
                Session["FullName"] = dbFullName;
                Session["Role"] = dbRole;
                Session["UserPhone"] = dbPhone;

                if (string.Equals(dbRole, "Admin", StringComparison.OrdinalIgnoreCase))
                {
                    Response.Redirect("Admin/Dashboard.aspx", false);
                }
                else if (string.Equals(dbRole, "Driver", StringComparison.OrdinalIgnoreCase))
                {
                    var driverObj = DbHelper.ExecuteScalar(
                        "SELECT DriverId FROM Drivers WHERE UserId = @UserId",
                        new SqlParameter("@UserId", dbUserId));
                    if (driverObj != null && driverObj != DBNull.Value)
                    {
                        Session["DriverId"] = Convert.ToInt32(driverObj);
                    }
                    Response.Redirect("Driver/dashboard.aspx", false);
                }
                else
                {
                    Response.Redirect("Dashboard.aspx", false);
                }
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            lblMessage.Text = "Invalid email/phone or password. (Demo password: 123456)";
        }
    }
}
