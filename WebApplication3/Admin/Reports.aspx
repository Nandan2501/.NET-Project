<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Reports.aspx.cs"
    Inherits="WebApplication3.Reports" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Reports & Analytics</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="../CSS/style.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

<div class="rp-layout">

    <!-- ================= SIDEBAR ================= -->

    <aside class="rp-sidebar">

       <div class="admin-brand">

    <div class="brand-icon">
        🚚
    </div>

    <span>Transpo</span>

</div>
        <nav class="rp-navigation">

            <a href="Dashboard.aspx" class="rp-nav-item">
                <span class="rp-nav-icon">▦</span>
                <span>Dashboard</span>
            </a>

            <a href="Vehicle.aspx" class="rp-nav-item">
                <span class="rp-nav-icon">♧</span>
                <span>Vehicles</span>
            </a>

            <a href="Drivers.aspx" class="rp-nav-item">
                <span class="rp-nav-icon">♙</span>
                <span>Drivers</span>
            </a>

            <a href="Customers.aspx" class="rp-nav-item">
                <span class="rp-nav-icon">♙</span>
                <span>Customers</span>
            </a>

            <a href="Payment.aspx" class="rp-nav-item">
                <span class="rp-nav-icon">▱</span>
                <span>Payments</span>
            </a>

            <a href="Reports.aspx" class="rp-nav-item active">
                <span class="rp-nav-icon">▥</span>
                <span>Reports</span>
            </a>

            <a href="Settings.aspx" class="rp-nav-item">
                <span class="rp-nav-icon">⚙</span>
                <span>Settings</span>
            </a>

        </nav>

    </aside>


    <!-- ================= MAIN ================= -->

    <main class="rp-main">

        <!-- TOP BAR -->

        <header class="rp-topbar">

            <h1>Reports &amp; Analytics</h1>

            <div class="rp-admin-profile">

                <div class="rp-top-line"></div>

                <div class="rp-admin-avatar">
                    👤
                </div>

                <div class="rp-admin-info">
                    <strong>Chirag</strong>
                    <span>Admin</span>
                </div>

            </div>

        </header>


        <!-- ================= CONTENT ================= -->

        <section class="rp-content">


            <!-- FILTER BAR -->

            <div class="rp-filter-bar">

                

               

            </div>


            <!-- ================= STATISTICS ================= -->

            <div class="rp-stat-grid">


                <!-- TOTAL BOOKINGS -->

                <div class="rp-stat-card">

                    <div class="rp-stat-top">
                        <span>Total Bookings</span>

                        <div class="rp-stat-icon">
                            ▣
                        </div>
                    </div>

                    <strong class="rp-stat-value">
                        1,248
                    </strong>

                </div>


                <!-- TOTAL REVENUE -->

                <div class="rp-stat-card">

                    <div class="rp-stat-top">
                        <span>Total Revenue</span>

                        <div class="rp-stat-icon">
                            $
                        </div>
                    </div>

                    <strong class="rp-stat-value">
                        ₹50,48,450
                    </strong>

                </div>


                <!-- AVERAGE TRIP -->

                <div class="rp-stat-card">

                    <div class="rp-stat-top">
                        <span>Average Trip Value</span>

                        <div class="rp-stat-icon">
                            ↗
                        </div>
                    </div>

                    <strong class="rp-stat-value">
                        ₹10,450
                    </strong>

                </div>


                <!-- ACTIVE VEHICLES -->

                <div class="rp-stat-card">

                    <div class="rp-stat-top">
                        <span>Active Vehicles</span>

                        <div class="rp-stat-icon">
                            ▣
                        </div>
                    </div>

                    <strong class="rp-stat-value">
                        482
                    </strong>

                </div>


                <!-- TOTAL DRIVERS -->

                <div class="rp-stat-card">

                    <div class="rp-stat-top">
                        <span>Total Drivers</span>

                        <div class="rp-stat-icon">
                            ♙
                        </div>
                    </div>

                    <strong class="rp-stat-value">
                        1,150
                    </strong>

                </div>


                <!-- CUSTOMER SATISFACTION -->

                <div class="rp-stat-card">

                    <div class="rp-stat-top">
                        <span>Customer Satisfaction</span>

                        <div class="rp-stat-icon">
                            ★
                        </div>
                    </div>

                    <strong class="rp-stat-value">
                        4.8/5
                    </strong>

                </div>

            </div>


            <!-- ================= LOWER SECTION ================= -->

            <div class="rp-bottom-grid">


                <!-- TOP PERFORMING DRIVERS -->

                <div class="rp-panel">

                    <div class="rp-panel-header">

                        <h2>Top Performing Drivers</h2>

                        <a href="Drivers.aspx">
                            View All
                        </a>

                    </div>


                    <!-- DRIVER 1 -->

                    <div class="rp-driver-row">

                        <div class="rp-driver-avatar">
                            RK
                        </div>

                        <div class="rp-driver-info">

                            <strong>Rajesh Kumar</strong>

                            <span>ID: DRV-4421</span>

                        </div>

                        <div class="rp-driver-result">

                            <strong>142 Trips</strong>

                            <span>★ 4.9</span>

                        </div>

                    </div>


                    <!-- DRIVER 2 -->

                    <div class="rp-driver-row">

                        <div class="rp-driver-avatar">
                            AS
                        </div>

                        <div class="rp-driver-info">

                            <strong>Ankit Sharma</strong>

                            <span>ID: DRV-4458</span>

                        </div>

                        <div class="rp-driver-result">

                            <strong>138 Trips</strong>

                            <span>★ 4.8</span>

                        </div>

                    </div>


                    <!-- DRIVER 3 -->

                    <div class="rp-driver-row">

                        <div class="rp-driver-avatar">
                            SV
                        </div>

                        <div class="rp-driver-info">

                            <strong>Sunil Verma</strong>

                            <span>ID: DRV-4490</span>

                        </div>

                        <div class="rp-driver-result">

                            <strong>125 Trips</strong>

                            <span>★ 4.7</span>

                        </div>

                    </div>


                    <!-- DRIVER 4 -->

                    <div class="rp-driver-row">

                        <div class="rp-driver-avatar">
                            VS
                        </div>

                        <div class="rp-driver-info">

                            <strong>Vikram Singh</strong>

                            <span>ID: DRV-4501</span>

                        </div>

                        <div class="rp-driver-result">

                            <strong>118 Trips</strong>

                            <span>★ 4.8</span>

                        </div>

                    </div>

                </div>


                <!-- RECENT REPORTS -->

                <div class="rp-panel">

                    <div class="rp-panel-header">

                        <h2>Recent Reports</h2>

                        <a href="#">
                            Refresh
                        </a>

                    </div>


                    <div class="rp-report-head">

                        <span>REPORT NAME</span>
                        <span>DATE</span>
                        <span>STATUS</span>
                        <span>ACTION</span>

                    </div>


                    <!-- REPORT 1 -->

                    <div class="rp-report-row">

                        <div class="rp-report-name">

                            <strong>Monthly_Revenue_Oct</strong>

                            <span>Excel Format</span>

                        </div>

                        <div class="rp-report-date">
                            Nov 01,<br />
                            2023
                        </div>

                        <div>
                            <span class="rp-status completed">
                                COMPLETED
                            </span>
                        </div>

                        <div class="rp-download">
                            ☁
                        </div>

                    </div>


                    <!-- REPORT 2 -->

                    <div class="rp-report-row">

                        <div class="rp-report-name">

                            <strong>Driver_Payouts_W44</strong>

                            <span>PDF Format</span>

                        </div>

                        <div class="rp-report-date">
                            Oct 30,<br />
                            2023
                        </div>

                        <div>
                            <span class="rp-status completed">
                                COMPLETED
                            </span>
                        </div>

                        <div class="rp-download">
                            ☁
                        </div>

                    </div>


                    <!-- REPORT 3 -->

                    <div class="rp-report-row">

                        <div class="rp-report-name">

                            <strong>Customer_Retention_Q3</strong>

                            <span>CSV Format</span>

                        </div>

                        <div class="rp-report-date">
                            Oct 28,<br />
                            2023
                        </div>

                        <div>
                            <span class="rp-status processing">
                                PROCESSING
                            </span>
                        </div>

                        <div class="rp-download">
                            ◌
                        </div>

                    </div>


                    <!-- REPORT 4 -->

                    <div class="rp-report-row">

                        <div class="rp-report-name">

                            <strong>Fleet_Utilization_Report</strong>

                            <span>Excel Format</span>

                        </div>

                        <div class="rp-report-date">
                            Oct 25,<br />
                            2023
                        </div>

                        <div>
                            <span class="rp-status completed">
                                COMPLETED
                            </span>
                        </div>

                        <div class="rp-download">
                            ☁
                        </div>

                    </div>

                </div>

            </div>

        </section>

    </main>

</div>

</form>

</body>
</html>




