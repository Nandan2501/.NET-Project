using System;
using System.Data;

namespace WebApplication3
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecentBookings();
            }
        }


        private void LoadRecentBookings()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("BookingId");
            dt.Columns.Add("Customer");
            dt.Columns.Add("Vehicle");
            dt.Columns.Add("Date");
            dt.Columns.Add("Status");
            dt.Columns.Add("Amount");


            dt.Rows.Add(
                "#TRP-1049",
                "Abhay",
                "Tata Ultra 1518 (15T)",
                "24 Oct 2026",
                "Delivered",
                "₹3340.00"
            );


            dt.Rows.Add(
                "#TRP-1048",
                "Vraj Akbari",
                "Mahindra Bolero Pickup",
                "24 Oct 2026",
                "In Transit",
                "₹2120.00"
            );


            dt.Rows.Add(
                "#TRP-1047",
                "Nandan Nasit",
                "Eicher Pro 2049 (3.5T)",
                "23 Oct 2026",
                "Pending",
                "₹3215.00"
            );


            dt.Rows.Add(
                "#TRP-1046",
                "Raj Patel",
                "mahindra pickup bolero",
                "24 Oct 2026",
                "Cancelled",
                "₹8500.00"
            );


            gvRecentBookings.DataSource = dt;

            gvRecentBookings.DataBind();
        }


        public string GetStatusClass(string status)
        {
            switch (status.ToLower())
            {
                case "delivered":
                    return "admin-status delivered";

                case "in transit":
                    return "admin-status transit";

                case "pending":
                    return "admin-status pending";

                case "cancelled":
                    return "admin-status cancelled";

                default:
                    return "admin-status";
            }
        }
    }
}