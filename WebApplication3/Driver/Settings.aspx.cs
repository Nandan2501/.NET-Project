using System;
using System.Data.SqlClient;

namespace WebApplication3.Driver
{
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string currentPassword = txtCurrentPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(currentPassword) ||
                string.IsNullOrEmpty(newPassword) ||
                string.IsNullOrEmpty(confirmPassword))
            {
                lblPasswordMessage.ForeColor = System.Drawing.Color.Red;
                lblPasswordMessage.Text = "Please fill in all password fields.";
                return;
            }

            if (newPassword.Length < 6)
            {
                lblPasswordMessage.ForeColor = System.Drawing.Color.Red;
                lblPasswordMessage.Text = "New password must be at least 6 characters.";
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblPasswordMessage.ForeColor = System.Drawing.Color.Red;
                lblPasswordMessage.Text = "Passwords do not match.";
                return;
            }

            int userId = DbHelper.GetLoggedInUserId(Session);
            int driverId = DbHelper.GetLoggedInDriverId(Session);

            if (driverId > 0)
            {
                object uidObj = DbHelper.ExecuteScalar(
                    "SELECT UserId FROM Drivers WHERE DriverId = @DriverId",
                    new SqlParameter("@DriverId", driverId));
                if (uidObj != null && uidObj != DBNull.Value)
                {
                    userId = Convert.ToInt32(uidObj);
                }
            }

            var storedPass = DbHelper.ExecuteScalar(
                "SELECT PasswordHash FROM Users WHERE UserId = @UserId",
                new SqlParameter("@UserId", userId));

            if (storedPass == null || !string.Equals(storedPass.ToString(), currentPassword))
            {
                lblPasswordMessage.ForeColor = System.Drawing.Color.Red;
                lblPasswordMessage.Text = "Current password is incorrect.";
                return;
            }

            DbHelper.ExecuteNonQuery(
                "UPDATE Users SET PasswordHash = @Password WHERE UserId = @UserId",
                new SqlParameter("@Password", newPassword),
                new SqlParameter("@UserId", userId));

            lblPasswordMessage.ForeColor = System.Drawing.Color.Green;
            lblPasswordMessage.Text = "Password updated successfully.";

            txtCurrentPassword.Text = "";
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}
