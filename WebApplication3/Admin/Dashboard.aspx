<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="WebApplication3.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Admin Dashboard - Transpo</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <!-- Main CSS -->
    <link rel="stylesheet"
          href="../CSS/style.css" />

</head>

<body>

<form id="form1" runat="server">

<div class="admin-dashboard-page">

    <!-- =====================================================
         SIDEBAR
    ====================================================== -->

    <aside class="admin-sidebar">

        <!-- LOGO -->

        <div class="admin-brand">

    <div class="brand-icon">
        🚚
    </div>

    <span>Transpo</span>

</div>


        <!-- NAVIGATION -->

       <nav class="cu-navigation">

    <a href="Dashboard.aspx" class="cu-nav-item active">
        <span class="cu-nav-icon">▦</span>
        <span>Dashboard</span>
    </a>

    <a href="Vehicle.aspx" class="cu-nav-item">
        <span class="cu-nav-icon">♧</span>
        <span>Vehicles</span>
    </a>

    <a href="Drivers.aspx" class="cu-nav-item">
        <span class="cu-nav-icon">♙</span>
        <span>Drivers</span>
    </a>

    <a href="Customers.aspx" class="cu-nav-item ">
        <span class="cu-nav-icon">♙</span>
        <span>Customers</span>
    </a>

    <a href="Payment.aspx" class="cu-nav-item">
        <span class="cu-nav-icon">▱</span>
        <span>Payments</span>
    </a>

    <a href="Reports.aspx" class="cu-nav-item">
        <span class="cu-nav-icon">▥</span>
        <span>Reports</span>
    </a>

    <a href="Settings.aspx" class="cu-nav-item">
        <span class="cu-nav-icon">⚙</span>
        <span>Settings</span>
    </a>

</nav>

        <!-- LOGOUT -->

        <div class="admin-logout">

            <a href="../Login.aspx">

                <span>↪</span>

                <span>Logout</span>

            </a>

        </div>

    </aside>


    <!-- =====================================================
         MAIN CONTENT
    ====================================================== -->

    <main class="admin-main">


        <!-- TOP HEADER -->

        <header class="admin-topbar">

            <div class="admin-page-title">

                <h1>
                    Dashboard
                </h1>

            </div>


            <div class="admin-user">

                <div class="admin-user-avatar">
                    ♟
                </div>

                <div class="admin-user-details">

                    <strong>
                        Chirag
                    </strong>

                    <span>
                        Admin
                    </span>

                </div>

            </div>

        </header>


        <!-- =================================================
             CONTENT
        ================================================== -->

        <section class="admin-content">


            <!-- STATISTICS -->

            <div class="admin-stat-grid">


                <!-- TOTAL BOOKINGS -->

                <div class="admin-stat-card">

                    <div class="admin-stat-header">

                        <span>
                            Total Bookings
                        </span>

                        <div class="admin-stat-icon">
                            ▣
                        </div>

                    </div>

                    <div class="admin-stat-number">
                        1,248
                    </div>

                </div>


                <!-- REVENUE -->

                <div class="admin-stat-card">

                    <div class="admin-stat-header">

                        <span>
                            Revenue
                        </span>

                        <div class="admin-stat-icon">
                            ₹
                        </div>

                    </div>

                    <div class="admin-stat-number">
                        ₹50,45,450
                    </div>

                </div>


                <!-- ACTIVE VEHICLES -->

                <div class="admin-stat-card">

                    <div class="admin-stat-header">

                        <span>
                            Active Vehicles
                        </span>

                        <div class="admin-stat-icon">
                            ▣
                        </div>

                    </div>

                    <div class="admin-stat-number">
                        32
                    </div>

                </div>


                <!-- ACTIVE DRIVERS -->

                <div class="admin-stat-card">

                    <div class="admin-stat-header">

                        <span>
                            Active Drivers
                        </span>

                        <div class="admin-stat-icon">
                            ♧
                        </div>

                    </div>

                    <div class="admin-stat-number">
                        35
                    </div>

                </div>

            </div>


            <!-- =================================================
                 RECENT BOOKINGS
            ================================================== -->

            <div class="admin-bookings-card">

                <div class="admin-section-title">

                    <h2>
                        Recent Bookings
                    </h2>

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

                        </Columns>

                    </asp:GridView>

                </div>

            </div>


        </section>

    </main>

</div>

</form>

</body>

</html>