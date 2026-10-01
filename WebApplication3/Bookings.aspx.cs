using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class MyBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings();
            }
        }


        private void LoadBookings()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("BookingId");
            dt.Columns.Add("Route");
            dt.Columns.Add("Date");
            dt.Columns.Add("Status");
            dt.Columns.Add("Amount");


            // Sample Booking 1

            dt.Rows.Add(
                "TRP-1004",
                "Rajkot → Surat",
                "17 Aug 2026, 10:00 AM",
                "Ongoing",
                "₹9,800"
            );


            // Sample Booking 2

            dt.Rows.Add(
                "TRP-1003",
                "Rajkot → Baroda",
                "17 Aug 2026, 02:30 PM",
                "Completed",
                "₹12,000"
            );


            // Sample Booking 3

            dt.Rows.Add(
                "TRP-1002",
                "Rajkot → Junagadh",
                "17 Aug 2026, 09:15 AM",
                "Completed",
                "₹8,000"
            );


            // Sample Booking 4

            dt.Rows.Add(
                "TRP-1001",
                "Rajkot → Bhuj",
                "17 Aug 2026, 11:00 AM",
                "Cancelled",
                "₹25,000"
            );


            gvBookings.DataSource = dt;

            gvBookings.DataBind();
        }


        // =========================
        // STATUS CSS
        // =========================

        public string GetStatusClass(string status)
        {
            switch (status.ToLower())
            {
                case "ongoing":
                    return "status ongoing";

                case "completed":
                    return "status completed";

                case "cancelled":
                    return "status cancelled";

                default:
                    return "status";
            }
        }


        // =========================
        // VIEW DETAILS
        // =========================

        protected void gvBookings_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                string bookingId =
                    e.CommandArgument.ToString();

                Session["SelectedBookingId"] =
                    bookingId;

                Response.Redirect(
                    "BookingDetails.aspx"
                );
            }
        }
    }
}