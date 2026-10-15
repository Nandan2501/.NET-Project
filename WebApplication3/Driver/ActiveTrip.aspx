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
            <div class="tracking-label">TRACKING ID</div>
            <div class="tracking-id">TRP123456789</div>
            <div class="tracking-divider"></div>

            <div class="tracking-route">
                <div class="tracking-point">
                    <span class="tracking-dot blue-dot"></span>
                    <div>
                        <div class="tracking-location">Ahmedabad Hub</div>
                        <div class="tracking-time">10:00 AM</div>
                    </div>
                </div>

                <div class="tracking-line"></div>

                <div class="tracking-point">
                    <span class="tracking-dot green-dot"></span>
                    <div>
                        <div class="tracking-location">Surat Delivery Office</div>
                        <div class="tracking-time">01:30 PM</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- STATISTICS CARD -->
        <div class="driver-active-card statistics-card">
            <h2>Statistics</h2>

            <div class="statistics-row">
                <span>Speed limit</span>
                <strong>78 km/h</strong>
            </div>

            <div class="statistics-row">
                <span>Cargo weight</span>
                <strong>4.2 Tons</strong>
            </div>
        </div>

    </section>

</asp:Content>