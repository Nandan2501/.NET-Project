using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class AddressBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAddresses();
            }
        }

        private void LoadAddresses()
        {
            int userId = DbHelper.GetLoggedInUserId(Session);
            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT a.AddressId, a.AddressTitle, a.FullAddress, a.City, a.State, a.PostalCode, a.IsDefault,
                       ISNULL(u.Phone, '+91 98765 43210') AS Phone
                FROM Addresses a
                INNER JOIN Users u ON a.UserId = u.UserId
                WHERE a.UserId = @UserId
                ORDER BY a.IsDefault DESC, a.AddressId DESC",
                new SqlParameter("@UserId", userId));

            rptAddresses.DataSource = dt;
            rptAddresses.DataBind();
        }

        protected void btnAddAddress_Click(object sender, EventArgs e)
        {
            Session.Remove("EditAddressId");
            Response.Redirect("AddAddress.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (btn != null)
            {
                Session["EditAddressId"] = btn.CommandArgument;
                Response.Redirect("AddAddress.aspx");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (btn != null)
            {
                string addressId = btn.CommandArgument;
                int userId = DbHelper.GetLoggedInUserId(Session);

                DbHelper.ExecuteNonQuery(
                    "DELETE FROM Addresses WHERE AddressId = @AddressId AND UserId = @UserId",
                    new SqlParameter("@AddressId", addressId),
                    new SqlParameter("@UserId", userId));

                LoadAddresses();
            }
        }
    }
}
