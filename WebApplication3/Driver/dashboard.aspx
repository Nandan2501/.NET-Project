<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="WebApplication3.Driver.Dashboard" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Driver Dashboard - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    <div class="driver-welcome-topbar">
        <h1 style="font-size: 22px; font-weight: 700; color: #172238; margin: 0 0 4px; line-height: 1.2;">Welcome Back, <asp:Literal ID="litDriverName" runat="server" Text="Driver" /> 👋</h1>
        <p style="margin: 0; color: #71819a; font-size: 13px; font-weight: 400; line-height: 1.2;">Here is your fleet performance and open trips for today.</p>
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
                    <span class="driver-stat-title">Open Trip Requests</span>
                    <strong class="driver-stat-value"><asp:Literal ID="litOpenTrips" runat="server" Text="0" /></strong>
                </div>

                <div class="driver-stat-card">
                    <span class="driver-stat-title">My Active Trips</span>
                    <strong class="driver-stat-value"><asp:Literal ID="litActiveTrips" runat="server" Text="0" /></strong>
                </div>

                <div class="driver-stat-card">
                    <span class="driver-stat-title">Total Distance</span>
                    <strong class="driver-stat-value"><asp:Literal ID="litTotalDistance" runat="server" Text="0 km" /></strong>
                </div>

                <div class="driver-stat-card">
                    <span class="driver-stat-title">Account Balance (Credited)</span>
                    <strong class="driver-stat-value earnings"><asp:Literal ID="litTotalEarnings" runat="server" Text="₹0" /></strong>
                </div>
            </div>

            <!-- AVAILABLE OPEN TRIPS PREVIEW -->
            <div class="active-route-card mb-4">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <h2 class="mb-0">Available Trips to Confirm</h2>
                    <a href="trips.aspx" class="btn btn-outline-primary btn-sm">View All Trips</a>
                </div>
                <asp:Label ID="lblDashMsg" runat="server" CssClass="d-block mb-2 fw-semibold" />
                <div class="table-responsive">
                    <table class="table table-sm align-middle mb-0">
                        <thead class="table-light">
                            <tr>
                                <th>Trip ID</th>
                                <th>Cities (From → To)</th>
                                <th>Load Details</th>
                                <th>Your Payout</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptOpenTrips" runat="server" OnItemCommand="rptOpenTrips_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td class="fw-semibold"><%# Eval("BookingNumber") %></td>
                                        <td>
                                            <strong><%# Server.HtmlEncode(Eval("CitiesRoute").ToString()) %></strong>
                                            <div class="small text-muted"><%# Server.HtmlEncode(Eval("VehicleType").ToString()) %></div>
                                        </td>
                                        <td>
                                            <%# Server.HtmlEncode(Eval("LoadSummary").ToString()) %>
                                        </td>
                                        <td class="fw-bold text-success">
                                            <%# Eval("TotalPayout") %>
                                            <div class="small text-muted fw-normal">50% arrival + 50% delivery</div>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnAccept" runat="server"
                                                CommandName="AcceptTrip"
                                                CommandArgument='<%# Eval("BookingId") %>'
                                                Text="Confirm Trip"
                                                OnClientClick="return confirm('Confirm this trip?');"
                                                CssClass="btn btn-primary btn-sm" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
                <asp:Literal ID="litNoOpenTrips" runat="server" Visible="false" Text="<div class='text-muted small py-2'>No open trip requests right now.</div>" />
            </div>

            <!-- ACTIVE DELIVERY ROUTE -->
            <div class="active-route-card">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <h2 class="mb-0">Active Delivery Route</h2>
                    <a href="ActiveTrip.aspx" class="btn btn-outline-primary btn-sm">Open Active Trip</a>
                </div>
                <div class="route-box">
                    <div class="route-location">
                        <div class="route-marker start-marker"></div>
                        <div class="route-location-info"><strong><asp:Literal ID="litPickupLoc" runat="server" Text="No active trip" /></strong></div>
                        <span class="route-time"><asp:Literal ID="litPickupTime" runat="server" Text="-" /></span>
                    </div>

                    <div class="route-line"></div>

                    <div class="route-location">
                        <div class="route-marker end-marker"></div>
                        <div class="route-location-info"><strong><asp:Literal ID="litDropLoc" runat="server" Text="-" /></strong></div>
                        <span class="route-time"><asp:Literal ID="litDropTime" runat="server" Text="-" /></span>
                    </div>
                </div>
            </div>

        </section>

    </div>
</asp:Content>
