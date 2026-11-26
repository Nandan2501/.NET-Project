using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

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
                SELECT TOP 1 u.FullName, u.Email, u.Phone, u.ProfilePhoto,
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

                string photo = row["ProfilePhoto"]?.ToString();
                if (!string.IsNullOrEmpty(photo))
                    imgProfile.ImageUrl = photo;
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

            if (string.IsNullOrWhiteSpace(fullName) || string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(phone))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please fill in all required fields.";
                return;
            }

            int userId = DbHelper.GetLoggedInUserId(Session);

            DateTime dob;
            object dobValue = DBNull.Value;
            if (DateTime.TryParse(dobStr, out dob))
                dobValue = dob;

            string photoPath = null;
            if (fuProfilePhoto.HasFile)
            {
                string ext = Path.GetExtension(fuProfilePhoto.FileName)?.ToLowerInvariant();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".webp")
                {
                    string uploadDir = Server.MapPath("~/Uploads/Profiles/");
                    Directory.CreateDirectory(uploadDir);
                    string fileName = "user_" + userId + "_" + DateTime.Now.Ticks + ext;
                    fuProfilePhoto.SaveAs(Path.Combine(uploadDir, fileName));
                    photoPath = "~/Uploads/Profiles/" + fileName;
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Only JPG, PNG, or WEBP images are allowed.";
                    return;
                }
            }

            string err;
            DbHelper.ExecuteNonQueryWithError(@"
                UPDATE Users 
                SET FullName = @FullName, Email = @Email, Phone = @Phone, DateOfBirth = @DOB,
                    ProfilePhoto = COALESCE(@Photo, ProfilePhoto)
                WHERE UserId = @UserId", out err,
                new SqlParameter("@FullName", fullName),
                new SqlParameter("@Email", email),
                new SqlParameter("@Phone", phone),
                new SqlParameter("@DOB", dobValue),
                new SqlParameter("@Photo", (object)photoPath ?? DBNull.Value),
                new SqlParameter("@UserId", userId));

            if (!string.IsNullOrEmpty(err))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error updating profile: " + err;
                return;
            }

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
                        INSERT INTO Addresses (UserId, AddressTitle, FullAddress, City, State, PostalCode, Country, ContactPhone, AddressType, IsDefault)
                        VALUES (@UserId, 'Home', @Address, 'Rajkot', 'Gujarat', '360001', 'India', @Phone, 'Residential', 1)",
                        new SqlParameter("@UserId", userId),
                        new SqlParameter("@Address", address),
                        new SqlParameter("@Phone", phone));
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
