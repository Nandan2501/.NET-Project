using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class AddAddress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAddressForEdit();
            }
        }

        private void LoadAddressForEdit()
        {
            if (Session["EditAddressId"] != null)
            {
                string addressId = Session["EditAddressId"].ToString();
                int userId = DbHelper.GetLoggedInUserId(Session);

                DataTable dt = DbHelper.ExecuteQuery(
                    "SELECT TOP 1 * FROM Addresses WHERE AddressId = @AddressId AND UserId = @UserId",
                    new SqlParameter("@AddressId", addressId),
                    new SqlParameter("@UserId", userId));

                if (dt.Rows.Count > 0)
                {
                    var r = dt.Rows[0];
                    txtAddressLabel.Text = r["AddressTitle"]?.ToString();
                    txtFullAddress.Text = r["FullAddress"]?.ToString();
                    txtCity.Text = r["City"]?.ToString();
                    txtState.Text = r["State"]?.ToString();
                    txtPinCode.Text = r["PostalCode"]?.ToString();
                    chkDefault.Checked = Convert.ToBoolean(r["IsDefault"]);
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string label = txtAddressLabel.Text.Trim();
            string fullAddress = txtFullAddress.Text.Trim();
            string city = txtCity.Text.Trim();
            string state = txtState.Text.Trim();
            string pin = txtPinCode.Text.Trim();
            bool isDefault = chkDefault.Checked;

            if (string.IsNullOrWhiteSpace(label) || string.IsNullOrWhiteSpace(fullAddress))
                return;

            int userId = DbHelper.GetLoggedInUserId(Session);

            if (isDefault)
            {
                DbHelper.ExecuteNonQuery(
                    "UPDATE Addresses SET IsDefault = 0 WHERE UserId = @UserId",
                    new SqlParameter("@UserId", userId));
            }

            if (Session["EditAddressId"] != null)
            {
                string addressId = Session["EditAddressId"].ToString();
                DbHelper.ExecuteNonQuery(@"
                    UPDATE Addresses 
                    SET AddressTitle = @Label, FullAddress = @Address, City = @City, 
                        State = @State, PostalCode = @Pin, IsDefault = @IsDefault
                    WHERE AddressId = @AddressId AND UserId = @UserId",
                    new SqlParameter("@Label", label),
                    new SqlParameter("@Address", fullAddress),
                    new SqlParameter("@City", city),
                    new SqlParameter("@State", state),
                    new SqlParameter("@Pin", pin),
                    new SqlParameter("@IsDefault", isDefault ? 1 : 0),
                    new SqlParameter("@AddressId", addressId),
                    new SqlParameter("@UserId", userId));

                Session.Remove("EditAddressId");
            }
            else
            {
                DbHelper.ExecuteNonQuery(@"
                    INSERT INTO Addresses (UserId, AddressTitle, FullAddress, City, State, PostalCode, IsDefault)
                    VALUES (@UserId, @Label, @Address, @City, @State, @Pin, @IsDefault)",
                    new SqlParameter("@UserId", userId),
                    new SqlParameter("@Label", label),
                    new SqlParameter("@Address", fullAddress),
                    new SqlParameter("@City", city),
                    new SqlParameter("@State", state),
                    new SqlParameter("@Pin", pin),
                    new SqlParameter("@IsDefault", isDefault ? 1 : 0));
            }

            Response.Redirect("AddressBook.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("EditAddressId");
            Response.Redirect("AddressBook.aspx");
        }
    }
}
