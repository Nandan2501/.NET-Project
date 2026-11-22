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
                {
                    using (var cmd = new SqlCommand(query, conn))
                    {
                        if (parameters != null && parameters.Length > 0)
                        {
                            cmd.Parameters.AddRange(parameters);
                        }
                        using (var da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }
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
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand(query, conn))
                    {
                        if (parameters != null && parameters.Length > 0)
                        {
                            cmd.Parameters.AddRange(parameters);
                        }
                        conn.Open();
                        return cmd.ExecuteNonQuery();
                    }
                }
            }
            catch
            {
                return 0;
            }
        }

        public static object ExecuteScalar(string query, params SqlParameter[] parameters)
        {
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand(query, conn))
                    {
                        if (parameters != null && parameters.Length > 0)
                        {
                            cmd.Parameters.AddRange(parameters);
                        }
                        conn.Open();
                        return cmd.ExecuteScalar();
                    }
                }
            }
            catch
            {
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
                int existing = Convert.ToInt32(ExecuteScalar(checkQuery, new SqlParameter("@Email", email.Trim())));
                if (existing > 0)
                {
                    errorMessage = "An account with this email already exists.";
                    return false;
                }

                const string insertQuery = @"
                    INSERT INTO Users (FullName, Email, Phone, PasswordHash, Role)
                    VALUES (@FullName, @Email, @Phone, @Password, 'Customer');
                    SELECT SCOPE_IDENTITY();";

                var newId = ExecuteScalar(insertQuery,
                    new SqlParameter("@FullName", fullName.Trim()),
                    new SqlParameter("@Email", email.Trim()),
                    new SqlParameter("@Phone", phone.Trim()),
                    new SqlParameter("@Password", password));

                return newId != null;
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
                if (int.TryParse(session["UserId"].ToString(), out id))
                    return id;
            }

            if (session != null && session["UserEmail"] != null)
            {
                var obj = ExecuteScalar("SELECT UserId FROM Users WHERE LOWER(Email) = LOWER(@Email)",
                    new SqlParameter("@Email", session["UserEmail"].ToString()));
                if (obj != null && obj != DBNull.Value)
                    return Convert.ToInt32(obj);
            }

            // Default fallback to first active customer
            var fallback = ExecuteScalar("SELECT TOP 1 UserId FROM Users WHERE Role = 'Customer' ORDER BY UserId ASC");
            if (fallback != null && fallback != DBNull.Value)
                return Convert.ToInt32(fallback);

            return 1;
        }

        public static int GetLoggedInDriverId(HttpSessionState session)
        {
            if (session != null && session["DriverId"] != null)
            {
                int dId;
                if (int.TryParse(session["DriverId"].ToString(), out dId))
                    return dId;
            }

            int userId = 0;
            if (session != null && session["UserId"] != null)
            {
                int.TryParse(session["UserId"].ToString(), out userId);
            }

            if (userId > 0)
            {
                var obj = ExecuteScalar("SELECT DriverId FROM Drivers WHERE UserId = @UserId",
                    new SqlParameter("@UserId", userId));
                if (obj != null && obj != DBNull.Value)
                    return Convert.ToInt32(obj);
            }

            var fallback = ExecuteScalar("SELECT TOP 1 DriverId FROM Drivers ORDER BY DriverId ASC");
            if (fallback != null && fallback != DBNull.Value)
                return Convert.ToInt32(fallback);

            return 1;
        }
    }
}
