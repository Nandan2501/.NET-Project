using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class VCode : System.Web.UI.Page
    {
        private bool IsRegisterMode =>
            string.Equals(Request.QueryString["mode"], "register", StringComparison.OrdinalIgnoreCase) ||
            (Session["PendingRegEmail"] != null && Session["ResetUserId"] == null);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (IsRegisterMode)
                {
                    string regEmail = Session["PendingRegEmail"]?.ToString() ?? "";
                    if (string.IsNullOrEmpty(regEmail))
                    {
                        Response.Redirect("Register.aspx");
                        return;
                    }
                    litHeading.Text = "Verify Your Email";
                    litSubtext.Text = "We've sent a 4-digit registration OTP to " + Server.HtmlEncode(regEmail) + ".";
                }
                else
                {
                    string resetEmail = Session["ResetEmail"]?.ToString() ?? "your registered email";
                    litHeading.Text = "Verify Code";
                    litSubtext.Text = "We've sent a 4-digit reset OTP to " + Server.HtmlEncode(resetEmail) + ".";
                }
            }
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
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter the complete 4-digit code.";
                return;
            }

            if (IsRegisterMode)
            {
                string regEmail = Session["PendingRegEmail"]?.ToString() ?? "";
                if (string.IsNullOrEmpty(regEmail))
                {
                    Response.Redirect("Register.aspx");
                    return;
                }

                DataTable dt = DbHelper.ExecuteQuery(@"
                    SELECT TOP 1 OtpId, FullName, Email, Phone, PasswordHash
                    FROM RegistrationOtps
                    WHERE LOWER(Email) = LOWER(@Email)
                      AND OtpCode = @Code
                      AND IsUsed = 0
                      AND ExpiresAt >= SYSDATETIME()
                    ORDER BY OtpId DESC",
                    new SqlParameter("@Email", regEmail),
                    new SqlParameter("@Code", code));

                if (dt.Rows.Count == 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Invalid or expired OTP code. Please check your email or click Resend.";
                    return;
                }

                var r = dt.Rows[0];
                int otpId = Convert.ToInt32(r["OtpId"]);
                string regErr;
                bool created = DbHelper.RegisterUser(
                    r["FullName"].ToString(),
                    r["Email"].ToString(),
                    r["Phone"].ToString(),
                    r["PasswordHash"].ToString(),
                    out regErr);

                if (!created)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = string.IsNullOrEmpty(regErr) ? "Could not complete registration." : regErr;
                    return;
                }

                DbHelper.ExecuteNonQuery("UPDATE RegistrationOtps SET IsUsed = 1 WHERE OtpId = @OtpId",
                    new SqlParameter("@OtpId", otpId));

                Session.Remove("PendingRegEmail");
                Response.Redirect("Login.aspx?registered=1", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            int userId = Session["ResetUserId"] != null ? Convert.ToInt32(Session["ResetUserId"]) : 0;
            if (userId > 0)
            {
                var valid = DbHelper.ExecuteScalar(@"
                    SELECT TOP 1 ResetId
                    FROM PasswordResetCodes
                    WHERE UserId = @UserId
                      AND CodeHash = @Code
                      AND IsUsed = 0
                      AND ExpiresAt >= SYSDATETIME()
                    ORDER BY ResetId DESC",
                    new SqlParameter("@UserId", userId),
                    new SqlParameter("@Code", code));

                if (valid != null && valid != DBNull.Value)
                {
                    DbHelper.ExecuteNonQuery(
                        "UPDATE PasswordResetCodes SET IsUsed = 1 WHERE ResetId = @ResetId",
                        new SqlParameter("@ResetId", Convert.ToInt32(valid)));

                    Session["CodeVerified"] = true;
                    Response.Redirect("ResetPass.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }
            }

            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Invalid or expired verification code. Please check your email or click Resend.";
        }

        protected void btnResend_Click(object sender, EventArgs e)
        {
            string newOtp = EmailHelper.Generate4DigitOtp();

            if (IsRegisterMode)
            {
                string regEmail = Session["PendingRegEmail"]?.ToString() ?? "";
                if (string.IsNullOrEmpty(regEmail))
                {
                    Response.Redirect("Register.aspx");
                    return;
                }

                DataTable dt = DbHelper.ExecuteQuery(@"
                    SELECT TOP 1 FullName, Phone, PasswordHash
                    FROM RegistrationOtps
                    WHERE LOWER(Email) = LOWER(@Email)
                    ORDER BY OtpId DESC",
                    new SqlParameter("@Email", regEmail));

                if (dt.Rows.Count == 0)
                {
                    Response.Redirect("Register.aspx");
                    return;
                }

                var r = dt.Rows[0];
                string emailErr;
                if (!EmailHelper.SendOtpEmail(regEmail, r["FullName"].ToString(), newOtp, "Account Registration", out emailErr))
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = emailErr;
                    return;
                }

                DbHelper.ExecuteNonQuery(@"
                    UPDATE RegistrationOtps SET IsUsed = 1 WHERE LOWER(Email) = LOWER(@Email) AND IsUsed = 0;
                    INSERT INTO RegistrationOtps (Email, OtpCode, FullName, Phone, PasswordHash, ExpiresAt, IsUsed)
                    VALUES (@Email, @OtpCode, @FullName, @Phone, @Password, DATEADD(minute, 15, SYSDATETIME()), 0);",
                    new SqlParameter("@Email", regEmail),
                    new SqlParameter("@OtpCode", newOtp),
                    new SqlParameter("@FullName", r["FullName"].ToString()),
                    new SqlParameter("@Phone", r["Phone"].ToString()),
                    new SqlParameter("@Password", r["PasswordHash"].ToString()));

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "A new 4-digit OTP has been sent to " + Server.HtmlEncode(regEmail) + ".";
                return;
            }

            int userId = Session["ResetUserId"] != null ? Convert.ToInt32(Session["ResetUserId"]) : 0;
            string resetEmail = Session["ResetEmail"]?.ToString() ?? "";
            if (userId > 0 && !string.IsNullOrEmpty(resetEmail))
            {
                string fullName = DbHelper.ExecuteScalar("SELECT FullName FROM Users WHERE UserId = @UserId",
                    new SqlParameter("@UserId", userId))?.ToString() ?? "User";

                string emailErr;
                if (!EmailHelper.SendOtpEmail(resetEmail, fullName, newOtp, "Password Reset", out emailErr))
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = emailErr;
                    return;
                }

                DbHelper.ExecuteNonQuery(
                    "UPDATE PasswordResetCodes SET IsUsed = 1 WHERE UserId = @UserId AND IsUsed = 0;" +
                    "INSERT INTO PasswordResetCodes (UserId, CodeHash, ExpiresAt, IsUsed) VALUES (@UserId, @Code, DATEADD(minute, 15, SYSDATETIME()), 0);",
                    new SqlParameter("@UserId", userId),
                    new SqlParameter("@Code", newOtp));

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "A new 4-digit OTP has been sent to " + Server.HtmlEncode(resetEmail) + ".";
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Session expired. Please start again.";
            }
        }
    }
}
