using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class TripDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDropdowns();
                LoadTripDetails();
            }
        }

        private void LoadDropdowns()
        {
            DataTable dtDrivers = DbHelper.ExecuteQuery(@"
                SELECT d.DriverId, u.FullName + ' (' + d.LicenseNumber + ')' AS DisplayName
                FROM Drivers d
                INNER JOIN Users u ON d.UserId = u.UserId
                ORDER BY u.FullName");

            ddlAssignDriver.Items.Clear();
            ddlAssignDriver.Items.Add(new ListItem("-- Unassigned --", ""));
            foreach (DataRow r in dtDrivers.Rows)
            {
                ddlAssignDriver.Items.Add(new ListItem(r["DisplayName"].ToString(), r["DriverId"].ToString()));
            }

            DataTable dtVehicles = DbHelper.ExecuteQuery(@"
                SELECT VehicleId, VehicleName + ' (' + RegistrationNumber + ')' AS DisplayName
                FROM Vehicles
                ORDER BY VehicleName");

            ddlAssignVehicle.Items.Clear();
            ddlAssignVehicle.Items.Add(new ListItem("-- Unassigned --", ""));
            foreach (DataRow r in dtVehicles.Rows)
            {
                ddlAssignVehicle.Items.Add(new ListItem(r["DisplayName"].ToString(), r["VehicleId"].ToString()));
            }
        }

        private void LoadTripDetails()
        {
            string bookingNo = Request.QueryString["id"];

            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT TOP 1
                    b.BookingId,
                    b.BookingNumber,
                    b.BookingStatus,
                    b.DriverId,
                    b.VehicleId,
                    b.PickupAddress,
                    ISNULL(b.PickupCity, b.PickupAddress) AS PickupCity,
                    b.DropAddress,
                    ISNULL(b.DropCity, b.DropAddress) AS DropCity,
                    FORMAT(b.PreferredDate, 'dd MMM yyyy, hh:mm tt') AS TripDate,
                    FORMAT(b.PreferredDate, 'hh:mm tt') AS PickupTime,
                    FORMAT(DATEADD(hour, 4, b.PreferredDate), 'hh:mm tt') AS EstDropTime,
                    ISNULL(b.BaseFare, 0) AS BaseFare,
                    ISNULL(b.TollsTaxes, 0) AS TollsTaxes,
                    ISNULL(u.FullName, 'Customer') AS CustomerName,
                    ISNULL(v.VehicleName, 'Unassigned') AS VehicleName,
                    ISNULL(v.RegistrationNumber, '-') AS RegistrationNumber,
                    ISNULL(du.FullName, 'Unassigned') AS DriverName,
                    ISNULL(d.LicenseNumber, '-') AS LicenseNumber,
                    ISNULL(p.PaymentStatus, 'Pending') AS PaymentStatus,
                    ISNULL(p.Amount, ISNULL(b.BaseFare, 0) + ISNULL(b.TollsTaxes, 0)) AS TotalAmount
                FROM Bookings b
                LEFT JOIN Users u ON b.CustomerId = u.UserId
                LEFT JOIN Vehicles v ON b.VehicleId = v.VehicleId
                LEFT JOIN Drivers d ON b.DriverId = d.DriverId
                LEFT JOIN Users du ON d.UserId = du.UserId
                LEFT JOIN Payments p ON b.BookingId = p.BookingId
                WHERE (@BookingNo IS NULL OR b.BookingNumber = @BookingNo)
                ORDER BY b.BookingId DESC",
                new SqlParameter("@BookingNo", string.IsNullOrEmpty(bookingNo) ? (object)DBNull.Value : bookingNo.Trim('#', ' ')));

            if (dt.Rows.Count == 0)
            {
                lblActionMsg.ForeColor = System.Drawing.Color.Red;
                lblActionMsg.Text = "No trip found.";
                return;
            }

            var r = dt.Rows[0];
            int bookingId = Convert.ToInt32(r["BookingId"]);
            ViewState["BookingId"] = bookingId;
            ViewState["BookingNumber"] = r["BookingNumber"].ToString();

            litBookingNumber.Text = r["BookingNumber"].ToString();
            litCustomerName.Text = Server.HtmlEncode(r["CustomerName"].ToString());
            litTripDate.Text = r["TripDate"].ToString();

            string status = r["BookingStatus"].ToString();
            spnBookingStatus.InnerText = status;
            spnBookingStatus.Attributes["class"] = GetBadgeClass(status);

            litVehicleName.Text = Server.HtmlEncode(r["VehicleName"].ToString());
            litVehicleReg.Text = Server.HtmlEncode(r["RegistrationNumber"].ToString());
            litDriverName.Text = Server.HtmlEncode(r["DriverName"].ToString());
            litDriverLicense.Text = Server.HtmlEncode(r["LicenseNumber"].ToString());

            litPickupAddress.Text = Server.HtmlEncode(r["PickupAddress"].ToString());
            litDropAddress.Text = Server.HtmlEncode(r["DropAddress"].ToString());

            decimal total = Convert.ToDecimal(r["TotalAmount"]);
            decimal baseFare = Convert.ToDecimal(r["BaseFare"]);
            decimal tolls = Convert.ToDecimal(r["TollsTaxes"]);
            if (baseFare == 0 && total > 0)
            {
                baseFare = Math.Round(total * 0.92m, 0);
                tolls = total - baseFare;
            }

            litBaseFare.Text = "₹" + baseFare.ToString("N0");
            litTolls.Text = "₹" + tolls.ToString("N0");
            litTotalAmount.Text = "₹" + total.ToString("N0");

            litOriginCity.Text = Server.HtmlEncode(r["PickupCity"].ToString());
            litDropCity.Text = Server.HtmlEncode(r["DropCity"].ToString());
            litOriginTime.Text = r["PickupTime"].ToString();
            litDropTime.Text = r["EstDropTime"].ToString();

            // Load milestones if present
            DataTable dtMs = DbHelper.ExecuteQuery(
                "SELECT MilestoneType, MilestoneStatus, FORMAT(ISNULL(ActualTime, ExpectedTime), 'hh:mm tt') AS MsTime FROM TripMilestones WHERE BookingId = @BookingId",
                new SqlParameter("@BookingId", bookingId));
            foreach (DataRow m in dtMs.Rows)
            {
                if (m["MilestoneType"].ToString().Equals("Pickup", StringComparison.OrdinalIgnoreCase))
                {
                    litPickupMilestoneStatus.Text = m["MilestoneStatus"].ToString();
                    if (!string.IsNullOrEmpty(m["MsTime"]?.ToString())) litOriginTime.Text = m["MsTime"].ToString();
                }
                else if (m["MilestoneType"].ToString().Equals("Drop", StringComparison.OrdinalIgnoreCase))
                {
                    litDropMilestoneStatus.Text = m["MilestoneStatus"].ToString();
                    if (!string.IsNullOrEmpty(m["MsTime"]?.ToString())) litDropTime.Text = m["MsTime"].ToString();
                }
            }

            // Set dropdown selections
            string dId = r["DriverId"] != DBNull.Value ? r["DriverId"].ToString() : "";
            if (ddlAssignDriver.Items.FindByValue(dId) != null) ddlAssignDriver.SelectedValue = dId;

            string vId = r["VehicleId"] != DBNull.Value ? r["VehicleId"].ToString() : "";
            if (ddlAssignVehicle.Items.FindByValue(vId) != null) ddlAssignVehicle.SelectedValue = vId;

            if (ddlBookingStatus.Items.FindByValue(status) != null) ddlBookingStatus.SelectedValue = status;

            string payStatus = r["PaymentStatus"].ToString();
            if (ddlPaymentStatus.Items.FindByValue(payStatus) != null) ddlPaymentStatus.SelectedValue = payStatus;
        }

        private string GetBadgeClass(string status)
        {
            switch ((status ?? "").ToLowerInvariant())
            {
                case "completed": return "admin-status delivered";
                case "ongoing":
                case "confirmed": return "admin-status transit";
                case "pending": return "admin-status pending";
                default: return "td-cancelled";
            }
        }

        protected void btnUpdateTrip_Click(object sender, EventArgs e)
        {
            if (ViewState["BookingId"] == null) return;
            int bookingId = Convert.ToInt32(ViewState["BookingId"]);
            string bookingNumber = ViewState["BookingNumber"]?.ToString() ?? "";

            int driverId;
            object driverVal = int.TryParse(ddlAssignDriver.SelectedValue, out driverId) && driverId > 0
                ? (object)driverId
                : DBNull.Value;

            int vehicleId;
            object vehicleVal = int.TryParse(ddlAssignVehicle.SelectedValue, out vehicleId) && vehicleId > 0
                ? (object)vehicleId
                : DBNull.Value;

            string newStatus = ddlBookingStatus.SelectedValue;
            string newPayStatus = ddlPaymentStatus.SelectedValue;

            string err;
            DbHelper.ExecuteNonQueryWithError(@"
                UPDATE Bookings
                SET DriverId = @DriverId,
                    VehicleId = @VehicleId,
                    BookingStatus = @Status
                WHERE BookingId = @BookingId", out err,
                new SqlParameter("@DriverId", driverVal),
                new SqlParameter("@VehicleId", vehicleVal),
                new SqlParameter("@Status", newStatus),
                new SqlParameter("@BookingId", bookingId));

            if (!string.IsNullOrEmpty(err))
            {
                lblActionMsg.ForeColor = System.Drawing.Color.Red;
                lblActionMsg.Text = "Error updating trip: " + err;
                return;
            }

            DbHelper.ExecuteNonQuery(@"
                UPDATE Payments
                SET PaymentStatus = @PayStatus,
                    PaidAt = CASE WHEN @PayStatus = 'Paid' AND PaidAt IS NULL THEN SYSDATETIME() ELSE PaidAt END
                WHERE BookingId = @BookingId",
                new SqlParameter("@PayStatus", newPayStatus),
                new SqlParameter("@BookingId", bookingId));

            if (newStatus == "Completed")
            {
                DbHelper.ExecuteNonQuery(@"
                    UPDATE TripMilestones
                    SET MilestoneStatus = 'Completed', ActualTime = ISNULL(ActualTime, SYSDATETIME())
                    WHERE BookingId = @BookingId",
                    new SqlParameter("@BookingId", bookingId));

                if (driverVal != DBNull.Value)
                {
                    int hasEarning = Convert.ToInt32(DbHelper.ExecuteScalar(
                        "SELECT COUNT(1) FROM DriverEarnings WHERE BookingId = @BookingId",
                        new SqlParameter("@BookingId", bookingId)) ?? 0);
                    if (hasEarning == 0)
                    {
                        DbHelper.ExecuteNonQuery(@"
                            INSERT INTO DriverEarnings (DriverId, BookingId, GrossAmount, Commission, PayoutStatus, TransactionRef, Description)
                            VALUES (@DriverId, @BookingId, 2500.00, 250.00, 'Pending', @TxnRef, @Desc)",
                            new SqlParameter("@DriverId", driverVal),
                            new SqlParameter("@BookingId", bookingId),
                            new SqlParameter("@TxnRef", "TXN-" + Guid.NewGuid().ToString().Substring(0, 8).ToUpper()),
                            new SqlParameter("@Desc", "Earnings for " + bookingNumber));
                    }
                }
            }
            else if (newStatus == "Cancelled")
            {
                DbHelper.ExecuteNonQuery(
                    "UPDATE TripMilestones SET MilestoneStatus = 'Cancelled' WHERE BookingId = @BookingId",
                    new SqlParameter("@BookingId", bookingId));
            }

            lblActionMsg.ForeColor = System.Drawing.Color.Green;
            lblActionMsg.Text = "Trip #" + bookingNumber + " updated in database.";
            LoadTripDetails();
        }
    }
}
