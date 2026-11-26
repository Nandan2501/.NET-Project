using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.SessionState;

namespace WebApplication3
{
    public static class DbHelper
    {
        private static readonly string ConnectionString =
            ConfigurationManager.ConnectionStrings["TranspoDB"]?.ConnectionString ??
            @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=TranspoDB;Integrated Security=True;MultipleActiveResultSets=True;";

        public static SqlConnection GetConnection()
        {
            var conn = new SqlConnection(ConnectionString);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            return conn;
        }

        public static DataTable ExecuteQuery(string query, params SqlParameter[] parameters)
        {
            var dt = new DataTable();
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null && parameters.Length > 0)
                        cmd.Parameters.AddRange(parameters);

                    using (var da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }
            catch
            {
                // Return empty DataTable on error
            }
            return dt;
        }

        public static int ExecuteNonQuery(string query, params SqlParameter[] parameters)
        {
            string _;
            return ExecuteNonQueryWithError(query, out _, parameters);
        }

        public static int ExecuteNonQueryWithError(string query, out string errorMessage, params SqlParameter[] parameters)
        {
            errorMessage = string.Empty;
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null && parameters.Length > 0)
                        cmd.Parameters.AddRange(parameters);

                    conn.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return -1;
            }
        }

        public static object ExecuteScalar(string query, params SqlParameter[] parameters)
        {
            string _;
            return ExecuteScalarWithError(query, out _, parameters);
        }

        public static object ExecuteScalarWithError(string query, out string errorMessage, params SqlParameter[] parameters)
        {
            errorMessage = string.Empty;
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                using (var cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null && parameters.Length > 0)
                        cmd.Parameters.AddRange(parameters);

                    conn.Open();
                    return cmd.ExecuteScalar();
                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return null;
            }
        }

        public static bool ValidateUser(
            string emailOrPhone,
            string password,
            out int userId,
            out string fullName,
            out string role,
            out string email,
            out string phone)
        {
            userId = 0;
            fullName = string.Empty;
            role = "Customer";
            email = string.Empty;
            phone = string.Empty;

            try
            {
                const string query = @"
                    SELECT TOP 1 UserId, FullName, Email, Phone, Role, PasswordHash 
                    FROM Users 
                    WHERE (LOWER(Email) = LOWER(@Identifier) OR Phone = @Identifier)
                      AND AccountStatus = 'Active'";

                var dt = ExecuteQuery(query, new SqlParameter("@Identifier", emailOrPhone.Trim()));
                if (dt.Rows.Count > 0)
                {
                    var row = dt.Rows[0];
                    string storedPassword = row["PasswordHash"]?.ToString();
                    if (string.Equals(password, storedPassword, StringComparison.Ordinal))
                    {
                        userId = Convert.ToInt32(row["UserId"]);
                        fullName = row["FullName"]?.ToString() ?? string.Empty;
                        role = row["Role"]?.ToString() ?? "Customer";
                        email = row["Email"]?.ToString() ?? string.Empty;
                        phone = row["Phone"]?.ToString() ?? string.Empty;
                        return true;
                    }
                }
            }
            catch
            {
                // Fallback handled in calling page
            }

            return false;
        }

        public static bool RegisterUser(
            string fullName,
            string email,
            string phone,
            string password,
            out string errorMessage)
        {
            errorMessage = string.Empty;

            try
            {
                const string checkQuery = "SELECT COUNT(1) FROM Users WHERE LOWER(Email) = LOWER(@Email)";
                object existingObj = ExecuteScalar(checkQuery, new SqlParameter("@Email", email.Trim()));
                int existing = existingObj != null && existingObj != DBNull.Value ? Convert.ToInt32(existingObj) : 0;
                if (existing > 0)
                {
                    errorMessage = "An account with this email already exists.";
                    return false;
                }

                const string insertQuery = @"
                    INSERT INTO Users (FullName, Email, Phone, PasswordHash, Role, AccountStatus)
                    VALUES (@FullName, @Email, @Phone, @Password, 'Customer', 'Active');
                    SELECT SCOPE_IDENTITY();";

                var newId = ExecuteScalarWithError(insertQuery, out errorMessage,
                    new SqlParameter("@FullName", fullName.Trim()),
                    new SqlParameter("@Email", email.Trim()),
                    new SqlParameter("@Phone", phone.Trim()),
                    new SqlParameter("@Password", password));

                return newId != null && newId != DBNull.Value;
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return false;
            }
        }

        public static int GetLoggedInUserId(HttpSessionState session)
        {
            if (session != null && session["UserId"] != null)
            {
                int id;
                if (int.TryParse(session["UserId"].ToString(), out id) && id > 0)
                    return id;
            }

            if (session != null && session["UserEmail"] != null)
            {
                var obj = ExecuteScalar("SELECT UserId FROM Users WHERE LOWER(Email) = LOWER(@Email)",
                    new SqlParameter("@Email", session["UserEmail"].ToString()));
                if (obj != null && obj != DBNull.Value)
                    return Convert.ToInt32(obj);
            }

            return 0;
        }

        public static int GetLoggedInDriverId(HttpSessionState session)
        {
            if (session != null && session["DriverId"] != null)
            {
                int dId;
                if (int.TryParse(session["DriverId"].ToString(), out dId) && dId > 0)
                    return dId;
            }

            int userId = GetLoggedInUserId(session);
            if (userId > 0)
            {
                var obj = ExecuteScalar("SELECT DriverId FROM Drivers WHERE UserId = @UserId",
                    new SqlParameter("@UserId", userId));
                if (obj != null && obj != DBNull.Value)
                {
                    int driverId = Convert.ToInt32(obj);
                    if (session != null) session["DriverId"] = driverId;
                    return driverId;
                }
            }

            return 0;
        }

        public static string GetUserSetting(int userId, string key, string defaultValue = "")
        {
            if (userId <= 0) return defaultValue;
            object val = ExecuteScalar(
                "SELECT SettingValue FROM UserSettings WHERE UserId = @UserId AND SettingKey = @Key",
                new SqlParameter("@UserId", userId),
                new SqlParameter("@Key", key));
            return (val != null && val != DBNull.Value) ? val.ToString() : defaultValue;
        }

        public static void SaveUserSetting(int userId, string key, string value)
        {
            if (userId <= 0) return;
            ExecuteNonQuery(@"
                IF EXISTS (SELECT 1 FROM UserSettings WHERE UserId = @UserId AND SettingKey = @Key)
                    UPDATE UserSettings SET SettingValue = @Val WHERE UserId = @UserId AND SettingKey = @Key
                ELSE
                    INSERT INTO UserSettings (UserId, SettingKey, SettingValue) VALUES (@UserId, @Key, @Val)",
                new SqlParameter("@UserId", userId),
                new SqlParameter("@Key", key),
                new SqlParameter("@Val", value ?? string.Empty));
        }

        public static string GetAppSetting(string key, string defaultValue = "")
        {
            object val = ExecuteScalar(
                "SELECT SettingValue FROM AppSettings WHERE SettingKey = @Key",
                new SqlParameter("@Key", key));
            return (val != null && val != DBNull.Value) ? val.ToString() : defaultValue;
        }

        public static void SaveAppSetting(string key, string value)
        {
            ExecuteNonQuery(@"
                IF EXISTS (SELECT 1 FROM AppSettings WHERE SettingKey = @Key)
                    UPDATE AppSettings SET SettingValue = @Val, UpdatedAt = SYSDATETIME() WHERE SettingKey = @Key
                ELSE
                    INSERT INTO AppSettings (SettingKey, SettingValue) VALUES (@Key, @Val)",
                new SqlParameter("@Key", key),
                new SqlParameter("@Val", value ?? string.Empty));
        }

        public static void CalculateEstimatedFare(
            string vehicleType,
            decimal weightKg,
            out decimal distanceKm,
            out decimal baseFare,
            out decimal tollsTaxes)
        {
            distanceKm = 210m;
            decimal ratePerVehicle = 8500m;
            string vt = (vehicleType ?? string.Empty).ToLowerInvariant();
            if (vt.Contains("large") || vt.Contains("heavy") || vt.Contains("10-wheeler"))
            {
                ratePerVehicle = 14500m;
            }
            else if (vt.Contains("small") || vt.Contains("pickup"))
            {
                ratePerVehicle = 6500m;
            }

            decimal weightSurcharge = weightKg > 500m ? Math.Round((weightKg - 500m) * 2.5m, 0) : 0m;
            baseFare = ratePerVehicle + weightSurcharge;
            tollsTaxes = Math.Round(baseFare * 0.08m, 0);
        }

        public static decimal GetDriverTotalShare(decimal baseFare)
        {
            if (baseFare <= 0) baseFare = 8000m;
            return Math.Round(baseFare * 0.70m, 0);
        }

        public static bool AcceptTripByDriver(int bookingId, int driverId, out string message)
        {
            message = string.Empty;
            if (bookingId <= 0 || driverId <= 0)
            {
                message = "Invalid trip or driver.";
                return false;
            }

            object vehicleObj = ExecuteScalar(
                "SELECT TOP 1 VehicleId FROM Vehicles WHERE DriverId = @DriverId ORDER BY VehicleId DESC",
                new SqlParameter("@DriverId", driverId));

            int affected = ExecuteNonQuery(@"
                UPDATE Bookings
                SET DriverId = @DriverId,
                    VehicleId = COALESCE(@VehicleId, VehicleId),
                    BookingStatus = 'Confirmed'
                WHERE BookingId = @BookingId
                  AND DriverId IS NULL
                  AND BookingStatus = 'Pending'",
                new SqlParameter("@DriverId", driverId),
                new SqlParameter("@VehicleId", (vehicleObj != null && vehicleObj != DBNull.Value) ? vehicleObj : DBNull.Value),
                new SqlParameter("@BookingId", bookingId));

            if (affected <= 0)
            {
                message = "This trip has already been accepted by another driver or is no longer pending.";
                return false;
            }

            message = "Trip confirmed! Proceed to pickup location and mark arrival when you reach.";
            return true;
        }

        public static bool ConfirmDriverArrivedByCustomer(int bookingId, int customerId, out string message)
        {
            message = string.Empty;
            DataTable dt = ExecuteQuery(@"
                SELECT TOP 1 BookingId, BookingNumber, DriverId, BookingStatus, ISNULL(BaseFare, 8000) AS BaseFare
                FROM Bookings
                WHERE BookingId = @BookingId AND CustomerId = @CustomerId",
                new SqlParameter("@BookingId", bookingId),
                new SqlParameter("@CustomerId", customerId));

            if (dt.Rows.Count == 0)
            {
                message = "Booking not found.";
                return false;
            }

            var r = dt.Rows[0];
            string status = r["BookingStatus"].ToString();
            if (!status.Equals("Confirmed", StringComparison.OrdinalIgnoreCase) || r["DriverId"] == DBNull.Value)
            {
                message = "Driver arrival can only be confirmed after a driver has accepted the trip.";
                return false;
            }

            int driverId = Convert.ToInt32(r["DriverId"]);
            string bookingNumber = r["BookingNumber"].ToString();
            decimal totalShare = GetDriverTotalShare(Convert.ToDecimal(r["BaseFare"]));
            decimal firstHalf = Math.Round(totalShare / 2m, 2);

            ExecuteNonQuery(@"
                UPDATE Bookings SET BookingStatus = 'Ongoing' WHERE BookingId = @BookingId;
                UPDATE TripMilestones
                SET MilestoneStatus = 'Completed', ActualTime = ISNULL(ActualTime, SYSDATETIME())
                WHERE BookingId = @BookingId AND MilestoneType = 'Pickup';",
                new SqlParameter("@BookingId", bookingId));

            int exists = Convert.ToInt32(ExecuteScalar(
                "SELECT COUNT(1) FROM DriverEarnings WHERE BookingId = @BookingId AND EarningStage IN ('Half1', 'Full')",
                new SqlParameter("@BookingId", bookingId)) ?? 0);

            if (exists == 0)
            {
                ExecuteNonQuery(@"
                    INSERT INTO DriverEarnings (DriverId, BookingId, GrossAmount, Commission, PayoutStatus, EarningStage, TransactionRef, Description, PaidAt)
                    VALUES (@DriverId, @BookingId, @Amount, 0, 'Paid', 'Half1', @TxnRef, @Desc, SYSDATETIME())",
                    new SqlParameter("@DriverId", driverId),
                    new SqlParameter("@BookingId", bookingId),
                    new SqlParameter("@Amount", firstHalf),
                    new SqlParameter("@TxnRef", "TXN-H1-" + Guid.NewGuid().ToString().Substring(0, 6).ToUpper()),
                    new SqlParameter("@Desc", "First Half (50%) - Arrival Confirmed for " + bookingNumber));
            }

            message = "Driver arrival confirmed! First half (₹" + firstHalf.ToString("N0") + ") credited to driver's account.";
            return true;
        }

        public static bool ConfirmTripCompletedByCustomer(int bookingId, int customerId, out string message)
        {
            message = string.Empty;
            DataTable dt = ExecuteQuery(@"
                SELECT TOP 1 BookingId, BookingNumber, DriverId, BookingStatus, ISNULL(BaseFare, 8000) AS BaseFare
                FROM Bookings
                WHERE BookingId = @BookingId AND CustomerId = @CustomerId",
                new SqlParameter("@BookingId", bookingId),
                new SqlParameter("@CustomerId", customerId));

            if (dt.Rows.Count == 0)
            {
                message = "Booking not found.";
                return false;
            }

            var r = dt.Rows[0];
            string status = r["BookingStatus"].ToString();
            if (!status.Equals("Ongoing", StringComparison.OrdinalIgnoreCase) || r["DriverId"] == DBNull.Value)
            {
                message = "Trip completion can only be confirmed while the trip is Ongoing.";
                return false;
            }

            int driverId = Convert.ToInt32(r["DriverId"]);
            string bookingNumber = r["BookingNumber"].ToString();
            decimal totalShare = GetDriverTotalShare(Convert.ToDecimal(r["BaseFare"]));
            decimal firstHalf = Math.Round(totalShare / 2m, 2);
            decimal secondHalf = totalShare - firstHalf;

            ExecuteNonQuery(@"
                UPDATE Bookings SET BookingStatus = 'Completed' WHERE BookingId = @BookingId;
                UPDATE TripMilestones
                SET MilestoneStatus = 'Completed', ActualTime = ISNULL(ActualTime, SYSDATETIME())
                WHERE BookingId = @BookingId;",
                new SqlParameter("@BookingId", bookingId));

            int exists = Convert.ToInt32(ExecuteScalar(
                "SELECT COUNT(1) FROM DriverEarnings WHERE BookingId = @BookingId AND EarningStage IN ('Half2', 'Full')",
                new SqlParameter("@BookingId", bookingId)) ?? 0);

            if (exists == 0)
            {
                ExecuteNonQuery(@"
                    INSERT INTO DriverEarnings (DriverId, BookingId, GrossAmount, Commission, PayoutStatus, EarningStage, TransactionRef, Description, PaidAt)
                    VALUES (@DriverId, @BookingId, @Amount, 0, 'Paid', 'Half2', @TxnRef, @Desc, SYSDATETIME())",
                    new SqlParameter("@DriverId", driverId),
                    new SqlParameter("@BookingId", bookingId),
                    new SqlParameter("@Amount", secondHalf),
                    new SqlParameter("@TxnRef", "TXN-H2-" + Guid.NewGuid().ToString().Substring(0, 6).ToUpper()),
                    new SqlParameter("@Desc", "Second Half (50%) - Trip Completed for " + bookingNumber));
            }

            message = "Trip completion confirmed! Second half (₹" + secondHalf.ToString("N0") + ") credited to driver's account.";
            return true;
        }
    }
}
