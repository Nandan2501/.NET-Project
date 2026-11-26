using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace WebApplication3
{
    public partial class SiteMaster : MasterPage
    {
        private class MenuItem
        {
            public string Text { get; set; }
            public string Icon { get; set; }
            public string Url { get; set; }

            public MenuItem(string text, string icon, string url)
            {
                Text = text;
                Icon = icon;
                Url = url;
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            // Enforce authenticated session across all MasterPage-hosted pages
            int userId = DbHelper.GetLoggedInUserId(Session);
            if (userId <= 0)
            {
                Response.Redirect(ResolveUrl("~/Login.aspx"), false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            string role = GetCurrentRole();
            string currentPath = Request.AppRelativeCurrentExecutionFilePath ?? string.Empty;

            if (currentPath.IndexOf("/Admin/", StringComparison.OrdinalIgnoreCase) >= 0 &&
                !role.Equals("Admin", StringComparison.OrdinalIgnoreCase))
            {
                RedirectToRoleDashboard(role);
                return;
            }

            if (currentPath.IndexOf("/Driver/", StringComparison.OrdinalIgnoreCase) >= 0 &&
                !role.Equals("Driver", StringComparison.OrdinalIgnoreCase))
            {
                RedirectToRoleDashboard(role);
                return;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (DbHelper.GetLoggedInUserId(Session) <= 0)
                return;

            string role = GetCurrentRole();
            string name = GetCurrentUserName(role);

            litUserName.Text = Server.HtmlEncode(name);
            litUserRole.Text = Server.HtmlEncode(role);
            litAvatarLetter.Text = Server.HtmlEncode(
                !string.IsNullOrEmpty(name)
                    ? name.Substring(0, 1).ToUpper()
                    : "U"
            );

            ConfigureBrandLink(role);
            BuildSidebar(role);
        }

        private void RedirectToRoleDashboard(string role)
        {
            if (role.Equals("Admin", StringComparison.OrdinalIgnoreCase))
                Response.Redirect(ResolveUrl("~/Admin/Dashboard.aspx"), false);
            else if (role.Equals("Driver", StringComparison.OrdinalIgnoreCase))
                Response.Redirect(ResolveUrl("~/Driver/dashboard.aspx"), false);
            else
                Response.Redirect(ResolveUrl("~/Dashboard.aspx"), false);

            Context.ApplicationInstance.CompleteRequest();
        }

        private string GetCurrentRole()
        {
            if (Session["Role"] != null)
            {
                string sessionRole = Session["Role"].ToString();
                if (sessionRole.Equals("Admin", StringComparison.OrdinalIgnoreCase))
                    return "Admin";
                if (sessionRole.Equals("Driver", StringComparison.OrdinalIgnoreCase))
                    return "Driver";
                if (sessionRole.Equals("Customer", StringComparison.OrdinalIgnoreCase))
                    return "Customer";
            }

            string currentPath = Request.AppRelativeCurrentExecutionFilePath ?? string.Empty;
            if (currentPath.IndexOf("/Admin/", StringComparison.OrdinalIgnoreCase) >= 0)
                return "Admin";
            if (currentPath.IndexOf("/Driver/", StringComparison.OrdinalIgnoreCase) >= 0)
                return "Driver";

            return "Customer";
        }

        private string GetCurrentUserName(string role)
        {
            if (Session["FullName"] != null && !string.IsNullOrWhiteSpace(Session["FullName"].ToString()))
                return Session["FullName"].ToString();

            int userId = DbHelper.GetLoggedInUserId(Session);
            if (userId > 0)
            {
                object nameObj = DbHelper.ExecuteScalar("SELECT FullName FROM Users WHERE UserId = @UserId",
                    new System.Data.SqlClient.SqlParameter("@UserId", userId));
                if (nameObj != null && nameObj != DBNull.Value && !string.IsNullOrWhiteSpace(nameObj.ToString()))
                {
                    Session["FullName"] = nameObj.ToString();
                    return nameObj.ToString();
                }
            }

            if (role == "Admin") return "Admin User";
            if (role == "Driver") return "Driver";
            return "Customer";
        }

        private void ConfigureBrandLink(string role)
        {
            if (lnkBrand != null)
            {
                if (role == "Admin")
                    lnkBrand.HRef = ResolveUrl("~/Admin/Dashboard.aspx");
                else if (role == "Driver")
                    lnkBrand.HRef = ResolveUrl("~/Driver/dashboard.aspx");
                else
                    lnkBrand.HRef = ResolveUrl("~/Dashboard.aspx");
            }
        }

        private void BuildSidebar(string role)
        {
            phSidebarLinks.Controls.Clear();
            MenuItem[] items;

            if (role == "Admin")
            {
                items = new MenuItem[]
                {
                    new MenuItem("Dashboard", "▦", "~/Admin/Dashboard.aspx"),
                    new MenuItem("Vehicles", "▣", "~/Admin/Vehicle.aspx"),
                    new MenuItem("Drivers", "♙", "~/Admin/Drivers.aspx"),
                    new MenuItem("Customers", "♧", "~/Admin/Customers.aspx"),
                    new MenuItem("Payments", "▤", "~/Admin/Payment.aspx"),
                    new MenuItem("Reports", "▥", "~/Admin/Reports.aspx"),
                    new MenuItem("Settings", "⚙", "~/Admin/Settings.aspx")
                };
            }
            else if (role == "Driver")
            {
                items = new MenuItem[]
                {
                    new MenuItem("Dashboard", "▦", "~/Driver/dashboard.aspx"),
                    new MenuItem("Trips", "→", "~/Driver/trips.aspx"),
                    new MenuItem("Active Trip", "⌖", "~/Driver/ActiveTrip.aspx"),
                    new MenuItem("My Earnings", "▤", "~/Driver/MyEarnings.aspx"),
                    new MenuItem("My Vehicle", "▱", "~/Driver/MyVehicle.aspx"),
                    new MenuItem("Profile", "♙", "~/Driver/Profile.aspx"),
                    new MenuItem("Settings", "⚙", "~/Driver/Settings.aspx")
                };
            }
            else
            {
                items = new MenuItem[]
                {
                    new MenuItem("Dashboard", "▦", "~/Dashboard.aspx"),
                    new MenuItem("Book Transportation", "♧", "~/BookTransportation.aspx"),
                    new MenuItem("My Bookings", "☷", "~/Bookings.aspx"),
                    new MenuItem("Payments", "▤", "~/Payments.aspx"),
                    new MenuItem("Address Book", "▱", "~/AddressBook.aspx"),
                    new MenuItem("Profile", "♙", "~/Profile.aspx")
                };
            }

            string currentAppRelative = (Request.AppRelativeCurrentExecutionFilePath ?? string.Empty).TrimEnd('/');

            foreach (MenuItem item in items)
            {
                string resolvedUrl = ResolveUrl(item.Url);
                bool isActive = IsItemActive(item.Url, currentAppRelative);

                HtmlAnchor link = new HtmlAnchor();
                link.HRef = resolvedUrl;
                link.Attributes["class"] = isActive ? "tm-nav-link active" : "tm-nav-link";
                link.Attributes["title"] = item.Text;

                HtmlGenericControl icon = new HtmlGenericControl("span");
                icon.Attributes["class"] = "tm-menu-icon";
                icon.InnerText = item.Icon;

                HtmlGenericControl text = new HtmlGenericControl("span");
                text.Attributes["class"] = "tm-menu-text";
                text.InnerText = item.Text;

                link.Controls.Add(icon);
                link.Controls.Add(text);

                phSidebarLinks.Controls.Add(link);
            }
        }

        private bool IsItemActive(string itemUrl, string currentPath)
        {
            string targetPath = VirtualPathUtility.ToAppRelative(itemUrl, Request.ApplicationPath).TrimEnd('/');

            if (string.Equals(currentPath, targetPath, StringComparison.OrdinalIgnoreCase))
                return true;

            if (targetPath.EndsWith("/BookTransportation.aspx", StringComparison.OrdinalIgnoreCase) &&
                (currentPath.EndsWith("/BT2.aspx", StringComparison.OrdinalIgnoreCase) ||
                 currentPath.EndsWith("/BT3.aspx", StringComparison.OrdinalIgnoreCase) ||
                 currentPath.EndsWith("/ConfirmBook.aspx", StringComparison.OrdinalIgnoreCase)))
                return true;

            if (targetPath.EndsWith("/Bookings.aspx", StringComparison.OrdinalIgnoreCase) &&
                currentPath.EndsWith("/BookDetails.aspx", StringComparison.OrdinalIgnoreCase))
                return true;

            if (targetPath.EndsWith("/AddressBook.aspx", StringComparison.OrdinalIgnoreCase) &&
                currentPath.EndsWith("/AddAddress.aspx", StringComparison.OrdinalIgnoreCase))
                return true;

            if (targetPath.EndsWith("/Profile.aspx", StringComparison.OrdinalIgnoreCase) &&
                (currentPath.EndsWith("/EditProfile.aspx", StringComparison.OrdinalIgnoreCase) ||
                 currentPath.EndsWith("/ChangePassword.aspx", StringComparison.OrdinalIgnoreCase)))
                return true;

            if (targetPath.EndsWith("/Vehicle.aspx", StringComparison.OrdinalIgnoreCase) &&
                currentPath.EndsWith("/AddVehicle.aspx", StringComparison.OrdinalIgnoreCase))
                return true;

            if (targetPath.EndsWith("/Drivers.aspx", StringComparison.OrdinalIgnoreCase) &&
                currentPath.EndsWith("/AddDriver.aspx", StringComparison.OrdinalIgnoreCase))
                return true;

            if (targetPath.EndsWith("/Dashboard.aspx", StringComparison.OrdinalIgnoreCase) &&
                currentPath.EndsWith("/TripDetails.aspx", StringComparison.OrdinalIgnoreCase))
                return true;

            return false;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect(ResolveUrl("~/Login.aspx"), false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
