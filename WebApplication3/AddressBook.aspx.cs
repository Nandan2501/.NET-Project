using System;

namespace WebApplication3
{
    public partial class AddressBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAddAddress_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddAddress.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.Button btn =
                sender as System.Web.UI.WebControls.Button;

            if (btn != null)
            {
                Session["EditAddressId"] = btn.CommandArgument;

                Response.Redirect("AddAddress.aspx");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.Button btn =
                sender as System.Web.UI.WebControls.Button;

            if (btn != null)
            {
                string addressId = btn.CommandArgument;

                // Add database delete logic here later.
                // For now the address remains displayed.
            }
        }
    }
}