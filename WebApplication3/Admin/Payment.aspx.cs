using System;
using System.Data;
using System.Data.SqlClient;
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
            string statusFilter = ddlPayStatus != null ? ddlPayStatus.SelectedValue : "ALL";

            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT 
                    p.PaymentId AS RawPaymentId,
                    '#PAY-' + CAST(p.PaymentId AS VARCHAR(10)) AS PaymentId,
                    ISNULL(u.FullName, 'Customer') AS Customer,
                    ISNULL(b.BookingNumber, 'TRP-' + CAST(p.BookingId AS VARCHAR(10))) AS BookingId,
                    FORMAT(ISNULL(p.PaidAt, p.CreatedAt), 'dd MMM yyyy') AS Date,
                    N'₹' + FORMAT(p.Amount, 'N0') AS Amount,
                    ISNULL(p.PaymentMethod, 'Cash') AS Method,
                    ISNULL(p.PaymentStatus, 'Pending') AS Status
                FROM Payments p
                LEFT JOIN Bookings b ON p.BookingId = b.BookingId
                LEFT JOIN Users u ON b.CustomerId = u.UserId
                WHERE (@Status = 'ALL' OR p.PaymentStatus = @Status)
                ORDER BY p.PaymentId DESC",
                new SqlParameter("@Status", statusFilter));

            gvPayments.DataSource = dt;
            gvPayments.DataBind();
        }

        protected void ddlPayStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadPayments();
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
                case "refunded":
                    return "payment-status failed";
                default:
                    return "payment-status";
            }
        }

        protected void gvPayments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int paymentId;
            if (!int.TryParse(e.CommandArgument.ToString(), out paymentId))
                return;

            if (e.CommandName == "MarkPaid")
            {
                DbHelper.ExecuteNonQuery(@"
                    UPDATE Payments
                    SET PaymentStatus = 'Paid',
                        PaidAt = ISNULL(PaidAt, SYSDATETIME()),
                        TransactionReference = ISNULL(TransactionReference, @TxnRef)
                    WHERE PaymentId = @PaymentId",
                    new SqlParameter("@PaymentId", paymentId),
                    new SqlParameter("@TxnRef", "TXN-" + Guid.NewGuid().ToString().Substring(0, 8).ToUpper()));
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Payment #PAY-" + paymentId + " marked as Paid.";
                LoadPayments();
            }
            else if (e.CommandName == "MarkRefunded")
            {
                DbHelper.ExecuteNonQuery(
                    "UPDATE Payments SET PaymentStatus = 'Refunded' WHERE PaymentId = @PaymentId",
                    new SqlParameter("@PaymentId", paymentId));
                lblMessage.ForeColor = System.Drawing.Color.DarkOrange;
                lblMessage.Text = "Payment #PAY-" + paymentId + " marked as Refunded.";
                LoadPayments();
            }
        }
    }
}
