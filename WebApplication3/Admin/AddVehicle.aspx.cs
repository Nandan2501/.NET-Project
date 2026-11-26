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
                LoadVehicleForEdit();
            }
        }

        private void LoadDriversDropdown()
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

        private void LoadVehicleForEdit()
        {
            int vehicleId;
            if (int.TryParse(Request.QueryString["id"], out vehicleId) && vehicleId > 0)
            {
                ViewState["EditVehicleId"] = vehicleId;
                DataTable dt = DbHelper.ExecuteQuery("SELECT TOP 1 * FROM Vehicles WHERE VehicleId = @Id",
                    new SqlParameter("@Id", vehicleId));
                if (dt.Rows.Count > 0)
                {
                    var r = dt.Rows[0];
                    string name = r["VehicleName"]?.ToString() ?? "";
                    if (ddlVehicleName.Items.FindByValue(name) == null && !string.IsNullOrEmpty(name))
                        ddlVehicleName.Items.Add(new ListItem(name, name));
                    ddlVehicleName.SelectedValue = name;

                    txtVehicleType.Text = r["VehicleType"]?.ToString() ?? "";
                    txtLicensePlate.Text = r["RegistrationNumber"]?.ToString() ?? "";
                    txtStatus.Text = r["VehicleStatus"]?.ToString() ?? "Active";
                    txtCapacity.Text = r["CapacityKg"] != DBNull.Value ? Convert.ToInt32(r["CapacityKg"]).ToString() : "5000";
                    txtAge.Text = r["VehicleAge"] != DBNull.Value ? r["VehicleAge"].ToString() : "3";

                    string dId = r["DriverId"] != DBNull.Value ? r["DriverId"].ToString() : "";
                    if (ddlDriver.Items.FindByValue(dId) != null) ddlDriver.SelectedValue = dId;

                    string aadhar = r["AadharStatus"]?.ToString() ?? "";
                    if (txtAadhar.Items.FindByValue(aadhar) != null) txtAadhar.SelectedValue = aadhar;

                    txtNotes.Text = r["Notes"]?.ToString() ?? "";
                    btnAddVehicle.Text = "Update Vehicle";
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Vehicle.aspx");
        }

        protected void btnAddVehicle_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string vehicleName = ddlVehicleName.SelectedValue;
            string vehicleType = txtVehicleType.Text.Trim();
            string plate = txtLicensePlate.Text.Trim();
            string status = string.IsNullOrWhiteSpace(txtStatus.Text) ? "Active" : txtStatus.Text.Trim();
            string aadhar = txtAadhar.SelectedValue;
            string notes = txtNotes.Text.Trim();

            if (string.IsNullOrWhiteSpace(vehicleName) || string.IsNullOrWhiteSpace(vehicleType) || string.IsNullOrWhiteSpace(plate))
            {
                lblVehicleMsg.Text = "Vehicle Name, Type, and License Plate are required.";
                return;
            }

            int driverId;
            object driverIdVal = (int.TryParse(ddlDriver.SelectedValue, out driverId) && driverId > 0)
                ? (object)driverId
                : DBNull.Value;

            decimal capacity = 5000m;
            decimal parsedCap;
            if (decimal.TryParse(txtCapacity.Text.Trim(), out parsedCap) && parsedCap > 0)
                capacity = parsedCap;

            int age = 1;
            int parsedAge;
            if (int.TryParse(txtAge.Text.Trim(), out parsedAge) && parsedAge >= 0)
                age = parsedAge;

            string err;
            if (ViewState["EditVehicleId"] != null)
            {
                int editId = Convert.ToInt32(ViewState["EditVehicleId"]);
                DbHelper.ExecuteNonQueryWithError(@"
                    UPDATE Vehicles
                    SET VehicleName = @Name,
                        VehicleType = @Type,
                        RegistrationNumber = @Plate,
                        CapacityKg = @Capacity,
                        DriverId = @DriverId,
                        VehicleStatus = @Status,
                        VehicleAge = @Age,
                        AadharStatus = @Aadhar,
                        Notes = @Notes
                    WHERE VehicleId = @VehicleId", out err,
                    new SqlParameter("@Name", vehicleName),
                    new SqlParameter("@Type", vehicleType),
                    new SqlParameter("@Plate", plate),
                    new SqlParameter("@Capacity", capacity),
                    new SqlParameter("@DriverId", driverIdVal),
                    new SqlParameter("@Status", status),
                    new SqlParameter("@Age", age),
                    new SqlParameter("@Aadhar", string.IsNullOrEmpty(aadhar) ? (object)DBNull.Value : aadhar),
                    new SqlParameter("@Notes", notes),
                    new SqlParameter("@VehicleId", editId));
            }
            else
            {
                DbHelper.ExecuteNonQueryWithError(@"
                    INSERT INTO Vehicles (VehicleName, VehicleType, RegistrationNumber, CapacityKg, DriverId, VehicleStatus, VehicleAge, AadharStatus, Notes, InsuranceExpiry, PucExpiry)
                    VALUES (@Name, @Type, @Plate, @Capacity, @DriverId, @Status, @Age, @Aadhar, @Notes, DATEADD(year, 1, GETDATE()), DATEADD(year, 1, GETDATE()))", out err,
                    new SqlParameter("@Name", vehicleName),
                    new SqlParameter("@Type", vehicleType),
                    new SqlParameter("@Plate", plate),
                    new SqlParameter("@Capacity", capacity),
                    new SqlParameter("@DriverId", driverIdVal),
                    new SqlParameter("@Status", status),
                    new SqlParameter("@Age", age),
                    new SqlParameter("@Aadhar", string.IsNullOrEmpty(aadhar) ? (object)DBNull.Value : aadhar),
                    new SqlParameter("@Notes", notes));
            }

            if (!string.IsNullOrEmpty(err))
            {
                lblVehicleMsg.Text = "Could not save vehicle: " + err;
                return;
            }

            Response.Redirect("Vehicle.aspx");
        }
    }
}
