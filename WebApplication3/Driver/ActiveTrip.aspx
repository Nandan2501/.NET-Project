<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ActiveTrip.aspx.cs"
    Inherits="WebApplication3.Driver.ActiveTrip" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Active Trip Tracking - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Active Trip Tracking
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="driver-active-content" style="padding: 0;">

        <!-- TRACKING CARD -->
        <div class="driver-active-card tracking-card">
            <div class="d-flex justify-content-between align-items-center">
                <div class="tracking-label">TRACKING ID</div>
                <span class="badge bg-primary"><asp:Literal ID="litTripStatus" runat="server" Text="Idle" /></span>
            </div>
            <div class="tracking-id"><asp:Literal ID="litTrackingId" runat="server">No Active Trip</asp:Literal></div>
            <div class="tracking-divider"></div>

            <div class="tracking-route">
                <div class="tracking-point">
                    <span class="tracking-dot blue-dot"></span>
                    <div>
                        <div class="tracking-location"><asp:Literal ID="litPickupLocation" runat="server">-</asp:Literal></div>
                        <div class="tracking-time"><asp:Literal ID="litPickupTime" runat="server">-</asp:Literal></div>
                    </div>
                </div>

                <div class="tracking-line"></div>

                <div class="tracking-point">
                    <span class="tracking-dot green-dot"></span>
                    <div>
                        <div class="tracking-location"><asp:Literal ID="litDropLocation" runat="server">-</asp:Literal></div>
                        <div class="tracking-time"><asp:Literal ID="litDropTime" runat="server">-</asp:Literal></div>
                    </div>
                </div>
            </div>

            <div class="mt-3 p-2 rounded bg-light border small text-secondary">
                <asp:Literal ID="litPayoutBanner" runat="server" Text="Accept a trip from Trips &amp; Available Loads to get started." />
            </div>

            <div class="mt-3 d-flex flex-wrap gap-2">
                <asp:Button ID="btnMarkArrived" runat="server" Text="I Have Arrived at Pickup" CssClass="btn btn-warning btn-sm" Visible="false" OnClick="btnMarkArrived_Click" />
                <asp:Button ID="btnMarkDelivered" runat="server" Text="Mark Trip Delivered" CssClass="btn btn-success btn-sm" Visible="false" OnClick="btnMarkDelivered_Click" />
                <a href="trips.aspx" class="btn btn-outline-secondary btn-sm">All Trips &amp; Open Loads</a>
            </div>
            <asp:Label ID="lblActiveMsg" runat="server" ForeColor="Green" CssClass="d-block mt-2 fw-semibold" />
        </div>

        <!-- STATISTICS CARD -->
        <div class="driver-active-card statistics-card">
            <h2>Load &amp; Payout Details</h2>

            <div class="statistics-row">
                <span>Customer</span>
                <strong><asp:Literal ID="litCustomer" runat="server">-</asp:Literal></strong>
            </div>

            <div class="statistics-row">
                <span>Cities</span>
                <strong><asp:Literal ID="litCities" runat="server">-</asp:Literal></strong>
            </div>

            <div class="statistics-row">
                <span>Distance</span>
                <strong><asp:Literal ID="litDistance" runat="server">-</asp:Literal></strong>
            </div>

            <div class="statistics-row">
                <span>Load Type</span>
                <strong><asp:Literal ID="litLoadType" runat="server">-</asp:Literal></strong>
            </div>

            <div class="statistics-row">
                <span>Cargo Weight &amp; Packages</span>
                <strong><asp:Literal ID="litCargoWeight" runat="server">-</asp:Literal></strong>
            </div>

            <div class="statistics-row">
                <span>Special Handling</span>
                <strong><asp:Literal ID="litSpecialHandling" runat="server">-</asp:Literal></strong>
            </div>

            <div class="statistics-row">
                <span>1st Half (Arrival Confirmed)</span>
                <strong><asp:Literal ID="litHalf1Status" runat="server">-</asp:Literal></strong>
            </div>

            <div class="statistics-row">
                <span>2nd Half (Completion Confirmed)</span>
                <strong><asp:Literal ID="litHalf2Status" runat="server">-</asp:Literal></strong>
            </div>
        </div>

    </section>

</asp:Content>
