using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _5Btech
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void print_btn_Click(object sender, EventArgs e)
        {
            Response.Write("yashrajsinh");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void sum_Click(object sender, EventArgs e)
        {
            int a = int.Parse(num1.Text);
            int b = int.Parse(num2.Text);
            Label3.Text = "sum of number is " + (a + b);
        }
    }
}