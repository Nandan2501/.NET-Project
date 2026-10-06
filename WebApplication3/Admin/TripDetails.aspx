<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="TripDetails.aspx.cs"
    Inherits="WebApplication3.TripDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trip Details</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <!-- Common CSS -->
    <link href="../CSS/style.css" rel="stylesheet" />

   
</head>

<body>

<form id="form1" runat="server">

    <div class="td-layout">

        <!-- =====================================================
             SIDEBAR
        ====================================================== -->

        <aside class="td-sidebar">

            <div class="td-logo">
                <div class="td-logo-icon">▣</div>
                <span>Transpo</span>
            </div>

            <nav class="td-navigation">

                <a href="Dashboard.aspx" class="td-nav-item">
                    <span class="td-nav-icon">▦</span>
                    <span>Dashboard</span>
                </a>

                <a href="Vehicles.aspx" class="td-nav-item active">
                    <span class="td-nav-icon">▣</span>
                    <span>Vehicles</span>
                </a>

                <a href="Drivers.aspx" class="td-nav-item">
                    <span class="td-nav-icon">♧</span>
                    <span>Drivers</span>
                </a>

                <a href="Customers.aspx" class="td-nav-item">
                    <span class="td-nav-icon">♙</span>
                    <span>Customers</span>
                </a>

                <a href="Payments.aspx" class="td-nav-item">
                    <span class="td-nav-icon">▱</span>
                    <span>Payments</span>
                </a>

                <a href="Reports.aspx" class="td-nav-item">
                    <span class="td-nav-icon">▥</span>
                    <span>Reports</span>
                </a>

                <a href="Settings.aspx" class="td-nav-item">
                    <span class="td-nav-icon">⚙</span>
                    <span>Settings</span>
                </a>

            </nav>

            <div class="td-logout">
                <a href="Login.aspx">↪ Logout</a>
            </div>

        </aside>


        <!-- =====================================================
             MAIN AREA
        ====================================================== -->

        <main class="td-main">

            <!-- TOPBAR -->

            <header class="td-topbar">

                <h1>Trip Details</h1>

                <div class="td-admin-profile">

                    <div class="td-admin-avatar">
                        👤
                    </div>

                    <div class="td-admin-info">
                        <strong>Chirag</strong>
                        <span>Admin</span>
                    </div>

                </div>

            </header>


            <!-- PAGE CONTENT -->

            <section class="td-content">

                <!-- =================================================
                     BOOKING HEADER
                ================================================== -->

                <div class="td-booking-header">

                    <div class="td-booking-info">

                        <div class="td-booking-item">

                            <span class="td-small-label">
                                BOOKING ID
                            </span>

                            <strong class="td-booking-id">
                                #TRP-1048
                            </strong>

                        </div>


                        <div class="td-header-divider"></div>


                        <div class="td-booking-item">

                            <span class="td-small-label">
                                CUSTOMER
                            </span>

                            <strong>
                                raj patel
                            </strong>

                        </div>


                        <div class="td-header-divider"></div>


                        <div class="td-booking-item td-date-item">

                            <span class="td-small-label">
                                TRIP DATE
                            </span>

                            <strong>
                                24 Oct 2026, 10:00 AM
                            </strong>

                        </div>

                    </div>


                    <span class="td-cancelled">
                        Cancelled
                    </span>

                </div>


                <!-- =================================================
                     TWO COLUMN SECTION
                ================================================== -->

                <div class="td-grid">


                    <!-- LEFT CARD -->

                    <div class="td-card td-crew-card">

                        <h2>
                            Asset &amp; Crew Allocation
                        </h2>


                        <!-- Vehicle -->

                        <div class="td-vehicle-row">

                            <div class="td-vehicle-icon">
                                🚚
                            </div>

                            <div class="td-row-information">

                                <strong>
                                    Mahindra Bolero Pickup
                                </strong>

                                <span>
                                    Reg No: GJ-01-XX-9876
                                </span>

                            </div>

                        </div>


                        <div class="td-horizontal-line"></div>


                        <!-- Driver -->

                        <div class="td-driver-row">

                            <div class="td-driver-avatar">
                                👨
                            </div>

                            <div class="td-row-information">

                                <strong>
                                    abhay
                                </strong>

                                <span>
                                    License: gj-381029482
                                </span>

                            </div>

                        </div>

                    </div>


                    <!-- RIGHT SIDE -->

                    <div class="td-right-column">


                        <!-- ROUTE -->

                        <div class="td-card td-route-card">

                            <h2>
                                Route Logistics
                            </h2>


                            <div class="td-route-row">

                                <div class="td-route-dot pickup"></div>

                                <div>

                                    <span class="td-route-label">
                                        PICKUP ADDRESS
                                    </span>

                                    <strong>
                                        Sarkhej, Ahmedabad, Gujarat 380051
                                    </strong>

                                </div>

                            </div>


                            <div class="td-horizontal-line"></div>


                            <div class="td-route-row">

                                <div class="td-route-dot drop"></div>

                                <div>

                                    <span class="td-route-label">
                                        DROP ADDRESS
                                    </span>

                                    <strong>
                                        Adajan, Surat, Gujarat 395009
                                    </strong>

                                </div>

                            </div>

                        </div>


                        <!-- PAYMENT -->

                        <div class="td-card td-payment-card">

                            <h2>
                                Payment Summary
                            </h2>


                            <div class="td-payment-row">

                                <span>
                                    Base Fare
                                </span>

                                <strong>
                                    ₹8000
                                </strong>

                            </div>


                            <div class="td-payment-row">

                                <span>
                                    Tolls &amp; Taxes
                                </span>

                                <strong>
                                    ₹500
                                </strong>

                            </div>


                            <div class="td-horizontal-line"></div>


                            <div class="td-total-row">

                                <strong>
                                    Total Amount
                                </strong>

                                <strong>
                                    ₹8,500
                                </strong>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- =================================================
                     SHIPMENT MILESTONE
                ================================================== -->

                <div class="td-milestone">

                    <h2>
                        Shipment Milestone Tracker
                    </h2>


                    <div class="td-milestone-content">


                        <div class="td-location">

                            <span class="td-location-name">
                                Ahmedabad (Origin)
                            </span>

                            <strong>
                                10:00 AM
                            </strong>

                        </div>


                        <div class="td-arrow">
                            ⟶
                        </div>


                        <div class="td-location">

                            <span class="td-location-name">
                                Surat (Waypoint)
                            </span>

                            <strong>
                                12:45 PM
                            </strong>

                        </div>

                    </div>

                </div>

            </section>

        </main>

    </div>

</form>

</body>
</html>



adadadadada