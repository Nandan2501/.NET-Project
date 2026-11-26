<%@ Page Title="Transpo - Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="WebApplication3.Dashboard" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Transpo - Dashboard
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
        <section class="dash-content">

            <!-- WELCOME -->
            <div class="dash-welcome">
                <h2>Welcome back, <asp:Literal ID="litUserName" runat="server" Text="User" />!</h2>
                <p>Manage your transportation bookings and deliveries.</p>
            </div>

            <!-- STAT CARDS -->
            <div class="dash-stats">
                <div class="dash-stat-card">
                    <span>Active Bookings</span>
                    <strong><asp:Literal ID="litActiveBookings" runat="server" Text="0" /></strong>
                </div>

                <div class="dash-stat-card">
                    <span>Upcoming Trips</span>
                    <strong><asp:Literal ID="litUpcomingTrips" runat="server" Text="0" /></strong>
                </div>

                <div class="dash-stat-card">
                    <span>Completed Trips</span>
                    <strong><asp:Literal ID="litCompletedTrips" runat="server" Text="0" /></strong>
                </div>

                <div class="dash-stat-card pending">
                    <span>Pending Payments</span>
                    <strong><asp:Literal ID="litPendingPayments" runat="server" Text="0" /></strong>
                </div>
            </div>

            <!-- LOWER SECTION -->
            <div class="dash-lower">

                <!-- RECENT BOOKINGS -->
                <div class="dash-bookings-card">
                    <div class="dash-card-header">
                        <h3>Recent Bookings</h3>
                    </div>

                    <div class="dash-table">
                        <div class="dash-table-row dash-table-heading">
                            <div>BOOKING<br />ID</div>
                            <div>ROUTE</div>
                            <div>VEHICLE<br />TYPE</div>
                            <div>DATE</div>
                            <div>STATUS</div>
                            <div>ACTION</div>
                        </div>

                        <asp:Repeater ID="rptRecentBookings" runat="server">
                            <ItemTemplate>
                                <div class="dash-table-row">
                                    <div class="dash-booking-id"><%# Eval("BookingNumber") %></div>
                                    <div><%# Eval("Route") %></div>
                                    <div><%# Eval("VehicleType") %></div>
                                    <div><%# Eval("FormattedDate") %></div>
                                    <div>
                                        <span class='dash-status <%# GetStatusClass(Eval("BookingStatus").ToString()) %>'>
                                            <%# Eval("BookingStatus") %>
                                        </span>
                                    </div>
                                    <div>
                                        <a href='BookDetails.aspx?id=<%# Eval("BookingNumber") %>'>Details</a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <!-- UPCOMING TRIP -->
                <div class="dash-upcoming-card">
                    <div class="dash-upcoming-header">
                        <h3>Upcoming Trip</h3>
                        <span class="dash-active-badge">ACTIVE</span>
                    </div>

                    <div class="dash-trip-item">
                        <div class="dash-trip-icon">⌖</div>
                        <div>
                            <strong><asp:Literal ID="litUpcomingRoute" runat="server" Text="No upcoming trips" /></strong>
                            <span>Scheduled Route</span>
                        </div>
                    </div>

                    <div class="dash-trip-item">
                        <div class="dash-trip-icon">♧</div>
                        <div>
                            <strong><asp:Literal ID="litUpcomingVehicle" runat="server" Text="-" /></strong>
                            <span>Vehicle Type</span>
                        </div>
                    </div>

                    <div class="dash-trip-item">
                        <div class="dash-trip-icon">▣</div>
                        <div>
                            <strong><asp:Literal ID="litUpcomingDate" runat="server" Text="-" /></strong>
                            <span>Preferred Date</span>
                        </div>
                    </div>
                </div>

            </div>

        </section>
</asp:Content>
