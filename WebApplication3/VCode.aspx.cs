using System;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class VCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

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

            int userId = Session["ResetUserId"] != null ? Convert.ToInt32(Session["ResetUserId"]) : 0;
            if (userId > 0)
            {
                var valid = DbHelper.ExecuteScalar(
                    "SELECT TOP 1 ResetId FROM PasswordResetCodes WHERE UserId = @UserId AND CodeHash = @Code AND IsUsed = 0",
                    new SqlParameter("@UserId", userId),
                    new SqlParameter("@Code", code));

                if (valid != null && valid != DBNull.Value)
                {
                    DbHelper.ExecuteNonQuery(
                        "UPDATE PasswordResetCodes SET IsUsed = 1 WHERE ResetId = @ResetId",
                        new SqlParameter("@ResetId", Convert.ToInt32(valid)));

                    Session["CodeVerified"] = true;
                    Response.Redirect("ResetPass.aspx");
                    return;
                }
            }

            if (code == "1234")
            {
                Session["CodeVerified"] = true;
                Response.Redirect("ResetPass.aspx");
                return;
            }

            lblMessage.Text = "Invalid or expired verification code (Hint: default code is 1234).";
        }

        protected void btnResend_Click(object sender, EventArgs e)
        {
            int userId = Session["ResetUserId"] != null ? Convert.ToInt32(Session["ResetUserId"]) : 0;
            if (userId > 0)
            {
                DbHelper.ExecuteNonQuery(
                    "INSERT INTO PasswordResetCodes (UserId, CodeHash, ExpiresAt, IsUsed) VALUES (@UserId, '1234', DATEADD(hour, 1, SYSDATETIME()), 0);",
                    new SqlParameter("@UserId", userId));
            }
            lblMessage.Text = "A new verification code (1234) has been generated.";
        }
    }
}
