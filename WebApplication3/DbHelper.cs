using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

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
            return dt;
        }

        public static int ExecuteNonQuery(string query, params SqlParameter[] parameters)
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

        public static object ExecuteScalar(string query, params SqlParameter[] parameters)
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
                    VALUES (@FullName, @Email, @Phone, @Password, 'Customer')";

                ExecuteNonQuery(insertQuery,
                    new SqlParameter("@FullName", fullName.Trim()),
                    new SqlParameter("@Email", email.Trim()),
                    new SqlParameter("@Phone", phone.Trim()),
                    new SqlParameter("@Password", password));

                return true;
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return false;
            }
        }
    }
}
