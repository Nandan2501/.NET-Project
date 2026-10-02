using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tool
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {

        }

        protected void UPLOAD_BTN_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string path = Server.MapPath("~/Uploads/") + FileUpload1.FileName;
                string file = FileUpload1.FileName;
                FileUpload1.SaveAs(path);
                Label1.Text = "File uploaded successfully:" + file;

            }
            else
            {
                Label1.Text = "Please select a file to upload.";

            }
         }

        protected void next_btn_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void previous_btn_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void REG_btn_Click(object sender, EventArgs e)
        {

        }
    }
}