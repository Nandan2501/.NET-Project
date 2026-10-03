using System;

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

                // Sample data for editing
                if (addressId == "1")
                {
                    txtAddressLabel.Text = "Warehouse";

                    txtFullAddress.Text =
                        "Plot 25, Industrial Area, Rajkot, Gujarat";

                    txtCity.Text = "Rajkot";

                    txtState.Text = "Gujarat";

                    txtPinCode.Text = "360001";

                    ddlCountry.SelectedValue = "India";

                    txtPhone.Text = "+91 98765 43210";

                    rbWarehouse.Checked = true;

                    chkDefault.Checked = true;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtAddressLabel.Text))
            {
                return;
            }

            if (string.IsNullOrWhiteSpace(txtFullAddress.Text))
            {
                return;
            }

            if (string.IsNullOrWhiteSpace(txtCity.Text))
            {
                return;
            }

            if (string.IsNullOrWhiteSpace(txtState.Text))
            {
                return;
            }

            if (string.IsNullOrWhiteSpace(txtPinCode.Text))
            {
                return;
            }

            if (string.IsNullOrWhiteSpace(txtPhone.Text))
            {
                return;
            }

            // Database saving can be added here later.

            Session.Remove("EditAddressId");

            Response.Redirect("AddressBook.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("EditAddressId");

            Response.Redirect("AddressBook.aspx");
        }
    }
}