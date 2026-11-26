using System;
using System.Data;
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

            DataTable dt = DbHelper.ExecuteQuery(
                "SELECT TOP 1 UserId, FullName, Email FROM Users WHERE LOWER(Email) = LOWER(@Email)",
                new SqlParameter("@Email", email));

            if (dt.Rows.Count == 0)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "No account found with this email address.";
                return;
            }

            int userId = Convert.ToInt32(dt.Rows[0]["UserId"]);
            string fullName = dt.Rows[0]["FullName"].ToString();
            string exactEmail = dt.Rows[0]["Email"].ToString();

            string otpCode = EmailHelper.Generate4DigitOtp();
            string emailErr;
            if (!EmailHelper.SendOtpEmail(exactEmail, fullName, otpCode, "Password Reset", out emailErr))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = emailErr;
                return;
            }

            Session["ResetUserId"] = userId;
            Session["ResetEmail"] = exactEmail;

            DbHelper.ExecuteNonQuery(
                "DELETE FROM PasswordResetCodes WHERE UserId = @UserId;" +
                "INSERT INTO PasswordResetCodes (UserId, CodeHash, ExpiresAt, IsUsed) VALUES (@UserId, @Code, DATEADD(minute, 15, SYSDATETIME()), 0);",
                new SqlParameter("@UserId", userId),
                new SqlParameter("@Code", otpCode));

            Response.Redirect("VCode.aspx?mode=reset", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
