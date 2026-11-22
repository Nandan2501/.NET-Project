using System;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class BT3 : System.Web.UI.Page
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
            lblFrom.InnerText =
                Session["FromLocation"]?.ToString()
                ?? "Rajkot, Gujarat";

            lblTo.InnerText =
                Session["ToLocation"]?.ToString()
                ?? "Baroda, Gujarat";

            lblVehicle.InnerText =
                Session["VehicleType"]?.ToString()
                ?? "Medium Truck (6-Wheeler)";

            lblDate.InnerText =
                Session["PreferredDate"]?.ToString()
                ?? "Monday, 17 Aug 2026";

            lblInstructions.InnerText =
                Session["Instructions"]?.ToString()
                ?? "Fragile load. Needs careful stacking.";

            lblLoadType.InnerText =
                Session["LoadType"]?.ToString()
                ?? "Packaged Goods";

            lblWeight.InnerText =
                (Session["Weight"]?.ToString() ?? "850") + " kg";

            lblPackages.InnerText =
                (Session["Packages"]?.ToString() ?? "12") + " Packages";

            string length =
                Session["Length"]?.ToString() ?? "120";

            string width =
                Session["Width"]?.ToString() ?? "80";

            string height =
                Session["Height"]?.ToString() ?? "60";

            lblDimensions.InnerText =
                length + " x " + width + " x " + height + " cm";

            lblHandling.InnerText =
                Session["SpecialHandling"]?.ToString()
                ?? "Temperature sensitive. Keep below 25°C.";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("BT2.aspx");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            int customerId = DbHelper.GetLoggedInUserId(Session);

            string fromLocation = Session["FromLocation"]?.ToString() ?? "Rajkot, Gujarat";
            string toLocation = Session["ToLocation"]?.ToString() ?? "Baroda, Gujarat";
            string vehicleType = Session["VehicleType"]?.ToString() ?? "Medium Truck (6-Wheeler)";
            string preferredDateStr = Session["PreferredDate"]?.ToString();
            string instructions = Session["Instructions"]?.ToString() ?? "";

            DateTime preferredDate;
            if (!DateTime.TryParse(preferredDateStr, out preferredDate))
            {
                preferredDate = DateTime.Now.AddDays(1);
            }

            string loadType = Session["LoadType"]?.ToString() ?? "Packaged Goods";
            decimal weight;
            decimal.TryParse(Session["Weight"]?.ToString(), out weight);
            int packages;
            int.TryParse(Session["Packages"]?.ToString(), out packages);
            decimal length, width, height;
            decimal.TryParse(Session["Length"]?.ToString(), out length);
            decimal.TryParse(Session["Width"]?.ToString(), out width);
            decimal.TryParse(Session["Height"]?.ToString(), out height);
            string specialHandling = Session["SpecialHandling"]?.ToString() ?? "";

            string bookingNumber = "TRP-" + new Random().Next(2000, 9999);
            string fromCity = fromLocation.Contains(",") ? fromLocation.Split(',')[0].Trim() : fromLocation;
            string toCity = toLocation.Contains(",") ? toLocation.Split(',')[0].Trim() : toLocation;

            object driverIdObj = DbHelper.ExecuteScalar(
                "SELECT TOP 1 DriverId FROM Drivers WHERE VerificationStatus = 'Active' ORDER BY DriverId ASC");
            object vehicleIdObj = DbHelper.ExecuteScalar(
                "SELECT TOP 1 VehicleId FROM Vehicles WHERE VehicleStatus = 'Active' ORDER BY VehicleId ASC");

            string insertBookingSql = @"
                INSERT INTO Bookings (BookingNumber, CustomerId, DriverId, VehicleId, 
                                      PickupAddress, PickupCity, DropAddress, DropCity, 
                                      VehicleType, PreferredDate, Instructions, BookingStatus)
                VALUES (@BookingNo, @CustomerId, @DriverId, @VehicleId, 
                        @PickupAddress, @PickupCity, @DropAddress, @DropCity, 
                        @VehicleType, @PreferredDate, @Instructions, 'Confirmed');
                SELECT SCOPE_IDENTITY();";

            object newBookingIdObj = DbHelper.ExecuteScalar(insertBookingSql,
                new SqlParameter("@BookingNo", bookingNumber),
                new SqlParameter("@CustomerId", customerId),
                new SqlParameter("@DriverId", driverIdObj ?? DBNull.Value),
                new SqlParameter("@VehicleId", vehicleIdObj ?? DBNull.Value),
                new SqlParameter("@PickupAddress", fromLocation),
                new SqlParameter("@PickupCity", fromCity),
                new SqlParameter("@DropAddress", toLocation),
                new SqlParameter("@DropCity", toCity),
                new SqlParameter("@VehicleType", vehicleType),
                new SqlParameter("@PreferredDate", preferredDate),
                new SqlParameter("@Instructions", instructions));

            if (newBookingIdObj != null && newBookingIdObj != DBNull.Value)
            {
                int bookingId = Convert.ToInt32(newBookingIdObj);

                string insertLoadSql = @"
                    INSERT INTO BookingLoadDetails (BookingId, LoadType, WeightKg, PackageCount, 
                                                    LengthCm, WidthCm, HeightCm, SpecialHandling)
                    VALUES (@BookingId, @LoadType, @Weight, @Packages, @Length, @Width, @Height, @Handling)";

                DbHelper.ExecuteNonQuery(insertLoadSql,
                    new SqlParameter("@BookingId", bookingId),
                    new SqlParameter("@LoadType", loadType),
                    new SqlParameter("@Weight", weight > 0 ? (object)weight : 850),
                    new SqlParameter("@Packages", packages > 0 ? (object)packages : 12),
                    new SqlParameter("@Length", length > 0 ? (object)length : 120),
                    new SqlParameter("@Width", width > 0 ? (object)width : 80),
                    new SqlParameter("@Height", height > 0 ? (object)height : 60),
                    new SqlParameter("@Handling", specialHandling));

                string insertPaymentSql = @"
                    INSERT INTO Payments (BookingId, Amount, PaymentMethod, TransactionReference, PaymentStatus, PaidAt)
                    VALUES (@BookingId, 12000.00, 'Online', @TxnRef, 'Paid', SYSDATETIME())";

                DbHelper.ExecuteNonQuery(insertPaymentSql,
                    new SqlParameter("@BookingId", bookingId),
                    new SqlParameter("@TxnRef", "TXN-" + Guid.NewGuid().ToString().Substring(0, 8).ToUpper()));

                DbHelper.ExecuteNonQuery(@"
                    INSERT INTO TripMilestones (BookingId, LocationName, MilestoneType, ExpectedTime, MilestoneStatus)
                    VALUES (@BookingId, @FromLocation, 'Pickup', @ExpectedPickup, 'Completed'),
                           (@BookingId, @ToLocation, 'Drop', @ExpectedDrop, 'Pending')",
                    new SqlParameter("@BookingId", bookingId),
                    new SqlParameter("@FromLocation", fromLocation),
                    new SqlParameter("@ExpectedPickup", preferredDate),
                    new SqlParameter("@ToLocation", toLocation),
                    new SqlParameter("@ExpectedDrop", preferredDate.AddHours(4)));
            }

            Session["BookingID"] = bookingNumber;
            Response.Redirect("ConfirmBook.aspx");
        }
    }
}
