using System;
using System.IO;

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


        private void LoadProfile()
        {
            txtFullName.Text = "Nandan Nasit";
            txtEmail.Text = "jnandannasit@gmail.com";
            txtPhone.Text = "98765-43210";
            txtDob.Text = "12 Mar 1990";
            txtAddress.Text = "Gandhinagar, Gujarat 360002";

            imgProfile.ImageUrl = "Images/profile.jpg";
        }


        protected void btnChangePhoto_Click(object sender, EventArgs e)
        {
            if (!fuProfilePhoto.HasFile)
            {
                return;
            }

            string extension =
                Path.GetExtension(fuProfilePhoto.FileName).ToLower();

            string[] allowedExtensions =
            {
                ".jpg",
                ".jpeg",
                ".png",
                ".gif"
            };

            bool validExtension = false;

            foreach (string ext in allowedExtensions)
            {
                if (extension == ext)
                {
                    validExtension = true;
                    break;
                }
            }

            if (!validExtension)
            {
                return;
            }


            // 800 KB maximum

            if (fuProfilePhoto.PostedFile.ContentLength > 800 * 1024)
            {
                return;
            }


            string fileName =
                "profile_" +
                DateTime.Now.Ticks +
                extension;


            string folderPath =
                Server.MapPath("~/Images/");


            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }


            string filePath =
                Path.Combine(folderPath, fileName);


            fuProfilePhoto.SaveAs(filePath);


            imgProfile.ImageUrl =
                "Images/" + fileName;
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Here you can later save the information
            // to your database.

            Session["ProfileName"] = txtFullName.Text;
            Session["ProfileEmail"] = txtEmail.Text;
            Session["ProfilePhone"] = txtPhone.Text;
            Session["ProfileDob"] = txtDob.Text;
            Session["ProfileAddress"] = txtAddress.Text;


            Response.Redirect("Profile.aspx");
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    }
}