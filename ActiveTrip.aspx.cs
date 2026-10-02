using System;

namespace WebApplication3.Driver
{
    public partial class ActiveTrip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Active trip information can be loaded from database later.
            }
        }
    }
}