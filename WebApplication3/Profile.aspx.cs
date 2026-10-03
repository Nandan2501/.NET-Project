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

        private void LoadProfile()
        {
            txtFullName.Text = "Nandan Nasit";
            txtEmail.Text = "jnandannasit@gmail.com";
            txtPhone.Text = "98765-43210";
            txtDOB.Text = "12 Mar 1990";
            txtAddress.Text = "Gandhinagar, gujarat 360002";
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }
    }
}