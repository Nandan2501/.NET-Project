using System;

namespace WebApplication3
{
    public partial class AddAddress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEditAddress();
            }
        }


        // =========================
        // LOAD EDIT DATA
        // =========================

        private void LoadEditAddress()
        {
            string addressId =
                Session["EditAddressId"]?.ToString();

            if (string.IsNullOrEmpty(addressId))
            {
                return;
            }

            // Sample edit data.
            // Database connection can be added later.

            if (addressId == "1")
            {
                txtAddressLabel.Text =
                    "Rajkot main office";

                txtFullAddress.Text =
                    "Sapar, Rajkot, Gujarat 360002";

                txtCity.Text =
                    "Rajkot";

                txtState.Text =
                    "Gujarat";

                txtPinCode.Text =
                    "360002";

                ddlCountry.SelectedValue =
                    "India";

                txtPhone.Text =
                    "+91 98765 43210";

                rbOffice.Checked = true;

                chkDefault.Checked = true;
            }

            else if (addressId == "2")
            {
                txtAddressLabel.Text =
                    "Private Residence (Home)";

                txtFullAddress.Text =
                    "Apartment 402, Royal Residency, CG Road, Navrangpura";

                txtCity.Text =
                    "Ahmedabad";

                txtState.Text =
                    "Gujarat";

                txtPinCode.Text =
                    "380009";

                ddlCountry.SelectedValue =
                    "India";

                txtPhone.Text =
                    "+91 91234 56789";

                rbResidential.Checked = true;

                chkDefault.Checked = false;
            }
        }


        // =========================
        // SAVE ADDRESS
        // =========================

        protected void btnSave_Click(
            object sender,
            EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(
                txtAddressLabel.Text))
            {
                lblMessage.Text =
                    "Please enter an address label.";

                return;
            }


            if (string.IsNullOrWhiteSpace(
                txtFullAddress.Text))
            {
                lblMessage.Text =
                    "Please enter the full address.";

                return;
            }


            if (string.IsNullOrWhiteSpace(
                txtCity.Text))
            {
                lblMessage.Text =
                    "Please enter the city.";

                return;
            }


            if (string.IsNullOrWhiteSpace(
                txtState.Text))
            {
                lblMessage.Text =
                    "Please enter the state.";

                return;
            }


            if (string.IsNullOrWhiteSpace(
                txtPinCode.Text))
            {
                lblMessage.Text =
                    "Please enter the PIN code.";

                return;
            }


            if (string.IsNullOrWhiteSpace(
                txtPhone.Text))
            {
                lblMessage.Text =
                    "Please enter the contact phone.";

                return;
            }


            // Later:
            // Save these values into SQL database.


            Session.Remove("EditAddressId");

            Response.Redirect("AddressBook.aspx");
        }


        // =========================
        // CANCEL
        // =========================

        protected void btnCancel_Click(
            object sender,
            EventArgs e)
        {
            Session.Remove("EditAddressId");

            Response.Redirect("AddressBook.aspx");
        }
    }
}