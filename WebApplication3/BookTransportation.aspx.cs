using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class BookTransportation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSavedAddresses();
                LoadSavedStep1();
            }
        }

        private void LoadSavedAddresses()
        {
            int userId = DbHelper.GetLoggedInUserId(Session);
            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT AddressTitle, FullAddress, City, State, PostalCode, IsDefault
                FROM Addresses
                WHERE UserId = @UserId
                ORDER BY IsDefault DESC, AddressId DESC",
                new SqlParameter("@UserId", userId));

            ddlSavedFrom.Items.Clear();
            ddlSavedTo.Items.Clear();

            ddlSavedFrom.Items.Add(new ListItem("-- Fill from saved address (optional) --", ""));
            ddlSavedTo.Items.Add(new ListItem("-- Fill from saved address (optional) --", ""));

            foreach (DataRow r in dt.Rows)
            {
                string full = $"{r["FullAddress"]}, {r["City"]}, {r["State"]} {r["PostalCode"]}".Trim(' ', ',');
                string label = $"{r["AddressTitle"]} ({r["City"]})";
                ddlSavedFrom.Items.Add(new ListItem(label, full));
                ddlSavedTo.Items.Add(new ListItem(label, full));

                if (string.IsNullOrEmpty(txtFrom.Text) && Session["FromLocation"] == null && Convert.ToBoolean(r["IsDefault"]))
                {
                    txtFrom.Text = full;
                }
            }
        }

        private void LoadSavedStep1()
        {
            if (Session["FromLocation"] != null)
                txtFrom.Text = Session["FromLocation"].ToString();

            if (Session["ToLocation"] != null)
                txtTo.Text = Session["ToLocation"].ToString();

            if (Session["VehicleType"] != null)
            {
                string vt = Session["VehicleType"].ToString();
                ListItem item = ddlVehicle.Items.FindByText(vt);
                if (item != null)
                {
                    ddlVehicle.ClearSelection();
                    item.Selected = true;
                }
            }

            if (Session["PreferredDate"] != null)
                txtDate.Text = Session["PreferredDate"].ToString();
            else if (string.IsNullOrEmpty(txtDate.Text))
                txtDate.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

            if (Session["Instructions"] != null)
                txtInstructions.Text = Session["Instructions"].ToString();
        }

        protected void ddlSavedFrom_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlSavedFrom.SelectedValue))
                txtFrom.Text = ddlSavedFrom.SelectedValue;
        }

        protected void ddlSavedTo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlSavedTo.SelectedValue))
                txtTo.Text = ddlSavedTo.SelectedValue;
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            Session["FromLocation"] = txtFrom.Text.Trim();
            Session["ToLocation"] = txtTo.Text.Trim();
            Session["VehicleType"] = ddlVehicle.SelectedItem.Text.Trim();
            Session["PreferredDate"] = txtDate.Text;
            Session["Instructions"] = txtInstructions.Text.Trim();

            Response.Redirect("BT2.aspx");
        }
    }
}
