using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace WebApplication3.Driver
{
    public partial class MyVehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDocExpiry.Text = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd");
                LoadVehicleInfo();
            }
        }

        private void LoadVehicleInfo()
        {
            int driverId = DbHelper.GetLoggedInDriverId(Session);

            DataTable dt = DbHelper.ExecuteQuery(@"
                SELECT TOP 1 VehicleId, VehicleName, VehicleType, RegistrationNumber, CapacityKg, VehicleStatus,
                       FORMAT(ISNULL(InsuranceExpiry, DATEADD(year, 1, GETDATE())), 'dd MMM yyyy') AS InsExpiry
                FROM Vehicles
                WHERE DriverId = @DriverId
                ORDER BY VehicleId DESC",
                new SqlParameter("@DriverId", driverId));

            if (dt.Rows.Count > 0)
            {
                var r = dt.Rows[0];
                int vehicleId = Convert.ToInt32(r["VehicleId"]);
                ViewState["VehicleId"] = vehicleId;

                litPlateNumber.Text = Server.HtmlEncode(r["RegistrationNumber"].ToString());
                litVehicleType.Text = Server.HtmlEncode(r["VehicleName"] + " (" + r["VehicleType"] + ")");
                decimal cap = r["CapacityKg"] != DBNull.Value ? Convert.ToDecimal(r["CapacityKg"]) : 0;
                litMaxCapacity.Text = cap >= 1000 ? (cap / 1000).ToString("0.0") + " Tons" : cap.ToString("N0") + " kg";
                litVehicleStatus.Text = Server.HtmlEncode(r["VehicleStatus"].ToString());
                litInsuranceTill.Text = r["InsExpiry"].ToString();

                DataTable dtDocs = DbHelper.ExecuteQuery(@"
                    SELECT DocumentType,
                           ISNULL(FORMAT(ExpiryDate, 'dd MMM yyyy'), 'No Expiry') + ' • ' + VerificationStatus AS DocInfo
                    FROM VehicleDocuments
                    WHERE VehicleId = @VehicleId
                    ORDER BY DocumentId DESC",
                    new SqlParameter("@VehicleId", vehicleId));

                rptDocuments.DataSource = dtDocs;
                rptDocuments.DataBind();
                btnUploadDoc.Enabled = true;
            }
            else
            {
                btnUploadDoc.Enabled = false;
                lblDocMsg.ForeColor = System.Drawing.Color.DarkOrange;
                lblDocMsg.Text = "No vehicle is currently assigned to your profile.";
            }
        }

        protected void btnUploadDoc_Click(object sender, EventArgs e)
        {
            if (ViewState["VehicleId"] == null) return;
            int vehicleId = Convert.ToInt32(ViewState["VehicleId"]);

            string docType = ddlDocType.SelectedValue;
            DateTime expiry;
            object expiryVal = DateTime.TryParse(txtDocExpiry.Text, out expiry) ? (object)expiry : DBNull.Value;

            string docPath = "DOC-" + DateTime.Now.ToString("yyyyMMddHHmm");
            if (fuDocFile.HasFile)
            {
                string ext = Path.GetExtension(fuDocFile.FileName)?.ToLowerInvariant();
                if (ext != ".jpg" && ext != ".jpeg" && ext != ".png" && ext != ".pdf")
                {
                    lblDocMsg.ForeColor = System.Drawing.Color.Red;
                    lblDocMsg.Text = "Allowed formats: JPG, PNG, PDF.";
                    return;
                }
                string dir = Server.MapPath("~/Uploads/VehicleDocs/");
                Directory.CreateDirectory(dir);
                string fileName = "veh_" + vehicleId + "_" + DateTime.Now.Ticks + ext;
                fuDocFile.SaveAs(Path.Combine(dir, fileName));
                docPath = "~/Uploads/VehicleDocs/" + fileName;
            }

            DbHelper.ExecuteNonQuery(@"
                INSERT INTO VehicleDocuments (VehicleId, DocumentType, DocumentPath, ExpiryDate, VerificationStatus)
                VALUES (@VehicleId, @DocType, @DocPath, @Expiry, 'Pending')",
                new SqlParameter("@VehicleId", vehicleId),
                new SqlParameter("@DocType", docType),
                new SqlParameter("@DocPath", docPath),
                new SqlParameter("@Expiry", expiryVal));

            lblDocMsg.ForeColor = System.Drawing.Color.Green;
            lblDocMsg.Text = docType + " saved to database.";
            LoadVehicleInfo();
        }
    }
}
