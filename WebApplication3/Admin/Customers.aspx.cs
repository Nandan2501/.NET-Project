using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCustomers();
            }
        }

        private void LoadCustomers()
        {
            string search = txtSearch != null ? txtSearch.Text.Trim() : "";

            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT 
                    u.UserId,
                    u.FullName,
                    ISNULL(u.Phone, 'N/A') AS Phone,
                    ISNULL((SELECT TOP 1 a.City FROM Addresses a WHERE a.UserId = u.UserId ORDER BY a.IsDefault DESC, a.AddressId DESC), 'N/A') AS City,
                    ISNULL(u.AccountStatus, 'Active') AS AccountStatus,
                    u.Email
                FROM Users u
                WHERE u.Role = 'Customer'
                  AND (@Search = '' OR u.FullName LIKE '%' + @Search + '%' OR u.Email LIKE '%' + @Search + '%' OR u.Phone LIKE '%' + @Search + '%')
                ORDER BY u.UserId DESC",
                new SqlParameter("@Search", search));

            rptCustomers.DataSource = dt;
            rptCustomers.DataBind();
            litCustomerCount.Text = "All Registered Customers (" + dt.Rows.Count + ")";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadCustomers();
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadCustomers();
        }

        protected void btnToggleAddForm_Click(object sender, EventArgs e)
        {
            pnlAddCustomer.Visible = !pnlAddCustomer.Visible;
        }

        protected void btnCancelAdd_Click(object sender, EventArgs e)
        {
            pnlAddCustomer.Visible = false;
        }

        protected void btnSaveCustomer_Click(object sender, EventArgs e)
        {
            string name = txtNewName.Text.Trim();
            string email = txtNewEmail.Text.Trim();
            string phone = txtNewPhone.Text.Trim();
            string city = txtNewCity.Text.Trim();
            string address = txtNewAddress.Text.Trim();
            string password = string.IsNullOrWhiteSpace(txtNewPassword.Text) ? "123456" : txtNewPassword.Text.Trim();

            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(phone))
            {
                lblCustomerMessage.ForeColor = System.Drawing.Color.Red;
                lblCustomerMessage.Text = "Name, Email, and Phone are required.";
                return;
            }

            string err;
            if (!DbHelper.RegisterUser(name, email, phone, password, out err))
            {
                lblCustomerMessage.ForeColor = System.Drawing.Color.Red;
                lblCustomerMessage.Text = err;
                return;
            }

            object uidObj = DbHelper.ExecuteScalar("SELECT UserId FROM Users WHERE LOWER(Email) = LOWER(@Email)",
                new SqlParameter("@Email", email));

            if (uidObj != null && uidObj != DBNull.Value && (!string.IsNullOrWhiteSpace(city) || !string.IsNullOrWhiteSpace(address)))
            {
                DbHelper.ExecuteNonQuery(@"
                    INSERT INTO Addresses (UserId, AddressTitle, FullAddress, City, State, PostalCode, Country, ContactPhone, AddressType, IsDefault)
                    VALUES (@UserId, 'Primary', @FullAddress, @City, 'Gujarat', '360001', 'India', @Phone, 'Office', 1)",
                    new SqlParameter("@UserId", Convert.ToInt32(uidObj)),
                    new SqlParameter("@FullAddress", string.IsNullOrWhiteSpace(address) ? city : address),
                    new SqlParameter("@City", string.IsNullOrWhiteSpace(city) ? "Rajkot" : city),
                    new SqlParameter("@Phone", phone));
            }

            txtNewName.Text = "";
            txtNewEmail.Text = "";
            txtNewPhone.Text = "";
            txtNewCity.Text = "";
            txtNewAddress.Text = "";
            pnlAddCustomer.Visible = false;

            lblCustomerMessage.ForeColor = System.Drawing.Color.Green;
            lblCustomerMessage.Text = "Customer added and saved to database.";
            LoadCustomers();
        }

        protected void rptCustomers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ToggleStatus")
            {
                string[] parts = e.CommandArgument.ToString().Split('|');
                if (parts.Length == 2)
                {
                    int userId = Convert.ToInt32(parts[0]);
                    string current = parts[1];
                    string next = current.Equals("Active", StringComparison.OrdinalIgnoreCase) ? "Inactive" : "Active";

                    DbHelper.ExecuteNonQuery(
                        "UPDATE Users SET AccountStatus = @Status WHERE UserId = @UserId",
                        new SqlParameter("@Status", next),
                        new SqlParameter("@UserId", userId));

                    lblCustomerMessage.ForeColor = System.Drawing.Color.Green;
                    lblCustomerMessage.Text = "Customer status updated to " + next + ".";
                    LoadCustomers();
                }
            }
        }
    }
}
