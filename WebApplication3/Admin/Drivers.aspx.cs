using System;
using System.Data;
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
                    '#DRI-' + CAST(d.DriverId AS VARCHAR(10)) AS DriverId,
                    u.FullName AS DriverName,
                    ISNULL(u.Phone, 'N/A') AS Phone,
                    ISNULL(d.LicenseNumber, 'N/A') AS LicenseNo,
                    ISNULL(d.VerificationStatus, 'Active') AS Status,
                    ISNULL(v.VehicleName, 'Unassigned') AS Vehicle
                FROM Drivers d
                JOIN Users u ON d.UserId = u.UserId
                LEFT JOIN Vehicles v ON v.DriverId = d.DriverId
                ORDER BY d.DriverId");

            gvDrivers.DataSource = dt;
            gvDrivers.DataBind();

            if (lblDriverTitle != null)
            {
                lblDriverTitle.Text = "All Registered Drivers (" + dt.Rows.Count + ")";
            }
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
            if (e.CommandName == "DriverAction")
            {
                string driverId = e.CommandArgument.ToString();
                Session["SelectedDriverId"] = driverId;
                lblMessage.Text = "Driver " + driverId + " selected.";
            }
        }
    }
}
