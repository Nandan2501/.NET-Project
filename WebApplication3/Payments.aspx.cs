using System;
using System.Data;
using System.Data.SqlClient;

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
                    b.BookingNumber,
                    FORMAT(ISNULL(p.PaidAt, p.CreatedAt), 'dd MMM yyyy') AS PaymentDate,
                    ISNULL(p.PaymentMethod, 'Online') AS PaymentMethod,
                    '₹' + CAST(CAST(p.Amount AS INT) AS VARCHAR) AS FormattedAmount,
                    p.PaymentStatus
                FROM Payments p
                INNER JOIN Bookings b ON p.BookingId = b.BookingId
                WHERE b.CustomerId = @UserId
                ORDER BY p.PaymentId DESC",
                new SqlParameter("@UserId", userId));

            rptPayments.DataSource = dt;
            rptPayments.DataBind();
        }
    }
}
