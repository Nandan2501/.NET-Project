using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class AdminDrivers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDrivers();
            }
        }

        private void LoadDrivers()
        {
            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT 
                    d.DriverId AS RawDriverId,
                    '#DRI-' + CAST(d.DriverId AS VARCHAR(10)) AS DriverId,
                    u.FullName AS DriverName,
                    ISNULL(u.Phone, 'N/A') AS Phone,
                    ISNULL(d.LicenseNumber, 'N/A') AS LicenseNo,
                    ISNULL(d.VerificationStatus, 'Active') AS Status,
                    ISNULL((SELECT TOP 1 v.VehicleName FROM Vehicles v WHERE v.DriverId = d.DriverId ORDER BY v.VehicleId DESC), 'Unassigned') AS Vehicle
                FROM Drivers d
                JOIN Users u ON d.UserId = u.UserId
                ORDER BY d.DriverId DESC");

            gvDrivers.DataSource = dt;
            gvDrivers.DataBind();

            if (lblDriverTitle != null)
                lblDriverTitle.Text = "All Registered Drivers (" + dt.Rows.Count + ")";
        }

        public string GetDriverStatusClass(string status)
        {
            if (string.IsNullOrEmpty(status)) return "driver-status";
            switch (status.ToLower())
            {
                case "active":
                    return "driver-status active";
                case "on leave":
                    return "driver-status leave";
                case "inactive":
                    return "driver-status inactive";
                default:
                    return "driver-status";
            }
        }

        protected void btnAddDriver_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddDriver.aspx");
        }

        protected void gvDrivers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CycleStatus")
            {
                string[] parts = e.CommandArgument.ToString().Split('|');
                if (parts.Length == 2)
                {
                    int driverId = Convert.ToInt32(parts[0]);
                    string current = parts[1];
                    string next = current.Equals("Active", StringComparison.OrdinalIgnoreCase) ? "On Leave" : "Active";

                    DbHelper.ExecuteNonQuery(
                        "UPDATE Drivers SET VerificationStatus = @Status WHERE DriverId = @DriverId",
                        new SqlParameter("@Status", next),
                        new SqlParameter("@DriverId", driverId));

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Driver status updated to " + next + ".";
                    LoadDrivers();
                }
            }
        }
    }
}
