using System;

namespace WebApplication3
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }


        // =========================
        // LOAD EXISTING PROFILE
        // =========================

        private void LoadProfile()
        {
            txtFullName.Text =
                "Nandan Nasit";

            txtEmail.Text =
                "jnandannasit@gmail.com";

            txtPhone.Text =
                "7757856769";

            txtDateOfBirth.Text =
                "12 Mar 2006";

            txtAddress.Text =
                "Gandhinagar, Gujarat 360002";
        }


        // =========================
        // SAVE CHANGES
        // =========================

        protected void btnSave_Click(
            object sender,
            EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(
                txtFullName.Text))
            {
                lblMessage.Text =
                    "Please enter your full name.";

                return;
            }

            if (string.IsNullOrWhiteSpace(
                txtEmail.Text))
            {
                lblMessage.Text =
                    "Please enter your email.";

                return;
            }

            if (string.IsNullOrWhiteSpace(
                txtPhone.Text))
            {
                lblMessage.Text =
                    "Please enter your phone number.";

                return;
            }

            if (string.IsNullOrWhiteSpace(
                txtAddress.Text))
            {
                lblMessage.Text =
                    "Please enter your address.";

                return;
            }


            // Database update will be added later.

            Response.Redirect("Profile.aspx");
        }


        // =========================
        // CANCEL
        // =========================

        protected void btnCancel_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }


        // =========================
        // CHANGE PHOTO
        // =========================

        protected void btnChangePhoto_Click(
            object sender,
            EventArgs e)
        {
            if (!fuProfilePhoto.HasFile)
            {
                lblMessage.Text =
                    "Please select a photo.";

                return;
            }

            string extension =
                System.IO.Path.GetExtension(
                    fuProfilePhoto.FileName)
                .ToLower();

            if (extension != ".jpg" &&
                extension != ".jpeg" &&
                extension != ".png" &&
                extension != ".gif")
            {
                lblMessage.Text =
                    "Only JPG, JPEG, PNG or GIF files are allowed.";

                return;
            }

            if (fuProfilePhoto.PostedFile.ContentLength >
                800 * 1024)
            {
                lblMessage.Text =
                    "Maximum file size is 800 KB.";

                return;
            }

            lblMessage.Text =
                "Profile photo selected successfully.";
        }
    }
}