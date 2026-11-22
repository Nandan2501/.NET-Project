using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            int userId = DbHelper.GetLoggedInUserId(Session);
            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT TOP 1 u.FullName, u.Email, u.Phone, 
                       FORMAT(u.DateOfBirth, 'dd MMM yyyy') AS DOB,
                       ISNULL(a.FullAddress, '') AS FullAddress
                FROM Users u
                LEFT JOIN Addresses a ON u.UserId = a.UserId AND a.IsDefault = 1
                WHERE u.UserId = @UserId",
                new SqlParameter("@UserId", userId));

            if (dt.Rows.Count > 0)
            {
                var row = dt.Rows[0];
                txtFullName.Text = row["FullName"]?.ToString() ?? "";
                txtEmail.Text = row["Email"]?.ToString() ?? "";
                txtPhone.Text = row["Phone"]?.ToString() ?? "";
                txtDOB.Text = row["DOB"]?.ToString() ?? "";
                txtAddress.Text = row["FullAddress"]?.ToString() ?? "";
            }
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }
    }
}
