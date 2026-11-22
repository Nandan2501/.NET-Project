using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            int userId = DbHelper.GetLoggedInUserId(Session);
            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT TOP 1 u.FullName, u.Email, u.Phone, 
                       FORMAT(u.DateOfBirth, 'yyyy-MM-dd') AS DOB,
                       ISNULL(a.FullAddress, '') AS FullAddress
                FROM Users u
                LEFT JOIN Addresses a ON u.UserId = a.UserId AND a.IsDefault = 1
                WHERE u.UserId = @UserId",
                new SqlParameter("@UserId", userId));

            if (dt.Rows.Count > 0)
            {
                var row = dt.Rows[0];
                txtFullName.Text = row["FullName"]?.ToString() ?? "";
                txtEmail.Text = row["Email"]?.ToString() ?? "";
                txtPhone.Text = row["Phone"]?.ToString() ?? "";
                txtDateOfBirth.Text = row["DOB"]?.ToString() ?? "";
                txtAddress.Text = row["FullAddress"]?.ToString() ?? "";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string dobStr = txtDateOfBirth.Text.Trim();
            string address = txtAddress.Text.Trim();

            if (string.IsNullOrWhiteSpace(fullName))
            {
                lblMessage.Text = "Please enter your full name.";
                return;
            }

            if (string.IsNullOrWhiteSpace(email))
            {
                lblMessage.Text = "Please enter your email.";
                return;
            }

            if (string.IsNullOrWhiteSpace(phone))
            {
                lblMessage.Text = "Please enter your phone number.";
                return;
            }

            int userId = DbHelper.GetLoggedInUserId(Session);

            DateTime dob;
            object dobValue = DBNull.Value;
            if (DateTime.TryParse(dobStr, out dob))
            {
                dobValue = dob;
            }

            DbHelper.ExecuteNonQuery(@"
                UPDATE Users 
                SET FullName = @FullName, Email = @Email, Phone = @Phone, DateOfBirth = @DOB 
                WHERE UserId = @UserId",
                new SqlParameter("@FullName", fullName),
                new SqlParameter("@Email", email),
                new SqlParameter("@Phone", phone),
                new SqlParameter("@DOB", dobValue),
                new SqlParameter("@UserId", userId));

            if (!string.IsNullOrWhiteSpace(address))
            {
                int addrCount = Convert.ToInt32(DbHelper.ExecuteScalar(
                    "SELECT COUNT(1) FROM Addresses WHERE UserId = @UserId AND IsDefault = 1",
                    new SqlParameter("@UserId", userId)) ?? 0);

                if (addrCount > 0)
                {
                    DbHelper.ExecuteNonQuery(
                        "UPDATE Addresses SET FullAddress = @Address WHERE UserId = @UserId AND IsDefault = 1",
                        new SqlParameter("@Address", address),
                        new SqlParameter("@UserId", userId));
                }
                else
                {
                    DbHelper.ExecuteNonQuery(@"
                        INSERT INTO Addresses (UserId, AddressTitle, FullAddress, City, State, PostalCode, IsDefault)
                        VALUES (@UserId, 'Home', @Address, 'Rajkot', 'Gujarat', '360001', 1)",
                        new SqlParameter("@UserId", userId),
                        new SqlParameter("@Address", address));
                }
            }

            Session["FullName"] = fullName;
            Session["UserEmail"] = email;
            Session["UserPhone"] = phone;

            Response.Redirect("Profile.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    }
}
