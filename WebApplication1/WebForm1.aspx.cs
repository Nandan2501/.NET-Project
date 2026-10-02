using System;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Label1.Text = "Selected Date: " + Calendar1.SelectedDate.ToString("dd-MM-yyyy");
        }
    }
}

//        protected void btnSubmit_Click(object sender, EventArgs e)
//        {
//            if (Male.Checked)
//            {
//                Gender.Text = "Selected Gender: Male";
//            }
//            else if (Female.Checked)
//            {
//                Gender.Text = "Selected Gender: Female";
//            }
//            else
//            {
//                Gender.Text = "Please select a gender.";
//            }
//        }

//        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
//        {

//        }

//        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
//        {

//        }

//        protected void CheckBox4_CheckedChanged(object sender, EventArgs e)
//        {

//        }

//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }

//        protected void Button1_Click(object sender, EventArgs e)
//        {
//            int total = 0;

//            if (C.Checked)
//            {
//                total += 1000;
//            }

//            if (CSharp.Checked)
//            {
//                total += 2000;
//            }

//            if (Java.Checked)
//            {
//                total += 3000;
//            }

//            if (total > 0)
//            {
//                lblCost.Text = "Total Course Fees: ₹" + total;
//            }
//            else
//            {
//                lblCost.Text = "Please select at least one course.";
//            }
//        }

//        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
//        {
//            Label3.Text= "Your selected city is: " + ListBox1.SelectedItem;
//        }

//        protected void AdRotator1_AdCreated(object sender, System.Web.UI.WebControls.AdCreatedEventArgs e)
//        {

//        }
//    }
    
//}