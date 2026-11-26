using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication3.Driver
{
    public partial class MyEarnings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEarnings();
            }
        }

        private void LoadEarnings()
        {
            int driverId = DbHelper.GetLoggedInDriverId(Session);

            decimal avail = Convert.ToDecimal(DbHelper.ExecuteScalar(@"
                SELECT ISNULL(SUM(NetAmount), 0)
                FROM DriverEarnings
                WHERE DriverId = @DriverId AND PayoutStatus = 'Pending'",
                new SqlParameter("@DriverId", driverId)) ?? 0);

            decimal thisMonth = Convert.ToDecimal(DbHelper.ExecuteScalar(@"
                SELECT ISNULL(SUM(NetAmount), 0)
                FROM DriverEarnings
                WHERE DriverId = @DriverId
                  AND MONTH(EarnedAt) = MONTH(GETDATE()) AND YEAR(EarnedAt) = YEAR(GETDATE())",
                new SqlParameter("@DriverId", driverId)) ?? 0);

            decimal paid = Convert.ToDecimal(DbHelper.ExecuteScalar(@"
                SELECT ISNULL(SUM(NetAmount), 0)
                FROM DriverEarnings
                WHERE DriverId = @DriverId AND PayoutStatus = 'Paid'",
                new SqlParameter("@DriverId", driverId)) ?? 0);

            litAvailableBalance.Text = "₹" + avail.ToString("N0");
            litThisMonth.Text = "₹" + thisMonth.ToString("N0");
            litTotalPayouts.Text = "₹" + paid.ToString("N0");
            btnRequestPayout.Enabled = avail > 0;

            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT 
                    ISNULL(de.TransactionRef, 'TXN-' + CAST(de.EarningId AS VARCHAR(10))) AS TransactionRef,
                    FORMAT(de.EarnedAt, 'dd MMM yyyy') AS EarnedDate,
                    ISNULL(de.Description, 'Earnings for ' + b.BookingNumber) AS Description,
                    de.GrossAmount,
                    de.NetAmount,
                    de.PayoutStatus
                FROM DriverEarnings de
                LEFT JOIN Bookings b ON de.BookingId = b.BookingId
                WHERE de.DriverId = @DriverId
                ORDER BY de.EarningId DESC",
                new SqlParameter("@DriverId", driverId));

            rptEarnings.DataSource = dt;
            rptEarnings.DataBind();
        }

        protected void btnRequestPayout_Click(object sender, EventArgs e)
        {
            int driverId = DbHelper.GetLoggedInDriverId(Session);
            int affected = DbHelper.ExecuteNonQuery(@"
                UPDATE DriverEarnings
                SET PayoutStatus = 'Paid', PaidAt = SYSDATETIME()
                WHERE DriverId = @DriverId AND PayoutStatus = 'Pending'",
                new SqlParameter("@DriverId", driverId));

            lblEarningsMsg.Text = affected > 0
                ? "Payout processed and transferred!"
                : "No pending balance available to withdraw.";

            LoadEarnings();
        }
    }
}
