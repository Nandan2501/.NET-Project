using System;

namespace WebApplication3
{
    public partial class AddressBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load addresses from database later
            }
        }


        // =========================
        // ADD NEW ADDRESS
        // =========================

        protected void btnAddAddress_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect("AddAddress.aspx");
        }


        // =========================
        // EDIT ADDRESS
        // =========================

        protected void btnEditAddress_Click(
            object sender,
            EventArgs e)
        {
            System.Web.UI.WebControls.Button btn =
                (System.Web.UI.WebControls.Button)sender;

            string addressId =
                btn.CommandArgument;

            Session["EditAddressId"] =
                addressId;

            Response.Redirect("AddAddress.aspx");
        }


        // =========================
        // DELETE ADDRESS
        // =========================

        protected void btnDeleteAddress_Click(
            object sender,
            EventArgs e)
        {
            System.Web.UI.WebControls.Button btn =
                (System.Web.UI.WebControls.Button)sender;

            string addressId =
                btn.CommandArgument;

            // Database delete will be added later.

            lblMessage.Text =
                "Address " +
                addressId +
                " deleted successfully.";
        }
    }
}