using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace WebApplication3
{
    public partial class AddDriver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDriverForEdit();
            }
        }

        private void LoadDriverForEdit()
        {
            int driverId;
            if (int.TryParse(Request.QueryString["id"], out driverId) && driverId > 0)
            {
                ViewState["EditDriverId"] = driverId;
                DataTable dt = DbHelper.ExecuteQuery(@"
                    SELECT TOP 1 d.DriverId, d.UserId, d.LicenseNumber,
                           u.FullName, u.Phone, u.Email,
                           FORMAT(u.DateOfBirth, 'yyyy-MM-dd') AS DOB,
                           ISNULL((SELECT TOP 1 FullAddress FROM Addresses a WHERE a.UserId = u.UserId ORDER BY a.IsDefault DESC, a.AddressId DESC), '') AS FullAddress
                    FROM Drivers d
                    INNER JOIN Users u ON d.UserId = u.UserId
                    WHERE d.DriverId = @DriverId",
                    new SqlParameter("@DriverId", driverId));

                if (dt.Rows.Count > 0)
                {
                    var r = dt.Rows[0];
                    ViewState["EditUserId"] = Convert.ToInt32(r["UserId"]);
                    txtDriverName.Text = r["FullName"]?.ToString() ?? "";
                    txtPhone.Text = r["Phone"]?.ToString() ?? "";
                    txtEmail.Text = r["Email"]?.ToString() ?? "";
                    txtLicense.Text = r["LicenseNumber"]?.ToString() ?? "";
                    txtDOB.Text = r["DOB"]?.ToString() ?? "";
                    txtAddress.Text = r["FullAddress"]?.ToString() ?? "";
                    btnSaveDriver.Text = "Update Driver";
                }
            }
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
            string emailInput = txtEmail.Text.Trim();
            string licenseNo = txtLicense.Text.Trim();
            string dobStr = txtDOB.Text.Trim();
            string address = txtAddress.Text.Trim();

            if (string.IsNullOrWhiteSpace(driverName) || string.IsNullOrWhiteSpace(phone) || string.IsNullOrWhiteSpace(licenseNo))
            {
                lblDriverMsg.Text = "Driver Name, Phone, and License Number are required.";
                return;
            }

            DateTime dob;
            object dobValue = DBNull.Value;
            if (DateTime.TryParse(dobStr, out dob))
                dobValue = dob;

            string licenseDocPath = null;
            if (fuLicense.HasFile)
            {
                string ext = Path.GetExtension(fuLicense.FileName)?.ToLowerInvariant();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".pdf")
                {
                    string uploadDir = Server.MapPath("~/Uploads/Licenses/");
                    Directory.CreateDirectory(uploadDir);
                    string fileName = "lic_" + DateTime.Now.Ticks + ext;
                    fuLicense.SaveAs(Path.Combine(uploadDir, fileName));
                    licenseDocPath = "~/Uploads/Licenses/" + fileName;
                }
                else
                {
                    lblDriverMsg.Text = "License file must be PNG, JPG, or PDF.";
                    return;
                }
            }

            string err;
            if (ViewState["EditDriverId"] != null && ViewState["EditUserId"] != null)
            {
                int driverId = Convert.ToInt32(ViewState["EditDriverId"]);
                int userId = Convert.ToInt32(ViewState["EditUserId"]);

                DbHelper.ExecuteNonQueryWithError(@"
                    UPDATE Users
                    SET FullName = @FullName, Phone = @Phone, DateOfBirth = @DOB,
                        Email = CASE WHEN @Email <> '' THEN @Email ELSE Email END
                    WHERE UserId = @UserId", out err,
                    new SqlParameter("@FullName", driverName),
                    new SqlParameter("@Phone", phone),
                    new SqlParameter("@DOB", dobValue),
                    new SqlParameter("@Email", emailInput),
                    new SqlParameter("@UserId", userId));

                if (!string.IsNullOrEmpty(err))
                {
                    lblDriverMsg.Text = "Error updating driver user: " + err;
                    return;
                }

                DbHelper.ExecuteNonQueryWithError(@"
                    UPDATE Drivers
                    SET LicenseNumber = @LicenseNo,
                        LicenseDocumentPath = COALESCE(@DocPath, LicenseDocumentPath)
                    WHERE DriverId = @DriverId", out err,
                    new SqlParameter("@LicenseNo", licenseNo),
                    new SqlParameter("@DocPath", (object)licenseDocPath ?? DBNull.Value),
                    new SqlParameter("@DriverId", driverId));

                if (!string.IsNullOrEmpty(err))
                {
                    lblDriverMsg.Text = "Error updating driver details: " + err;
                    return;
                }

                if (!string.IsNullOrWhiteSpace(address))
                {
                    int hasAddr = Convert.ToInt32(DbHelper.ExecuteScalar(
                        "SELECT COUNT(1) FROM Addresses WHERE UserId = @UserId",
                        new SqlParameter("@UserId", userId)) ?? 0);
                    if (hasAddr > 0)
                    {
                        DbHelper.ExecuteNonQuery("UPDATE Addresses SET FullAddress = @Addr WHERE UserId = @UserId",
                            new SqlParameter("@Addr", address),
                            new SqlParameter("@UserId", userId));
                    }
                    else
                    {
                        DbHelper.ExecuteNonQuery(@"
                            INSERT INTO Addresses (UserId, AddressTitle, FullAddress, City, State, PostalCode, Country, ContactPhone, AddressType, IsDefault)
                            VALUES (@UserId, 'Home', @Address, 'Rajkot', 'Gujarat', '360001', 'India', @Phone, 'Residential', 1)",
                            new SqlParameter("@UserId", userId),
                            new SqlParameter("@Address", address),
                            new SqlParameter("@Phone", phone));
                    }
                }
            }
            else
            {
                string email = emailInput;
                if (string.IsNullOrWhiteSpace(email))
                {
                    string cleanHandle = driverName.ToLower().Replace(" ", "");
                    email = cleanHandle + "@transpo.com";
                }

                int count = Convert.ToInt32(DbHelper.ExecuteScalar(
                    "SELECT COUNT(1) FROM Users WHERE LOWER(Email) = LOWER(@Email)",
                    new SqlParameter("@Email", email)) ?? 0);
                if (count > 0)
                {
                    if (!string.IsNullOrWhiteSpace(emailInput))
                    {
                        lblDriverMsg.Text = "An account with this email already exists.";
                        return;
                    }
                    email = driverName.ToLower().Replace(" ", "") + new Random().Next(100, 999) + "@transpo.com";
                }

                object newUserIdObj = DbHelper.ExecuteScalarWithError(@"
                    INSERT INTO Users (FullName, Email, Phone, PasswordHash, Role, DateOfBirth, AccountStatus)
                    VALUES (@FullName, @Email, @Phone, '123456', 'Driver', @DOB, 'Active');
                    SELECT SCOPE_IDENTITY();", out err,
                    new SqlParameter("@FullName", driverName),
                    new SqlParameter("@Email", email),
                    new SqlParameter("@Phone", phone),
                    new SqlParameter("@DOB", dobValue));

                if (!string.IsNullOrEmpty(err) || newUserIdObj == null || newUserIdObj == DBNull.Value)
                {
                    lblDriverMsg.Text = "Error creating driver account: " + err;
                    return;
                }

                int userId = Convert.ToInt32(newUserIdObj);

                DbHelper.ExecuteNonQueryWithError(@"
                    INSERT INTO Drivers (UserId, LicenseNumber, LicenseExpiry, VerificationStatus, Rating, LicenseDocumentPath, EmergencyContact, JoinDate)
                    VALUES (@UserId, @LicenseNo, DATEADD(year, 5, GETDATE()), 'Active', 5.0, @DocPath, @Phone, CAST(GETDATE() AS DATE));", out err,
                    new SqlParameter("@UserId", userId),
                    new SqlParameter("@LicenseNo", licenseNo),
                    new SqlParameter("@DocPath", (object)licenseDocPath ?? DBNull.Value),
                    new SqlParameter("@Phone", phone));

                if (!string.IsNullOrEmpty(err))
                {
                    DbHelper.ExecuteNonQuery("DELETE FROM Users WHERE UserId = @UserId", new SqlParameter("@UserId", userId));
                    lblDriverMsg.Text = "Error saving driver license: " + err;
                    return;
                }

                if (!string.IsNullOrWhiteSpace(address))
                {
                    DbHelper.ExecuteNonQuery(@"
                        INSERT INTO Addresses (UserId, AddressTitle, FullAddress, City, State, PostalCode, Country, ContactPhone, AddressType, IsDefault)
                        VALUES (@UserId, 'Home', @Address, 'Rajkot', 'Gujarat', '360001', 'India', @Phone, 'Residential', 1)",
                        new SqlParameter("@UserId", userId),
                        new SqlParameter("@Address", address),
                        new SqlParameter("@Phone", phone));
                }
            }

            Response.Redirect("Drivers.aspx");
        }
    }
}
