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
            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT 
                    '#PAY-' + CAST(p.PaymentId AS VARCHAR(10)) AS PaymentId,
                    ISNULL(u.FullName, 'Customer') AS Customer,
                    ISNULL(b.BookingNumber, '#TRP-' + CAST(p.BookingId AS VARCHAR(10))) AS BookingId,
                    FORMAT(ISNULL(p.PaidAt, p.CreatedAt), 'dd MMM yyyy') AS Date,
                    N'₹' + FORMAT(p.Amount, 'N0') AS Amount,
                    ISNULL(p.PaymentMethod, 'Cash') AS Method,
                    ISNULL(p.PaymentStatus, 'Pending') AS Status
                FROM Payments p
                LEFT JOIN Bookings b ON p.BookingId = b.BookingId
                LEFT JOIN Users u ON b.CustomerId = u.UserId
                ORDER BY p.PaymentId DESC");

            gvPayments.DataSource = dt;
            gvPayments.DataBind();
        }

        public string GetPaymentStatusClass(string status)
        {
            if (string.IsNullOrEmpty(status)) return "payment-status";
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

        protected void gvPayments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "PaymentAction")
            {
                string paymentId = e.CommandArgument.ToString();
                Session["SelectedPaymentId"] = paymentId;
                lblMessage.Text = "Payment " + paymentId + " selected.";
            }
        }
    }
}
