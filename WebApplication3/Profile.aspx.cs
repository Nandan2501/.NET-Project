using System;

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


        // =========================
        // LOAD PROFILE
        // =========================

        private void LoadProfile()
        {
            // Sample data for now.
            // Later this can come from SQL Server.

            txtFullName.Text =
                "Nandan Nasit";

            txtEmail.Text =
                "jnandannasit@gmail.com";

            txtPhone.Text =
                "98765-43210";

            txtDateOfBirth.Text =
                "12 Mar 1990";

            txtAddress.Text =
                "Gandhinagar, gujarat 360002";
        }


        // =========================
        // EDIT PROFILE
        // =========================

        protected void btnEditProfile_Click(
            object sender,
            EventArgs e)
        {
            // Later save updated profile
            // information into database.

            lblMessage.Text =
                "Profile updated successfully.";
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
                    "Please select a profile photo.";

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


            // File saving can be added later.

            lblMessage.Text =
                "Profile photo selected successfully.";
        }
    }
}