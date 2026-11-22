using System;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class AddDriver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Drivers.aspx");
        }

        protected void btnSaveDriver_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string driverName = txtDriverName.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string licenseNo = txtLicense.Text.Trim();
            string dobStr = txtDOB.Text.Trim();
            string address = txtAddress.Text.Trim();

            if (string.IsNullOrWhiteSpace(driverName) || string.IsNullOrWhiteSpace(phone) || string.IsNullOrWhiteSpace(licenseNo))
            {
                return;
            }

            DateTime dob;
            object dobValue = DBNull.Value;
            if (DateTime.TryParse(dobStr, out dob))
            {
                dobValue = dob;
            }

            // Create clean email handle for driver
            string cleanHandle = driverName.ToLower().Replace(" ", "");
            string email = cleanHandle + "@transpo.com";

            // If email already exists, make unique
            int count = Convert.ToInt32(DbHelper.ExecuteScalar(
                "SELECT COUNT(1) FROM Users WHERE LOWER(Email) = LOWER(@Email)",
                new SqlParameter("@Email", email)) ?? 0);
            if (count > 0)
            {
                email = cleanHandle + new Random().Next(10, 99) + "@transpo.com";
            }

            // 1. Insert into Users
            string insertUserSql = @"
                INSERT INTO Users (FullName, Email, Phone, PasswordHash, Role, DateOfBirth, AccountStatus)
                VALUES (@FullName, @Email, @Phone, '123456', 'Driver', @DOB, 'Active');
                SELECT SCOPE_IDENTITY();";

            object newUserIdObj = DbHelper.ExecuteScalar(insertUserSql,
                new SqlParameter("@FullName", driverName),
                new SqlParameter("@Email", email),
                new SqlParameter("@Phone", phone),
                new SqlParameter("@DOB", dobValue));

            if (newUserIdObj != null && newUserIdObj != DBNull.Value)
            {
                int userId = Convert.ToInt32(newUserIdObj);

                // 2. Insert into Drivers
                string insertDriverSql = @"
                    INSERT INTO Drivers (UserId, LicenseNumber, LicenseExpiry, VerificationStatus, Rating)
                    VALUES (@UserId, @LicenseNo, DATEADD(year, 5, GETDATE()), 'Active', 5.0);";

                DbHelper.ExecuteNonQuery(insertDriverSql,
                    new SqlParameter("@UserId", userId),
                    new SqlParameter("@LicenseNo", licenseNo));

                // 3. Insert address if provided
                if (!string.IsNullOrWhiteSpace(address))
                {
                    DbHelper.ExecuteNonQuery(@"
                        INSERT INTO Addresses (UserId, AddressTitle, FullAddress, City, State, PostalCode, IsDefault)
                        VALUES (@UserId, 'Home', @Address, 'Rajkot', 'Gujarat', '360001', 1)",
                        new SqlParameter("@UserId", userId),
                        new SqlParameter("@Address", address));
                }
            }

            Response.Redirect("Drivers.aspx");
        }
    }
}
