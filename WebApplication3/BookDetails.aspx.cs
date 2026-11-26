using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class BookingDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookingDetails();
            }
        }

        private void LoadBookingDetails()
        {
            string bookingNo = Request.QueryString["id"];
            if (string.IsNullOrEmpty(bookingNo))
                bookingNo = Session["SelectedBookingId"]?.ToString();

            int customerId = DbHelper.GetLoggedInUserId(Session);

            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT TOP 1
                    b.BookingId,
                    b.BookingNumber,
                    b.BookingStatus,
                    b.PickupAddress,
                    b.DropAddress,
                    b.Instructions,
                    FORMAT(b.PreferredDate, 'dd MMM yyyy, hh:mm tt') AS BookingDate,
                    ISNULL(p.PaymentId, 0) AS PaymentId,
                    ISNULL(p.PaymentStatus, 'Pending') AS PaymentStatus,
                    ISNULL(p.PaymentMethod, 'UPI') AS PaymentMethod,
                    N'₹' + FORMAT(ISNULL(p.Amount, ISNULL(b.BaseFare, 0) + ISNULL(b.TollsTaxes, 0)), 'N2') AS TotalAmount,
                    ISNULL(b.VehicleType, 'Medium Truck') AS VehicleType,
                    ISNULL(v.RegistrationNumber, 'Pending') AS RegNo,
                    ISNULL(du.FullName, 'Waiting for Driver') AS DriverName,
                    ISNULL(du.Phone, '-') AS DriverPhone,
                    ISNULL(ld.LoadType, 'Standard Cargo') AS LoadType,
                    CAST(CAST(ISNULL(ld.WeightKg, 0) AS INT) AS VARCHAR) + ' kg (' + CAST(ISNULL(ld.PackageCount, 0) AS VARCHAR) + ' pkgs)' AS Weight,
                    ISNULL(u.FullName, '') AS CustomerName,
                    ISNULL(u.Email, '') AS CustomerEmail,
                    ISNULL(u.Phone, '') AS CustomerPhone,
                    ISNULL((SELECT TOP 1 MilestoneStatus FROM TripMilestones tm WHERE tm.BookingId = b.BookingId AND tm.MilestoneType = 'Pickup'), 'Pending') AS PickupMsStatus,
                    ISNULL((SELECT TOP 1 MilestoneStatus FROM TripMilestones tm WHERE tm.BookingId = b.BookingId AND tm.MilestoneType = 'Drop'), 'Pending') AS DropMsStatus
                FROM Bookings b
                LEFT JOIN Payments p ON b.BookingId = p.BookingId
                LEFT JOIN BookingLoadDetails ld ON b.BookingId = ld.BookingId
                LEFT JOIN Users u ON b.CustomerId = u.UserId
                LEFT JOIN Vehicles v ON b.VehicleId = v.VehicleId
                LEFT JOIN Drivers d ON b.DriverId = d.DriverId
                LEFT JOIN Users du ON d.UserId = du.UserId
                WHERE b.CustomerId = @CustomerId
                  AND (@BookingNo IS NULL OR b.BookingNumber = @BookingNo)
                ORDER BY b.BookingId DESC",
                new SqlParameter("@CustomerId", customerId),
                new SqlParameter("@BookingNo", string.IsNullOrEmpty(bookingNo) ? (object)DBNull.Value : bookingNo.Trim('#', ' ')));

            if (dt.Rows.Count > 0)
            {
                var r = dt.Rows[0];
                int bookingId = Convert.ToInt32(r["BookingId"]);
                string loadedNo = r["BookingNumber"].ToString();
                string status = r["BookingStatus"].ToString();
                string pickupMs = r["PickupMsStatus"].ToString();
                string dropMs = r["DropMsStatus"].ToString();

                ViewState["CurrentBookingNumber"] = loadedNo;
                ViewState["CurrentBookingId"] = bookingId;

                lblBookingTitle.InnerText = "#" + loadedNo;
                lblStatus.InnerText = status;
                lblStatus.Attributes["class"] = "bd-status " + status.ToLower();
                lblBookingDate.InnerText = r["BookingDate"].ToString();
                lblPaymentStatus.InnerText = r["PaymentStatus"].ToString();
                lblPaymentMethod.InnerText = r["PaymentMethod"].ToString();
                lblTotalAmount.InnerText = r["TotalAmount"].ToString();
                lblVehicle.InnerText = r["VehicleType"] + " (" + r["RegNo"] + ")";
                lblLoadType.InnerText = r["LoadType"].ToString();
                lblWeight.InnerText = r["Weight"].ToString();
                lblCompany.InnerText = DbHelper.GetAppSetting("CompanyName", "Transpo Logistics");
                lblContactPerson.InnerText = r["CustomerName"].ToString();
                lblEmail.InnerText = r["CustomerEmail"].ToString();
                lblPhone.InnerText = r["CustomerPhone"].ToString();

                lblPickupAddress.InnerText = r["PickupAddress"].ToString();
                lblDropAddress.InnerText = r["DropAddress"].ToString();
                lblDriverInfo.InnerText = r["DriverName"] + " (" + r["DriverPhone"] + ")";
                lblInstructions.InnerText = string.IsNullOrWhiteSpace(r["Instructions"]?.ToString()) ? "None" : r["Instructions"].ToString();

                btnConfirmArrived.Visible = status.Equals("Confirmed", StringComparison.OrdinalIgnoreCase);
                btnConfirmCompleted.Visible = status.Equals("Ongoing", StringComparison.OrdinalIgnoreCase);
                btnPayNow.Visible = string.Equals(r["PaymentStatus"].ToString(), "Pending", StringComparison.OrdinalIgnoreCase)
                                    && !string.Equals(status, "Cancelled", StringComparison.OrdinalIgnoreCase);

                if (status == "Pending")
                    litWorkflowStatus.Text = "Full payment received. Waiting for a driver to view and confirm this trip.";
                else if (status == "Confirmed")
                    litWorkflowStatus.Text = pickupMs == "DriverArrived"
                        ? "Driver has arrived at pickup! Click 'Confirm Driver Arrived' to release the 1st half (50%) payment to the driver."
                        : "Driver " + r["DriverName"] + " confirmed this trip and is heading to pickup. Confirm below when the driver arrives.";
                else if (status == "Ongoing")
                    litWorkflowStatus.Text = dropMs == "DriverDelivered"
                        ? "1st half (50%) released. Driver marked trip as delivered! Click 'Confirm Trip Completed' to release the 2nd half (50%)."
                        : "1st half (50%) released to driver. Trip is currently in transit. Confirm below once delivery is completed.";
                else if (status == "Completed")
                    litWorkflowStatus.Text = "Trip completed! Both halves (100%) of the driver payout have been released.";
                else
                    litWorkflowStatus.Text = "This booking has been cancelled.";
            }
        }

        protected void btnConfirmArrived_Click(object sender, EventArgs e)
        {
            if (ViewState["CurrentBookingId"] == null) return;
            int bookingId = Convert.ToInt32(ViewState["CurrentBookingId"]);
            int customerId = DbHelper.GetLoggedInUserId(Session);

            string msg;
            bool ok = DbHelper.ConfirmDriverArrivedByCustomer(bookingId, customerId, out msg);
            lblDetailMsg.ForeColor = ok ? System.Drawing.Color.Green : System.Drawing.Color.Red;
            lblDetailMsg.Text = msg;
            LoadBookingDetails();
        }

        protected void btnConfirmCompleted_Click(object sender, EventArgs e)
        {
            if (ViewState["CurrentBookingId"] == null) return;
            int bookingId = Convert.ToInt32(ViewState["CurrentBookingId"]);
            int customerId = DbHelper.GetLoggedInUserId(Session);

            string msg;
            bool ok = DbHelper.ConfirmTripCompletedByCustomer(bookingId, customerId, out msg);
            lblDetailMsg.ForeColor = ok ? System.Drawing.Color.Green : System.Drawing.Color.Red;
            lblDetailMsg.Text = msg;
            LoadBookingDetails();
        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            if (ViewState["CurrentBookingId"] == null) return;
            int bookingId = Convert.ToInt32(ViewState["CurrentBookingId"]);

            DbHelper.ExecuteNonQuery(@"
                UPDATE Payments
                SET PaymentStatus = 'Paid',
                    PaymentMethod = 'Online',
                    TransactionReference = ISNULL(TransactionReference, @TxnRef),
                    PaidAt = SYSDATETIME()
                WHERE BookingId = @BookingId AND PaymentStatus = 'Pending'",
                new SqlParameter("@BookingId", bookingId),
                new SqlParameter("@TxnRef", "TXN-" + Guid.NewGuid().ToString().Substring(0, 8).ToUpper()));

            lblDetailMsg.ForeColor = System.Drawing.Color.Green;
            lblDetailMsg.Text = "Payment completed successfully!";
            LoadBookingDetails();
        }
    }
}
