<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Reports.aspx.cs"
    Inherits="WebApplication3.Reports" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Reports &amp; Analytics - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Reports
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="rp-content" style="padding: 0;">

        <!-- STATISTICS -->
        <div class="rp-stat-grid">

            <!-- TOTAL BOOKINGS -->
            <div class="rp-stat-card">
                <div class="rp-stat-top">
                    <span>Total Bookings</span>
                    <div class="rp-stat-icon">▣</div>
                </div>
                <strong class="rp-stat-value"><asp:Literal ID="litTotalBookings" runat="server" Text="0" /></strong>
            </div>

            <!-- TOTAL REVENUE -->
            <div class="rp-stat-card">
                <div class="rp-stat-top">
                    <span>Total Revenue</span>
                    <div class="rp-stat-icon">₹</div>
                </div>
                <strong class="rp-stat-value"><asp:Literal ID="litTotalRevenue" runat="server" Text="₹0" /></strong>
            </div>

            <!-- AVERAGE TRIP -->
            <div class="rp-stat-card">
                <div class="rp-stat-top">
                    <span>Average Trip Value</span>
                    <div class="rp-stat-icon">↗</div>
                </div>
                <strong class="rp-stat-value"><asp:Literal ID="litAvgTripValue" runat="server" Text="₹0" /></strong>
            </div>

            <!-- ACTIVE VEHICLES -->
            <div class="rp-stat-card">
                <div class="rp-stat-top">
                    <span>Active Vehicles</span>
                    <div class="rp-stat-icon">▣</div>
                </div>
                <strong class="rp-stat-value"><asp:Literal ID="litActiveVehicles" runat="server" Text="0" /></strong>
            </div>

            <!-- TOTAL DRIVERS -->
            <div class="rp-stat-card">
                <div class="rp-stat-top">
                    <span>Total Drivers</span>
                    <div class="rp-stat-icon">♙</div>
                </div>
                <strong class="rp-stat-value"><asp:Literal ID="litTotalDrivers" runat="server" Text="0" /></strong>
            </div>

        </div>

        <!-- LOWER SECTION -->
        <div class="rp-bottom-grid">

            <!-- TOP PERFORMING DRIVERS -->
            <div class="rp-panel">
                <div class="rp-panel-header">
                    <h2>Top Performing Drivers</h2>
                    <a href="Drivers.aspx">View All</a>
                </div>

                <asp:Repeater ID="rptTopDrivers" runat="server">
                    <ItemTemplate>
                        <div class="rp-driver-row">
                            <div class="rp-driver-avatar"><%# Eval("Initials") %></div>
                            <div class="rp-driver-info">
                                <strong><%# Server.HtmlEncode(Eval("FullName").ToString()) %></strong>
                                <span>ID: #DRI-<%# Eval("DriverId") %> | <%# Eval("VerificationStatus") %></span>
                            </div>
                            <div class="rp-driver-result">
                                <strong><%# Eval("TripCount") %> <%# Convert.ToInt32(Eval("TripCount")) == 1 ? "Trip" : "Trips" %></strong>
                                <span>★ <%# Eval("Rating") %></span>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- BOOKING STATUS BREAKDOWN -->
            <div class="rp-panel">
                <div class="rp-panel-header">
                    <h2>Booking Status Breakdown</h2>
                    <a href="Dashboard.aspx">View Trips</a>
                </div>

                <asp:Repeater ID="rptStatusBreakdown" runat="server">
                    <ItemTemplate>
                        <div class="rp-driver-row">
                            <div class="rp-driver-info">
                                <strong><%# Eval("BookingStatus") %></strong>
                                <span>Total Billed: ₹<%# Convert.ToDecimal(Eval("TotalAmount")).ToString("N0") %></span>
                            </div>
                            <div class="rp-driver-result">
                                <strong><%# Eval("BookingCount") %> <%# Convert.ToInt32(Eval("BookingCount")) == 1 ? "Booking" : "Bookings" %></strong>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>

    </section>

</asp:Content>
