using System;
using System.Data.SqlClient;

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

            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(phone) || string.IsNullOrEmpty(password))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please fill in all required fields.";
                return;
            }

            if (password != confirmPassword)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            object existingObj = DbHelper.ExecuteScalar(
                "SELECT COUNT(1) FROM Users WHERE LOWER(Email) = LOWER(@Email)",
                new SqlParameter("@Email", email));
            int existing = existingObj != null && existingObj != DBNull.Value ? Convert.ToInt32(existingObj) : 0;
            if (existing > 0)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "An account with this email already exists.";
                return;
            }

            string otpCode = EmailHelper.Generate4DigitOtp();
            string emailErr;
            if (!EmailHelper.SendOtpEmail(email, fullName, otpCode, "Account Registration", out emailErr))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = emailErr;
                return;
            }

            DbHelper.ExecuteNonQuery(@"
                DELETE FROM RegistrationOtps WHERE LOWER(Email) = LOWER(@Email) AND IsUsed = 0;
                INSERT INTO RegistrationOtps (Email, OtpCode, FullName, Phone, PasswordHash, ExpiresAt, IsUsed)
                VALUES (@Email, @OtpCode, @FullName, @Phone, @Password, DATEADD(minute, 15, SYSDATETIME()), 0);",
                new SqlParameter("@Email", email),
                new SqlParameter("@OtpCode", otpCode),
                new SqlParameter("@FullName", fullName),
                new SqlParameter("@Phone", phone),
                new SqlParameter("@Password", password));

            Session["PendingRegEmail"] = email;
            Response.Redirect("VCode.aspx?mode=register", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
