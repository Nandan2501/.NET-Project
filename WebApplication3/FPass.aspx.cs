using System;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class FPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSendReset_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string email = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter your email address.";
                return;
            }

            var userIdObj = DbHelper.ExecuteScalar(
                "SELECT UserId FROM Users WHERE LOWER(Email) = LOWER(@Email)",
                new SqlParameter("@Email", email));

            if (userIdObj == null || userIdObj == DBNull.Value)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "No account found with this email address.";
                return;
            }

            int userId = Convert.ToInt32(userIdObj);
            Session["ResetUserId"] = userId;
            Session["ResetEmail"] = email;

            DbHelper.ExecuteNonQuery(
                "DELETE FROM PasswordResetCodes WHERE UserId = @UserId;" +
                "INSERT INTO PasswordResetCodes (UserId, CodeHash, ExpiresAt, IsUsed) VALUES (@UserId, '1234', DATEADD(hour, 1, SYSDATETIME()), 0);",
                new SqlParameter("@UserId", userId));

            Response.Redirect("VCode.aspx");
        }
    }
}
