using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class AdminVehicles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadVehicles();
            }
        }

        private void LoadVehicles()
        {
            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT 
                    v.VehicleId AS RawVehicleId,
                    '#VEH-' + CAST(v.VehicleId AS VARCHAR(10)) AS VehicleId,
                    v.VehicleName,
                    v.VehicleType AS Type,
                    v.RegistrationNumber AS LicensePlate,
                    ISNULL(v.VehicleStatus, 'Active') AS Status,
                    ISNULL(u.FullName, 'Unassigned') AS Driver
                FROM Vehicles v
                LEFT JOIN Drivers d ON v.DriverId = d.DriverId
                LEFT JOIN Users u ON d.UserId = u.UserId
                ORDER BY v.VehicleId DESC");

            gvVehicles.DataSource = dt;
            gvVehicles.DataBind();

            if (lblVehicleTitle != null)
                lblVehicleTitle.Text = "All Vehicles (" + dt.Rows.Count + ")";
        }

        public string GetVehicleStatusClass(string status)
        {
            if (string.IsNullOrEmpty(status)) return "vehicle-status";
            switch (status.ToLower())
            {
                case "active":
                case "available":
                    return "vehicle-status active";
                case "maintenance":
                    return "vehicle-status maintenance";
                case "inactive":
                    return "vehicle-status inactive";
                default:
                    return "vehicle-status";
            }
        }

        protected void btnAddVehicle_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddVehicle.aspx");
        }

        protected void gvVehicles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteVehicle")
            {
                int vehicleId;
                if (int.TryParse(e.CommandArgument.ToString(), out vehicleId))
                {
                    int inBookings = Convert.ToInt32(DbHelper.ExecuteScalar(
                        "SELECT COUNT(1) FROM Bookings WHERE VehicleId = @VehicleId",
                        new SqlParameter("@VehicleId", vehicleId)) ?? 0);

                    if (inBookings > 0)
                    {
                        DbHelper.ExecuteNonQuery(
                            "UPDATE Vehicles SET VehicleStatus = 'Inactive', DriverId = NULL WHERE VehicleId = @VehicleId",
                            new SqlParameter("@VehicleId", vehicleId));
                        lblMessage.ForeColor = System.Drawing.Color.DarkOrange;
                        lblMessage.Text = "Vehicle is linked to existing bookings, so it was marked Inactive.";
                    }
                    else
                    {
                        DbHelper.ExecuteNonQuery("DELETE FROM VehicleDocuments WHERE VehicleId = @VehicleId",
                            new SqlParameter("@VehicleId", vehicleId));
                        DbHelper.ExecuteNonQuery("DELETE FROM Vehicles WHERE VehicleId = @VehicleId",
                            new SqlParameter("@VehicleId", vehicleId));
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Vehicle deleted successfully.";
                    }
                    LoadVehicles();
                }
            }
        }
    }
}
