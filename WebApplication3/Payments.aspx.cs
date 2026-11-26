using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Payments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPaymentsData();
            }
        }

        private void LoadPaymentsData()
        {
            int userId = DbHelper.GetLoggedInUserId(Session);

            var spentObj = DbHelper.ExecuteScalar(@"
                SELECT ISNULL(SUM(p.Amount), 0)
                FROM Payments p
                INNER JOIN Bookings b ON p.BookingId = b.BookingId
                WHERE b.CustomerId = @UserId AND p.PaymentStatus = 'Paid'",
                new SqlParameter("@UserId", userId));
            litTotalSpent.Text = "₹" + Convert.ToDecimal(spentObj ?? 0).ToString("N2");

            var pendingObj = DbHelper.ExecuteScalar(@"
                SELECT ISNULL(SUM(p.Amount), 0)
                FROM Payments p
                INNER JOIN Bookings b ON p.BookingId = b.BookingId
                WHERE b.CustomerId = @UserId AND p.PaymentStatus = 'Pending'",
                new SqlParameter("@UserId", userId));
            litPendingPayments.Text = "₹" + Convert.ToDecimal(pendingObj ?? 0).ToString("N2");

            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT 
                    p.PaymentId,
                    b.BookingNumber,
                    FORMAT(ISNULL(p.PaidAt, p.CreatedAt), 'dd MMM yyyy') AS PaymentDate,
                    ISNULL(p.PaymentMethod, 'Online') AS PaymentMethod,
                    N'₹' + FORMAT(p.Amount, 'N0') AS FormattedAmount,
                    p.PaymentStatus
                FROM Payments p
                INNER JOIN Bookings b ON p.BookingId = b.BookingId
                WHERE b.CustomerId = @UserId
                ORDER BY p.PaymentId DESC",
                new SqlParameter("@UserId", userId));

            rptPayments.DataSource = dt;
            rptPayments.DataBind();
        }

        protected void rptPayments_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "PayNow")
            {
                int paymentId;
                if (int.TryParse(e.CommandArgument.ToString(), out paymentId))
                {
                    int userId = DbHelper.GetLoggedInUserId(Session);
                    DbHelper.ExecuteNonQuery(@"
                        UPDATE p
                        SET p.PaymentStatus = 'Paid',
                            p.PaymentMethod = 'Online',
                            p.TransactionReference = ISNULL(p.TransactionReference, @TxnRef),
                            p.PaidAt = SYSDATETIME()
                        FROM Payments p
                        INNER JOIN Bookings b ON p.BookingId = b.BookingId
                        WHERE p.PaymentId = @PaymentId AND b.CustomerId = @UserId AND p.PaymentStatus = 'Pending'",
                        new SqlParameter("@PaymentId", paymentId),
                        new SqlParameter("@UserId", userId),
                        new SqlParameter("@TxnRef", "TXN-" + Guid.NewGuid().ToString().Substring(0, 8).ToUpper()));

                    lblPayMessage.Text = "Payment marked as Paid!";
                    LoadPaymentsData();
                }
            }
        }
    }
}
