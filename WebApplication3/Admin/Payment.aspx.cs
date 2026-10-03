using System;
using System.Data;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class AdminPayments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPayments();
            }
        }


        private void LoadPayments()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("PaymentId");
            dt.Columns.Add("Customer");
            dt.Columns.Add("BookingId");
            dt.Columns.Add("Date");
            dt.Columns.Add("Amount");
            dt.Columns.Add("Method");
            dt.Columns.Add("Status");


            dt.Rows.Add(
                "#PAY-9041",
                "abhay",
                "#TRP-1049",
                "24 Oct 2026",
                "₹25,000",
                "by cash",
                "Paid"
            );


            dt.Rows.Add(
                "#PAY-9042",
                "mevada divyesh",
                "#TRP-1048",
                "24 Oct 2026",
                "₹60,000",
                "by cash",
                "Paid"
            );


            dt.Rows.Add(
                "#PAY-9043",
                "brij",
                "#TRP-1047",
                "23 Oct 2026",
                "₹20,000",
                "by cash",
                "Pending"
            );


            dt.Rows.Add(
                "#PAY-9044",
                "manan sharma",
                "#TRP-1046",
                "22 Oct 2026",
                "₹12,000",
                "by cash",
                "Failed"
            );


            dt.Rows.Add(
                "#PAY-9045",
                "lila sharthk",
                "#TRP-1045",
                "21 Oct 2026",
                "₹6,000",
                "by cash",
                "Paid"
            );


            dt.Rows.Add(
                "#PAY-9046",
                "mayank",
                "#TRP-1044",
                "20 Oct 2026",
                "₹45,000",
                "by cash",
                "Paid"
            );


            gvPayments.DataSource = dt;

            gvPayments.DataBind();
        }


        public string GetPaymentStatusClass(string status)
        {
            switch (status.ToLower())
            {
                case "paid":
                    return "payment-status paid";

                case "pending":
                    return "payment-status pending";

                case "failed":
                    return "payment-status failed";

                default:
                    return "payment-status";
            }
        }


        protected void gvPayments_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "PaymentAction")
            {
                string paymentId = e.CommandArgument.ToString();

                Session["SelectedPaymentId"] = paymentId;

                lblMessage.Text =
                    "Payment " + paymentId + " selected.";
            }
        }
    }
}