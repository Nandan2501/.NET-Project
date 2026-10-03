using System;

namespace WebApplication3
{
    public partial class TripDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Page loads with the sample trip details
            }
        }
    }
}