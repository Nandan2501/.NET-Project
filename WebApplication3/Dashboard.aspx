<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="WebApplication3.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Dashboard</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="CSS/style.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

<div class="dash-layout">

    <!-- SIDEBAR -->
    <aside class="dash-sidebar">

        <div class="dash-logo">
            <div class="dash-logo-icon"></div>
            <span>Transpo</span>
        </div>

        <nav class="dash-navigation">

            <a href="Dashboard.aspx"
               class="dash-nav-item active">
                <span class="dash-nav-icon">▦</span>
                <span>Dashboard</span>
            </a>

            <a href="BookTransportation.aspx"
               class="dash-nav-item">
                <span class="dash-nav-icon">♧</span>
                <span>Book Transportation</span>
            </a>

            <a href="Bookings.aspx"
               class="dash-nav-item">
                <span class="dash-nav-icon">☷</span>
                <span>My Bookings</span>
            </a>

            <a href="Payments.aspx"
               class="dash-nav-item">
                <span class="dash-nav-icon">▱</span>
                <span>Payments</span>
            </a>

            <a href="AddressBook.aspx"
               class="dash-nav-item">
                <span class="dash-nav-icon">▣</span>
                <span>Address Book</span>
            </a>

            <a href="Profile.aspx"
               class="dash-nav-item">
                <span class="dash-nav-icon">♙</span>
                <span>Profile</span>
            </a>

        </nav>

        <a href="Login.aspx" class="dash-logout">
            ↪ &nbsp; Logout
        </a>

    </aside>


    <!-- MAIN -->
    <main class="dash-main">

        <!-- TOPBAR -->
        <header class="dash-topbar">

            <h1>Dashboard</h1>

            <div class="dash-user">

                <div class="dash-user-avatar">
                    👤
                </div>

                <div class="dash-user-info">
                    <strong>Nandan Nasit</strong>
                    <span>Standard Customer</span>
                </div>

            </div>

        </header>


        <!-- CONTENT -->
        <section class="dash-content">

            <!-- WELCOME -->
            <div class="dash-welcome">

                <h2>Welcome back, Nandan!</h2>

                <p>
                    Manage your transportation bookings and deliveries.
                </p>

            </div>


            <!-- STAT CARDS -->
            <div class="dash-stats">

                <div class="dash-stat-card">

                    <span>Active Bookings</span>

                    <strong>3</strong>

                </div>


                <div class="dash-stat-card">

                    <span>Upcoming Trips</span>

                    <strong>5</strong>

                </div>


                <div class="dash-stat-card">

                    <span>Completed Trips</span>

                    <strong>12</strong>

                </div>


                <div class="dash-stat-card pending">

                    <span>Pending Payments</span>

                    <strong>1</strong>

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

                            <div>
                                BOOKING<br />ID
                            </div>

                            <div>
                                ROUTE
                            </div>

                            <div>
                                VEHICLE<br />TYPE
                            </div>

                            <div>
                                DATE
                            </div>

                            <div>
                                STATUS
                            </div>

                            <div>
                                ACTION
                            </div>

                        </div>


                        <!-- BOOKING 1 -->

                        <div class="dash-table-row">

                            <div class="dash-booking-id">
                                #BK-8291
                            </div>

                            <div>
                                Rajkot → Baroda
                            </div>

                            <div>
                                Medium<br />Truck
                            </div>

                            <div>
                                17 Aug<br />2026
                            </div>

                            <div>
                                <span class="dash-status active-status">
                                    Active
                                </span>
                            </div>

                            <div>
                                <a href="BookingDetails.aspx">
                                    Details
                                </a>
                            </div>

                        </div>


                        <!-- BOOKING 2 -->

                        <div class="dash-table-row">

                            <div class="dash-booking-id">
                                #BK-7542
                            </div>

                            <div>
                                Rajkot →<br />Ahmedabad
                            </div>

                            <div>
                                Small<br />Pickup
                            </div>

                            <div>
                                15 Aug<br />2026
                            </div>

                            <div>
                                <span class="dash-status completed-status">
                                    Completed
                                </span>
                            </div>

                            <div>
                                <a href="BookingDetails.aspx">
                                    Details
                                </a>
                            </div>

                        </div>


                        <!-- BOOKING 3 -->

                        <div class="dash-table-row">

                            <div class="dash-booking-id">
                                #BK-6120
                            </div>

                            <div>
                                Ahmedabad →<br />Mumbai
                            </div>

                            <div>
                                Heavy<br />Truck
                            </div>

                            <div>
                                20 Aug<br />2026
                            </div>

                            <div>
                                <span class="dash-status pending-status">
                                    Pending
                                </span>
                            </div>

                            <div>
                                <a href="BookingDetails.aspx">
                                    Details
                                </a>
                            </div>

                        </div>

                    </div>

                </div>



                <!-- UPCOMING TRIP -->

                <div class="dash-upcoming-card">

                    <div class="dash-upcoming-header">

                        <h3>
                            Upcoming Trip
                        </h3>

                        <span class="dash-active-badge">
                            ACTIVE
                        </span>

                    </div>


                    <div class="dash-trip-item">

                        <div class="dash-trip-icon">
                            ⌖
                        </div>

                        <div>

                            <strong>
                                Rajkot → Baroda
                            </strong>

                            <span>
                                Scheduled Route
                            </span>

                        </div>

                    </div>


                    <div class="dash-trip-item">

                        <div class="dash-trip-icon">
                            ♧
                        </div>

                        <div>

                            <strong>
                                Medium Truck
                            </strong>

                            <span>
                                Vehicle Type
                            </span>

                        </div>

                    </div>


                    <div class="dash-trip-item">

                        <div class="dash-trip-icon">
                            ▣
                        </div>

                        <div>

                            <strong>
                                Monday, 17 Aug 2026
                            </strong>

                            <span>
                                Preferred Date
                            </span>

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