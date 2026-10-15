<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="WebApplication3.Driver.Dashboard" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Driver Dashboard - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    <div class="driver-welcome-topbar">
        <h1 style="font-size: 22px; font-weight: 700; color: #172238; margin: 0 0 4px; line-height: 1.2;">Welcome Back, Yashrajsinh 👋</h1>
        <p style="margin: 0; color: #71819a; font-size: 13px; font-weight: 400; line-height: 1.2;">Here is your fleet performance for today.</p>
    </div>
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="driver-page">

        <!-- CONTENT -->
        <section class="driver-content" style="padding-top: 15px;">

            <!-- STAT CARDS -->
            <div class="driver-stats">
                <div class="driver-stat-card">
                    <span class="driver-stat-title">Active Trips</span>
                    <strong class="driver-stat-value">3</strong>
                </div>

                <div class="driver-stat-card">
                    <span class="driver-stat-title">Total Distance</span>
                    <strong class="driver-stat-value">320 km</strong>
                </div>

                <div class="driver-stat-card">
                    <span class="driver-stat-title">Weekly Earnings</span>
                    <strong class="driver-stat-value earnings">₹4,500</strong>
                </div>
            </div>

            <!-- ACTIVE DELIVERY ROUTE -->
            <div class="active-route-card">
                <h2>Active Delivery Route</h2>
                <div class="route-box">
                    <div class="route-location">
                        <div class="route-marker start-marker"></div>
                        <div class="route-location-info"><strong>Ahmedabad Hub</strong></div>
                        <span class="route-time">10:00 AM</span>
                    </div>

                    <div class="route-line"></div>

                    <div class="route-location">
                        <div class="route-marker end-marker"></div>
                        <div class="route-location-info"><strong>Surat Delivery Office</strong></div>
                        <span class="route-time">01:30 PM (Est.)</span>
                    </div>
                </div>
            </div>

        </section>

    </div>
</asp:Content>
