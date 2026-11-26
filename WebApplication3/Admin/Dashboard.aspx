<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="WebApplication3.AdminDashboard" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Dashboard - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Admin Dashboard
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="admin-dashboard-content" style="padding: 0;">

        <!-- STATISTICS -->
        <div class="admin-stat-grid">

            <!-- TOTAL BOOKINGS -->
            <div class="admin-stat-card">
                <div class="admin-stat-header">
                    <span>Total Bookings</span>
                    <div class="admin-stat-icon">▣</div>
                </div>
                <div class="admin-stat-number"><asp:Literal ID="litTotalBookings" runat="server" Text="0" /></div>
            </div>

            <!-- REVENUE -->
            <div class="admin-stat-card">
                <div class="admin-stat-header">
                    <span>Revenue</span>
                    <div class="admin-stat-icon">₹</div>
                </div>
                <div class="admin-stat-number"><asp:Literal ID="litTotalRevenue" runat="server" Text="₹0" /></div>
            </div>

            <!-- ACTIVE VEHICLES -->
            <div class="admin-stat-card">
                <div class="admin-stat-header">
                    <span>Active Vehicles</span>
                    <div class="admin-stat-icon">▣</div>
                </div>
                <div class="admin-stat-number"><asp:Literal ID="litActiveVehicles" runat="server" Text="0" /></div>
            </div>

            <!-- ACTIVE DRIVERS -->
            <div class="admin-stat-card">
                <div class="admin-stat-header">
                    <span>Active Drivers</span>
                    <div class="admin-stat-icon">♧</div>
                </div>
                <div class="admin-stat-number"><asp:Literal ID="litActiveDrivers" runat="server" Text="0" /></div>
            </div>

        </div>

        <!-- RECENT BOOKINGS -->
        <div class="admin-bookings-card">
            <div class="admin-section-title">
                <h2>Recent Bookings</h2>
            </div>

            <div class="admin-table-wrapper">
                <asp:GridView
                    ID="gvRecentBookings"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="admin-bookings-table"
                    GridLines="None">
                    <Columns>
                        <asp:BoundField
                            DataField="BookingId"
                            HeaderText="BOOKING ID" />

                        <asp:BoundField
                            DataField="Customer"
                            HeaderText="CUSTOMER" />

                        <asp:BoundField
                            DataField="Vehicle"
                            HeaderText="VEHICLE" />

                        <asp:BoundField
                            DataField="Date"
                            HeaderText="DATE" />

                        <asp:TemplateField
                            HeaderText="STATUS">
                            <ItemTemplate>
                                <span class='<%# GetStatusClass(Eval("Status").ToString()) %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField
                            DataField="Amount"
                            HeaderText="AMOUNT" />

                        <asp:TemplateField HeaderText="ACTION">
                            <ItemTemplate>
                                <a href='TripDetails.aspx?id=<%# Eval("BookingId") %>' class="btn btn-outline-primary btn-sm">View Trip</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </section>

</asp:Content>
