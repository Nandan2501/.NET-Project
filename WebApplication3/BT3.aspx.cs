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
                if (Session["FromLocation"] == null || Session["ToLocation"] == null)
                {
                    Response.Redirect("BookTransportation.aspx");
                    return;
                }
                LoadBookingDetails();
            }
        }

        private void LoadBookingDetails()
        {
            string fromLoc = Session["FromLocation"]?.ToString() ?? "";
            string toLoc = Session["ToLocation"]?.ToString() ?? "";
            string vehicle = Session["VehicleType"]?.ToString() ?? "Medium Truck (6-Wheeler)";
            string prefDate = Session["PreferredDate"]?.ToString() ?? DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            string instructions = Session["Instructions"]?.ToString();
            string loadType = Session["LoadType"]?.ToString() ?? "Packaged Goods";
            string weightStr = Session["Weight"]?.ToString() ?? "850";
            string packagesStr = Session["Packages"]?.ToString() ?? "12";
            string length = Session["Length"]?.ToString() ?? "120";
            string width = Session["Width"]?.ToString() ?? "80";
            string height = Session["Height"]?.ToString() ?? "60";
            string handling = Session["SpecialHandling"]?.ToString();

            lblFrom.InnerText = fromLoc;
            lblTo.InnerText = toLoc;
            lblVehicle.InnerText = vehicle;

            DateTime parsedDate;
            lblDate.InnerText = DateTime.TryParse(prefDate, out parsedDate)
                ? parsedDate.ToString("dddd, dd MMM yyyy")
                : prefDate;

            lblInstructions.InnerText = string.IsNullOrWhiteSpace(instructions) ? "None" : instructions;
            lblLoadType.InnerText = loadType;
            lblWeight.InnerText = weightStr + " kg";
            lblPackages.InnerText = packagesStr + " Packages";
            lblDimensions.InnerText = length + " x " + width + " x " + height + " cm";
            lblHandling.InnerText = string.IsNullOrWhiteSpace(handling) ? "Standard handling" : handling;

            decimal weightVal;
            decimal.TryParse(weightStr, out weightVal);
            decimal distKm, baseFare, tollsTaxes;
            DbHelper.CalculateEstimatedFare(vehicle, weightVal, out distKm, out baseFare, out tollsTaxes);
            decimal total = baseFare + tollsTaxes;
            litEstimatedCost.Text = "₹" + total.ToString("N0");
            btnConfirm.Text = "Pay ₹" + total.ToString("N0") + " & Confirm Booking";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("BT2.aspx");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            int customerId = DbHelper.GetLoggedInUserId(Session);
            if (customerId <= 0)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string fromLocation = Session["FromLocation"]?.ToString() ?? "";
            string toLocation = Session["ToLocation"]?.ToString() ?? "";
            if (string.IsNullOrWhiteSpace(fromLocation) || string.IsNullOrWhiteSpace(toLocation))
            {
                Response.Redirect("BookTransportation.aspx");
                return;
            }

            string vehicleType = Session["VehicleType"]?.ToString() ?? "Medium Truck (6-Wheeler)";
            string preferredDateStr = Session["PreferredDate"]?.ToString();
            string instructions = Session["Instructions"]?.ToString() ?? "";

            DateTime preferredDate;
            if (!DateTime.TryParse(preferredDateStr, out preferredDate))
                preferredDate = DateTime.Now.AddDays(1);

            string loadType = Session["LoadType"]?.ToString() ?? "Packaged Goods";
            decimal weight;
            decimal.TryParse(Session["Weight"]?.ToString(), out weight);
            if (weight <= 0) weight = 850;

            int packages;
            int.TryParse(Session["Packages"]?.ToString(), out packages);
            if (packages <= 0) packages = 1;

            decimal length, width, height;
            decimal.TryParse(Session["Length"]?.ToString(), out length);
            decimal.TryParse(Session["Width"]?.ToString(), out width);
            decimal.TryParse(Session["Height"]?.ToString(), out height);
            string specialHandling = Session["SpecialHandling"]?.ToString() ?? "";

            decimal distKm, baseFare, tollsTaxes;
            DbHelper.CalculateEstimatedFare(vehicleType, weight, out distKm, out baseFare, out tollsTaxes);
            decimal totalAmount = baseFare + tollsTaxes;

            string bookingNumber = "TRP-" + DateTime.Now.ToString("yyMMdd") + "-" + new Random().Next(100, 999);
            string fromCity = fromLocation.Contains(",") ? fromLocation.Split(',')[0].Trim() : fromLocation;
            string toCity = toLocation.Contains(",") ? toLocation.Split(',')[0].Trim() : toLocation;

            // Leave DriverId & VehicleId NULL and BookingStatus = 'Pending' so drivers can view & accept the trip!
            string insertBookingSql = @"
                INSERT INTO Bookings (BookingNumber, CustomerId, DriverId, VehicleId,
                                      PickupAddress, PickupCity, DropAddress, DropCity,
                                      VehicleType, PreferredDate, Instructions, DistanceKm, BaseFare, TollsTaxes, BookingStatus)
                VALUES (@BookingNo, @CustomerId, NULL, NULL,
                        @PickupAddress, @PickupCity, @DropAddress, @DropCity,
                        @VehicleType, @PreferredDate, @Instructions, @DistanceKm, @BaseFare, @TollsTaxes, 'Pending');
                SELECT SCOPE_IDENTITY();";

            string dbErr;
            object newBookingIdObj = DbHelper.ExecuteScalarWithError(insertBookingSql, out dbErr,
                new SqlParameter("@BookingNo", bookingNumber),
                new SqlParameter("@CustomerId", customerId),
                new SqlParameter("@PickupAddress", fromLocation),
                new SqlParameter("@PickupCity", fromCity),
                new SqlParameter("@DropAddress", toLocation),
                new SqlParameter("@DropCity", toCity),
                new SqlParameter("@VehicleType", vehicleType),
                new SqlParameter("@PreferredDate", preferredDate),
                new SqlParameter("@Instructions", instructions),
                new SqlParameter("@DistanceKm", distKm),
                new SqlParameter("@BaseFare", baseFare),
                new SqlParameter("@TollsTaxes", tollsTaxes));

            if (newBookingIdObj == null || newBookingIdObj == DBNull.Value)
            {
                lblError.Text = "Could not save booking: " + dbErr;
                return;
            }

            int bookingId = Convert.ToInt32(newBookingIdObj);

            DbHelper.ExecuteNonQuery(@"
                INSERT INTO BookingLoadDetails (BookingId, LoadType, WeightKg, PackageCount,
                                                LengthCm, WidthCm, HeightCm, SpecialHandling)
                VALUES (@BookingId, @LoadType, @Weight, @Packages, @Length, @Width, @Height, @Handling)",
                new SqlParameter("@BookingId", bookingId),
                new SqlParameter("@LoadType", loadType),
                new SqlParameter("@Weight", weight),
                new SqlParameter("@Packages", packages),
                new SqlParameter("@Length", length > 0 ? length : 120m),
                new SqlParameter("@Width", width > 0 ? width : 80m),
                new SqlParameter("@Height", height > 0 ? height : 60m),
                new SqlParameter("@Handling", specialHandling));

            string paymentMethod = rblPaymentMethod.SelectedValue;
            if (string.IsNullOrEmpty(paymentMethod)) paymentMethod = "UPI";

            // Full payment collected upfront
            DbHelper.ExecuteNonQuery(@"
                INSERT INTO Payments (BookingId, Amount, PaymentMethod, TransactionReference, PaymentStatus, PaidAt)
                VALUES (@BookingId, @Amount, @Method, @TxnRef, 'Paid', SYSDATETIME())",
                new SqlParameter("@BookingId", bookingId),
                new SqlParameter("@Amount", totalAmount),
                new SqlParameter("@Method", paymentMethod),
                new SqlParameter("@TxnRef", "TXN-" + Guid.NewGuid().ToString().Substring(0, 8).ToUpper()));

            DbHelper.ExecuteNonQuery(@"
                INSERT INTO TripMilestones (BookingId, LocationName, MilestoneType, ExpectedTime, MilestoneStatus)
                VALUES (@BookingId, @FromLocation, 'Pickup', @ExpectedPickup, 'Pending'),
                       (@BookingId, @ToLocation, 'Drop', @ExpectedDrop, 'Pending')",
                new SqlParameter("@BookingId", bookingId),
                new SqlParameter("@FromLocation", fromLocation),
                new SqlParameter("@ExpectedPickup", preferredDate),
                new SqlParameter("@ToLocation", toLocation),
                new SqlParameter("@ExpectedDrop", preferredDate.AddHours(4)));

            Session.Remove("FromLocation");
            Session.Remove("ToLocation");
            Session.Remove("VehicleType");
            Session.Remove("PreferredDate");
            Session.Remove("Instructions");
            Session.Remove("LoadType");
            Session.Remove("Weight");
            Session.Remove("Packages");
            Session.Remove("Length");
            Session.Remove("Width");
            Session.Remove("Height");
            Session.Remove("SpecialHandling");

            Session["BookingID"] = bookingNumber;
            Response.Redirect("ConfirmBook.aspx");
        }
    }
}
