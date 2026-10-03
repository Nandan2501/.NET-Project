using System;
using System.Data;
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
            DataTable dt = new DataTable();

            dt.Columns.Add("VehicleId");
            dt.Columns.Add("VehicleName");
            dt.Columns.Add("Type");
            dt.Columns.Add("LicensePlate");
            dt.Columns.Add("Status");
            dt.Columns.Add("Driver");


            dt.Rows.Add(
                "#VEH-2041",
                "Tata Ultra 1518",
                "Heavy Truck",
                "GJ-01-XX-1102",
                "Active",
                "abhay"
            );


            dt.Rows.Add(
                "#VEH-2042",
                "Mahindra Bolero Pickup",
                "Pickup Van",
                "GJ-01-YY-9081",
                "Active",
                "mevada divyesh"
            );


            dt.Rows.Add(
                "#VEH-2043",
                "Eicher Pro 2049",
                "Medium Truck",
                "GJ-01-ZZ-4310",
                "Maintenance",
                "brij"
            );


            dt.Rows.Add(
                "#VEH-2044",
                "Tata Ace Gold",
                "Mini Truck",
                "GJ-01-AA-5561",
                "Active",
                "manan sharam"
            );


            dt.Rows.Add(
                "#VEH-2045",
                "Ashok Leyland Dost",
                "Mini Truck",
                "GJ-01-BB-2244",
                "Inactive",
                "lila sharthak"
            );


            dt.Rows.Add(
                "#VEH-2046",
                "BharatBenz 1917R",
                "Heavy Truck",
                "GJ-01-CC-7788",
                "Active",
                "mayank"
            );


            gvVehicles.DataSource = dt;

            gvVehicles.DataBind();
        }


        public string GetVehicleStatusClass(string status)
        {
            switch (status.ToLower())
            {
                case "active":
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


        protected void gvVehicles_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "VehicleAction")
            {
                string vehicleId = e.CommandArgument.ToString();

                Session["SelectedVehicleId"] = vehicleId;

                lblMessage.Text =
                    "Vehicle " + vehicleId + " selected.";
            }
        }
    }
}