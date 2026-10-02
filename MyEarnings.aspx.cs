using System;

namespace WebApplication3.Driver
{
    public partial class MyEarnings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Earnings can be loaded from database here later.
            }
        }
    }
}