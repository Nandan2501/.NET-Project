using System;

namespace WebApplication3
{
    public partial class Payments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Payment page loaded.
            }
        }
    }
}