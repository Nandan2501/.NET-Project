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
                    <img src="<%= ResolveUrl("~/Images/truck.png") %>"
                         alt="Medium Duty Flatbed Truck"
                         class="driver-truck-image"
                         onerror="this.style.display='none';" />
                    <div class="truck-fallback">🚚</div>
                </div>

                <div class="driver-vehicle-details">
                    <div class="driver-vehicle-detail-row">
                        <span>Plate Number</span>
                        <strong>GJ-01-TA-1234</strong>
                    </div>

                    <div class="driver-vehicle-detail-row">
                        <span>Vehicle Type</span>
                        <strong>Medium Duty Flatbed</strong>
                    </div>

                    <div class="driver-vehicle-detail-row">
                        <span>Max Capacity</span>
                        <strong>5.5 Tons</strong>
                    </div>

                    <div class="driver-vehicle-detail-row">
                        <span>Insurance Valid Till</span>
                        <strong>30 Sep 2026</strong>
                    </div>
                </div>
            </div>

            <!-- DOCUMENTS -->
            <div class="driver-vehicle-card documents-card">
                <h2>Uploaded Documents</h2>

                <div class="driver-document-list">
                    <div class="driver-document-item">
                        <div class="driver-document-icon">📎</div>
                        <div class="driver-document-info">
                            <strong>Driver's License</strong>
                            <span>gj845655655</span>
                        </div>
                    </div>

                    <div class="driver-document-item">
                        <div class="driver-document-icon">📎</div>
                        <div class="driver-document-info">
                            <strong>Vehicle Insurance policy</strong>
                            <span>30-07-2026</span>
                        </div>
                    </div>

                    <div class="driver-document-item">
                        <div class="driver-document-icon">📎</div>
                        <div class="driver-document-info">
                            <strong>Pollution Certificate (PUC)</strong>
                            <span>30-1-2027</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </section>

</asp:Content>