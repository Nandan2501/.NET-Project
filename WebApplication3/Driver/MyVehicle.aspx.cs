using System;

namespace WebApplication3.Driver
{
    public partial class MyVehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Vehicle information can be loaded from database here later.
            }
        }
    }
}