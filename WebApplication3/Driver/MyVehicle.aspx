<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="MyVehicle.aspx.cs"
    Inherits="WebApplication3.Driver.MyVehicle" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    My Vehicle - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    My Vehicle
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="driver-vehicle-content" style="padding: 0;">

        <div class="driver-vehicle-grid">

            <!-- ACTIVE TRUCK -->
            <div class="driver-vehicle-card truck-card">
                <h2>Active Truck Details</h2>

                <div class="driver-truck-image-container">
                    <div class="truck-fallback" style="display:flex;">🚚</div>
                </div>

                <div class="driver-vehicle-details">
                    <div class="driver-vehicle-detail-row">
                        <span>Plate Number</span>
                        <strong><asp:Literal ID="litPlateNumber" runat="server" Text="Unassigned" /></strong>
                    </div>

                    <div class="driver-vehicle-detail-row">
                        <span>Vehicle Name / Type</span>
                        <strong><asp:Literal ID="litVehicleType" runat="server" Text="-" /></strong>
                    </div>

                    <div class="driver-vehicle-detail-row">
                        <span>Max Capacity</span>
                        <strong><asp:Literal ID="litMaxCapacity" runat="server" Text="-" /></strong>
                    </div>

                    <div class="driver-vehicle-detail-row">
                        <span>Status</span>
                        <strong><asp:Literal ID="litVehicleStatus" runat="server" Text="-" /></strong>
                    </div>

                    <div class="driver-vehicle-detail-row">
                        <span>Insurance Valid Till</span>
                        <strong><asp:Literal ID="litInsuranceTill" runat="server" Text="-" /></strong>
                    </div>
                </div>
            </div>

            <!-- DOCUMENTS -->
            <div class="driver-vehicle-card documents-card">
                <h2>Uploaded Documents</h2>

                <div class="driver-document-list">
                    <asp:Repeater ID="rptDocuments" runat="server">
                        <ItemTemplate>
                            <div class="driver-document-item">
                                <div class="driver-document-icon">📎</div>
                                <div class="driver-document-info">
                                    <strong><%# Server.HtmlEncode(Eval("DocumentType").ToString()) %></strong>
                                    <span><%# Server.HtmlEncode(Eval("DocInfo").ToString()) %></span>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div class="mt-4 pt-3 border-top">
                    <h3 style="font-size:14px;font-weight:700;margin-bottom:10px;">Upload Vehicle Document</h3>
                    <div class="mb-2">
                        <asp:DropDownList ID="ddlDocType" runat="server" CssClass="form-select form-select-sm">
                            <asp:ListItem Text="Driver's License" Value="Driver's License" />
                            <asp:ListItem Text="Vehicle Insurance Policy" Value="Vehicle Insurance Policy" />
                            <asp:ListItem Text="Pollution Certificate (PUC)" Value="Pollution Certificate (PUC)" />
                            <asp:ListItem Text="RC Book" Value="RC Book" />
                        </asp:DropDownList>
                    </div>
                    <div class="mb-2">
                        <label class="form-label small mb-1">Expiry Date</label>
                        <asp:TextBox ID="txtDocExpiry" runat="server" TextMode="Date" CssClass="form-control form-control-sm" />
                    </div>
                    <div class="mb-2">
                        <asp:FileUpload ID="fuDocFile" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                    <asp:Button ID="btnUploadDoc" runat="server" Text="Save Document" CssClass="btn btn-primary btn-sm" CausesValidation="false" OnClick="btnUploadDoc_Click" />
                    <asp:Label ID="lblDocMsg" runat="server" CssClass="d-block mt-2 fw-semibold" />
                </div>
            </div>

        </div>

    </section>

</asp:Content>
