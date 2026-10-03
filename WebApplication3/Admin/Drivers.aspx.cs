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
            DataTable dt = new DataTable();

            dt.Columns.Add("DriverId");
            dt.Columns.Add("DriverName");
            dt.Columns.Add("Phone");
            dt.Columns.Add("LicenseNo");
            dt.Columns.Add("Status");
            dt.Columns.Add("Vehicle");


            dt.Rows.Add(
                "#DRI-5501",
                "abhay",
                "+91 93274 68707",
                "DL-GJ01202011",
                "Active",
                "Tata Ultra 1518"
            );


            dt.Rows.Add(
                "#DRI-5502",
                "mevada divyesh",
                "+91 83202 46902",
                "DL-GJ01202012",
                "Active",
                "Mahindra Bolero"
            );


            dt.Rows.Add(
                "#DRI-5503",
                "brij",
                "+91 85964 54698",
                "DL-GJ01202013",
                "On Leave",
                "Eicher Pro 2049"
            );


            dt.Rows.Add(
                "#DRI-5504",
                "manan sharama",
                "+91 78455 36589",
                "DL-GJ01202014",
                "Active",
                "Tata Ace Gold"
            );


            dt.Rows.Add(
                "#DRI-5505",
                "lila sharthk",
                "+91 96589 65896",
                "DL-GJ01202015",
                "Inactive",
                "Unassigned"
            );


            dt.Rows.Add(
                "#DRI-5506",
                "mayank",
                "+91 96587 25698",
                "DL-GJ01202016",
                "Active",
                "BharatBenz 1917R"
            );


            gvDrivers.DataSource = dt;

            gvDrivers.DataBind();
        }


        public string GetDriverStatusClass(string status)
        {
            switch (status.ToLower())
            {
                case "active":
                    return "driver-status active";

                case "on leave":
                    return "driver-status onleave";

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


        protected void gvDrivers_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DriverAction")
            {
                string driverId = e.CommandArgument.ToString();

                Session["SelectedDriverId"] = driverId;

                lblMessage.Text =
                    "Driver " + driverId + " selected.";
            }
        }
    }
}