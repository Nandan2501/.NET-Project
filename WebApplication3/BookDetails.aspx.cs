using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class BookingDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookingDetails();
            }
        }

        private void LoadBookingDetails()
        {
            string bookingId = Request.QueryString["id"];
            if (string.IsNullOrEmpty(bookingId))
            {
                bookingId = Session["SelectedBookingId"]?.ToString();
            }

            SqlParameter param = string.IsNullOrEmpty(bookingId)
                ? new SqlParameter("@BookingNo", DBNull.Value)
                : new SqlParameter("@BookingNo", bookingId.Trim('#', ' '));

            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT TOP 1
                    b.BookingNumber,
                    b.BookingStatus,
                    FORMAT(b.PreferredDate, 'dd MMM yyyy, hh:mm tt') AS BookingDate,
                    ISNULL(p.PaymentStatus, 'Pending') AS PaymentStatus,
                    ISNULL(p.PaymentMethod, 'Online') AS PaymentMethod,
                    '₹' + CAST(CAST(ISNULL(p.Amount, 12000.00) AS INT) AS VARCHAR) AS TotalAmount,
                    ISNULL(b.VehicleType, 'Medium Truck (6-Wheeler)') AS VehicleType,
                    ISNULL(ld.LoadType, 'Industrial Raw Material') AS LoadType,
                    CAST(CAST(ISNULL(ld.WeightKg, 1000) AS INT) AS VARCHAR) + ' kg' AS Weight,
                    ISNULL(u.FullName, 'Nandan Nasit') AS CustomerName,
                    ISNULL(u.Email, 'customer@transpo.com') AS CustomerEmail,
                    ISNULL(u.Phone, '+91 98765 43210') AS CustomerPhone
                FROM Bookings b
                LEFT JOIN Payments p ON b.BookingId = p.BookingId
                LEFT JOIN BookingLoadDetails ld ON b.BookingId = ld.BookingId
                LEFT JOIN Users u ON b.CustomerId = u.UserId
                WHERE (@BookingNo IS NULL OR b.BookingNumber = @BookingNo)
                ORDER BY b.BookingId DESC",
                param);

            if (dt.Rows.Count > 0)
            {
                var r = dt.Rows[0];
                lblBookingTitle.InnerText = "#" + r["BookingNumber"];
                lblStatus.InnerText = r["BookingStatus"].ToString();
                lblBookingDate.InnerText = r["BookingDate"].ToString();
                lblPaymentStatus.InnerText = r["PaymentStatus"].ToString();
                lblPaymentMethod.InnerText = r["PaymentMethod"].ToString();
                lblTotalAmount.InnerText = r["TotalAmount"].ToString();
                lblVehicle.InnerText = r["VehicleType"].ToString();
                lblLoadType.InnerText = r["LoadType"].ToString();
                lblWeight.InnerText = r["Weight"].ToString();
                lblCompany.InnerText = "Transpo Logistics";
                lblContactPerson.InnerText = r["CustomerName"].ToString();
                lblEmail.InnerText = r["CustomerEmail"].ToString();
                lblPhone.InnerText = r["CustomerPhone"].ToString();
            }
        }
    }
}
