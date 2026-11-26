using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace WebApplication3.Driver
{
    public partial class Profile : System.Web.UI.Page
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
            int driverId = DbHelper.GetLoggedInDriverId(Session);

            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT TOP 1
                    u.FullName, u.Email, u.Phone, u.ProfilePhoto,
                    d.LicenseNumber, ISNULL(d.Rating, 5.0) AS Rating,
                    ISNULL(d.EmergencyContact, u.Phone) AS EmergencyContact,
                    FORMAT(ISNULL(d.JoinDate, u.CreatedAt), 'dd MMM yyyy') AS JoinDate,
                    ISNULL((SELECT TOP 1 v.RegistrationNumber FROM Vehicles v WHERE v.DriverId = d.DriverId ORDER BY v.VehicleId DESC), 'Unassigned') AS AssignedVehicle,
                    ISNULL((SELECT TOP 1 a.FullAddress FROM Addresses a WHERE a.UserId = u.UserId ORDER BY a.IsDefault DESC, a.AddressId DESC), 'Not set') AS FullAddress,
                    (SELECT COUNT(1) FROM Bookings b WHERE b.DriverId = d.DriverId) AS TotalTrips,
                    (SELECT COUNT(1) FROM Bookings b WHERE b.DriverId = d.DriverId AND b.BookingStatus = 'Completed') AS CompletedTrips
                FROM Users u
                INNER JOIN Drivers d ON u.UserId = d.UserId
                WHERE u.UserId = @UserId OR d.DriverId = @DriverId",
                new SqlParameter("@UserId", userId),
                new SqlParameter("@DriverId", driverId));

            if (dt.Rows.Count > 0)
            {
                var r = dt.Rows[0];
                string fullName = r["FullName"].ToString();
                litSummaryName.Text = Server.HtmlEncode(fullName);
                litFullName.Text = Server.HtmlEncode(fullName);
                litEmail.Text = Server.HtmlEncode(r["Email"].ToString());
                litPhone.Text = Server.HtmlEncode(r["Phone"].ToString());
                litEmergencyContact.Text = Server.HtmlEncode(r["EmergencyContact"].ToString());
                litAddress.Text = Server.HtmlEncode(r["FullAddress"].ToString());
                litLicenseNo.Text = Server.HtmlEncode(r["LicenseNumber"].ToString());
                litJoinDate.Text = r["JoinDate"].ToString();
                litAssignedVehicle.Text = Server.HtmlEncode(r["AssignedVehicle"].ToString());
                litRating.Text = Convert.ToDecimal(r["Rating"]).ToString("0.0");
                litTotalTrips.Text = r["TotalTrips"].ToString();
                litCompletedTrips.Text = r["CompletedTrips"].ToString();

                string photo = r["ProfilePhoto"]?.ToString();
                if (!string.IsNullOrEmpty(photo))
                {
                    imgDriverPhoto.ImageUrl = photo;
                    imgDriverPhoto.Visible = true;
                    spnPhotoFallback.Visible = false;
                }

                txtEditName.Text = fullName;
                txtEditPhone.Text = r["Phone"].ToString();
                txtEditEmergency.Text = r["EmergencyContact"].ToString();
                txtEditAddress.Text = r["FullAddress"].ToString();
            }
        }

        protected void btnEditToggle_Click(object sender, EventArgs e)
        {
            pnlViewInfo.Visible = false;
            pnlEditInfo.Visible = true;
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            pnlEditInfo.Visible = false;
            pnlViewInfo.Visible = true;
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            int userId = DbHelper.GetLoggedInUserId(Session);
            int driverId = DbHelper.GetLoggedInDriverId(Session);

            string name = txtEditName.Text.Trim();
            string phone = txtEditPhone.Text.Trim();
            string emergency = txtEditEmergency.Text.Trim();
            string address = txtEditAddress.Text.Trim();

            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(phone))
            {
                lblProfileMsg.ForeColor = System.Drawing.Color.Red;
                lblProfileMsg.Text = "Full Name and Phone are required.";
                return;
            }

            string photoPath = null;
            if (fuDriverPhoto.HasFile)
            {
                string ext = Path.GetExtension(fuDriverPhoto.FileName)?.ToLowerInvariant();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".webp")
                {
                    string dir = Server.MapPath("~/Uploads/Profiles/");
                    Directory.CreateDirectory(dir);
                    string fileName = "driver_" + userId + "_" + DateTime.Now.Ticks + ext;
                    fuDriverPhoto.SaveAs(Path.Combine(dir, fileName));
                    photoPath = "~/Uploads/Profiles/" + fileName;
                }
            }

            DbHelper.ExecuteNonQuery(@"
                UPDATE Users
                SET FullName = @Name, Phone = @Phone, ProfilePhoto = COALESCE(@Photo, ProfilePhoto)
                WHERE UserId = @UserId;
                UPDATE Drivers
                SET EmergencyContact = @Emergency
                WHERE DriverId = @DriverId;",
                new SqlParameter("@Name", name),
                new SqlParameter("@Phone", phone),
                new SqlParameter("@Photo", (object)photoPath ?? DBNull.Value),
                new SqlParameter("@UserId", userId),
                new SqlParameter("@Emergency", emergency),
                new SqlParameter("@DriverId", driverId));

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
                        VALUES (@UserId, 'Home', @Addr, 'Ahmedabad', 'Gujarat', '380051', 'India', @Phone, 'Residential', 1)",
                        new SqlParameter("@UserId", userId),
                        new SqlParameter("@Addr", address),
                        new SqlParameter("@Phone", phone));
                }
            }

            Session["FullName"] = name;
            pnlEditInfo.Visible = false;
            pnlViewInfo.Visible = true;
            lblProfileMsg.ForeColor = System.Drawing.Color.Green;
            lblProfileMsg.Text = "Profile updated and saved to database.";
            LoadProfile();
        }
    }
}
