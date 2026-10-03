using System;
using System.Data;

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

            dt.Columns.Add("BookingID");
            dt.Columns.Add("Route");
            dt.Columns.Add("Date");
            dt.Columns.Add("Status");
            dt.Columns.Add("Amount");

            dt.Rows.Add(
                "TRP-1004",
                "Rajkot → Surat",
                "17 Aug 2026, 10:00 AM",
                "Ongoing",
                "₹9,800"
            );

            dt.Rows.Add(
                "TRP-1003",
                "Rajkot → baroda",
                "17 Aug 2026, 02:30 PM",
                "Completed",
                "₹12000"
            );

            dt.Rows.Add(
                "TRP-1002",
                "Rajkot → junagadh",
                "17 Aug 2026, 09:15 AM",
                "Completed",
                "₹8000"
            );

            dt.Rows.Add(
                "TRP-1001",
                "Rajkot → bhuj",
                "17 Aug 2026, 11:00 AM",
                "Cancelled",
                "₹25,000"
            );

            gvBookings.DataSource = dt;
            gvBookings.DataBind();
        }

        protected string GetStatusClass(string status)
        {
            switch (status.ToLower())
            {
                case "ongoing":
                    return "mb-status ongoing";

                case "completed":
                    return "mb-status completed";

                case "cancelled":
                    return "mb-status cancelled";

                default:
                    return "mb-status";
            }
        }

        protected void gvBookings_RowCommand(
            object sender,
            System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewBooking")
            {
                string bookingId = e.CommandArgument.ToString();

                Session["SelectedBookingId"] = bookingId;

                Response.Redirect("BookDetails.aspx");
            }
        }
    }
}