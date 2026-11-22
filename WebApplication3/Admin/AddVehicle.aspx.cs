using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class AddVehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDriversDropdown();
            }
        }

        private void LoadDriversDropdown()
        {
            try
            {
                DataTable dt = DbHelper.ExecuteQuery(@"
                    SELECT d.DriverId, u.FullName 
                    FROM Drivers d 
                    JOIN Users u ON d.UserId = u.UserId 
                    ORDER BY u.FullName");

                ddlDriver.Items.Clear();
                ddlDriver.Items.Add(new ListItem("Assign driver", ""));
                foreach (DataRow r in dt.Rows)
                {
                    ddlDriver.Items.Add(new ListItem(r["FullName"].ToString(), r["DriverId"].ToString()));
                }
            }
            catch
            {
                // Fallback to static items if DB error
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Vehicle.aspx");
        }

        protected void btnAddVehicle_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string vehicleName = ddlVehicleName.SelectedValue;
            string vehicleType = txtVehicleType.Text.Trim();
            string plate = txtLicensePlate.Text.Trim();
            string status = string.IsNullOrWhiteSpace(txtStatus.Text) ? "Active" : txtStatus.Text.Trim();

            if (string.IsNullOrWhiteSpace(vehicleName) || string.IsNullOrWhiteSpace(vehicleType) || string.IsNullOrWhiteSpace(plate))
            {
                return;
            }

            int driverId;
            object driverIdVal = DBNull.Value;
            if (int.TryParse(ddlDriver.SelectedValue, out driverId) && driverId > 0)
            {
                driverIdVal = driverId;
            }

            decimal capacity = 5000;
            decimal parsedCap;
            if (decimal.TryParse(txtAge.Text.Trim(), out parsedCap) && parsedCap > 0)
            {
                capacity = parsedCap;
            }

            DbHelper.ExecuteNonQuery(@"
                INSERT INTO Vehicles (VehicleName, VehicleType, RegistrationNumber, CapacityKg, DriverId, VehicleStatus)
                VALUES (@Name, @Type, @Plate, @Capacity, @DriverId, @Status)",
                new SqlParameter("@Name", vehicleName),
                new SqlParameter("@Type", vehicleType),
                new SqlParameter("@Plate", plate),
                new SqlParameter("@Capacity", capacity),
                new SqlParameter("@DriverId", driverIdVal),
                new SqlParameter("@Status", status));

            Response.Redirect("Vehicle.aspx");
        }
    }
}
