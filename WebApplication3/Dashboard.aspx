<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="WebApplication3.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Dashboard</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #202020;
            min-height: 100vh;
        }

        /* =========================
           MAIN CONTAINER
        ========================= */

        .dashboard-container {
            width: 850px;
            height: 605px;

            margin: 30px auto;

            background: #f7f9fb;

            display: flex;

            overflow: hidden;

            border: 2px solid #0787e8;
        }


        /* =========================
           SIDEBAR
        ========================= */

        .sidebar {
            width: 153px;

            background: #1d2a3d;

            color: white;

            display: flex;
            flex-direction: column;
        }


        /* LOGO */

        .logo {
            height: 50px;

            display: flex;
            align-items: center;

            padding-left: 22px;

            font-size: 12px;
            font-weight: bold;
        }


        .logo-icon {
            width: 11px;
            height: 11px;

            background: white;

            margin-right: 10px;
        }


        /* NAVIGATION */

        .navigation {
            padding: 3px 10px;
        }


        .nav-item {
            height: 29px;

            margin-bottom: 3px;

            border-radius: 5px;

            display: flex;
            align-items: center;

            padding-left: 12px;

            color: #aeb9c9;

            text-decoration: none;

            font-size: 9px;
        }


        .nav-icon {
            width: 17px;

            font-size: 10px;

            margin-right: 5px;

            text-align: center;
        }


        .nav-item:hover {
            background: #263a56;
            color: white;
        }


        .nav-item.active {
            background: #2868ed;
            color: white;
        }


        /* LOGOUT */

        .logout {
            margin-top: auto;

            padding: 0 20px 22px;
        }


        .logout a {
            color: #ff4d55;

            font-size: 9px;

            text-decoration: none;
        }


        /* =========================
           MAIN CONTENT
        ========================= */

        .main-content {
            flex: 1;

            background: #f7f9fb;

            min-width: 0;
        }


        /* =========================
           TOP BAR
        ========================= */

        .topbar {
            height: 62px;

            background: white;

            border-bottom: 1px solid #e5e9ef;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 18px;
        }


        .page-title {
            font-size: 13px;

            font-weight: 700;

            color: #172033;
        }


        /* USER */

        .user-info {
            display: flex;

            align-items: center;

            gap: 7px;
        }


        .profile-image {
            width: 24px;
            height: 24px;

            border-radius: 50%;

            background: #dce3e9;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 10px;
        }


        .user-name {
            font-size: 8px;

            font-weight: 700;

            color: #1c2738;
        }


        .user-role {
            font-size: 7px;

            color: #7d899a;

            margin-top: 2px;
        }


        /* =========================
           CONTENT AREA
        ========================= */

        .content {
            padding: 28px 17px;
        }


        /* WELCOME */

        .welcome-title {
            font-size: 14px;

            color: #172033;

            margin-bottom: 4px;
        }


        .welcome-description {
            font-size: 8px;

            color: #7c8797;

            margin-bottom: 19px;
        }


        /* =========================
           STATISTICS
        ========================= */

        .stats {
            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 13px;

            margin-bottom: 18px;
        }


        .stat-card {
            height: 68px;

            background: white;

            border: 1px solid #e1e6ec;

            border-radius: 6px;

            padding: 13px;
        }


        .stat-title {
            font-size: 7px;

            color: #657287;

            margin-bottom: 8px;
        }


        .stat-number {
            font-size: 17px;

            font-weight: 700;

            color: #172033;
        }


        .stat-number.red {
            color: #ef4141;
        }


        /* =========================
           LOWER SECTION
        ========================= */

        .lower-section {
            display: grid;

            grid-template-columns: 2.2fr 1fr;

            gap: 16px;
        }


        /* =========================
           RECENT BOOKINGS
        ========================= */

        .booking-card {
            background: white;

            border: 1px solid #e1e6ec;

            border-radius: 7px;

            overflow: hidden;
        }


        .card-heading {
            height: 43px;

            padding: 0 13px;

            display: flex;

            align-items: center;

            border-bottom: 1px solid #e8ecf1;

            font-size: 10px;

            font-weight: 700;

            color: #172033;
        }


        /* TABLE */

        .booking-table {
            width: 100%;

            border-collapse: collapse;

            table-layout: fixed;
        }


        .booking-table th {
            height: 32px;

            text-align: left;

            padding: 0 12px;

            font-size: 6px;

            font-weight: 600;

            color: #6f7d90;

            background: #fafbfd;

            text-transform: uppercase;
        }


        .booking-table td {
            height: 49px;

            padding: 0 12px;

            font-size: 7px;

            color: #263244;

            border-top: 1px solid #edf0f3;

            vertical-align: middle;
        }


        .booking-id {
            font-weight: 700;
        }


        /* STATUS */

        .status {
            display: inline-block;

            padding: 4px 7px;

            border-radius: 10px;

            font-size: 6px;
        }


        .status.active {
            background: #eaf2ff;

            color: #1f67d5;
        }


        .status.completed {
            background: #e9fbf0;

            color: #12a150;
        }


        .status.pending {
            background: #fff3e8;

            color: #ed7b20;
        }


        .details {
            color: #0755bd;

            text-decoration: none;

            font-size: 7px;

            font-weight: 600;
        }


        /* =========================
           UPCOMING TRIP
        ========================= */

        .trip-card {
            background: white;

            border: 1px solid #e1e6ec;

            border-radius: 7px;

            padding: 13px;

            height: 133px;
        }


        .trip-heading {
            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 12px;
        }


        .trip-title {
            font-size: 9px;

            font-weight: 700;

            color: #172033;
        }


        .active-label {
            font-size: 5px;

            color: #2265d0;

            background: #edf4ff;

            padding: 3px 6px;

            border-radius: 7px;
        }


        .trip-row {
            display: flex;

            align-items: center;

            margin-bottom: 9px;
        }


        .trip-icon {
            width: 17px;

            color: #63738a;

            font-size: 9px;
        }


        .trip-main {
            font-size: 7px;

            font-weight: 600;

            color: #253044;
        }


        .trip-sub {
            font-size: 5px;

            color: #8a95a5;

            margin-top: 2px;
        }


        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 800px) {

            body {
                background: #f7f9fb;
            }

            .dashboard-container {
                width: 100%;
                height: 100vh;

                margin: 0;

                border: none;
            }

            .sidebar {
                width: 140px;
            }

            .stats {
                grid-template-columns: repeat(2, 1fr);
            }

        }


        @media (max-width: 600px) {

            .sidebar {
                display: none;
            }

            .lower-section {
                grid-template-columns: 1fr;
            }

            .dashboard-container {
                height: auto;

                min-height: 100vh;
            }

            .content {
                padding: 20px;
            }

        }

    </style>

</head>


<body>

<form id="form1" runat="server">

    <div class="dashboard-container">


        <!-- =================================
             SIDEBAR
        ================================== -->

        <aside class="sidebar">


            <!-- LOGO -->

            <div class="logo">

                <span class="logo-icon"></span>

                <span>Transpo</span>

            </div>


            <!-- NAVIGATION -->

            <nav class="navigation">


                <a href="Dashboard.aspx"
                   class="nav-item active">

                    <span class="nav-icon">▦</span>

                    Dashboard

                </a>


                <a href="Booking.aspx"
                   class="nav-item">

                    <span class="nav-icon">♧</span>

                    Track Transportation

                </a>


                <a href="Bookings.aspx"
                   class="nav-item">

                    <span class="nav-icon">▤</span>

                    My Bookings

                </a>


                <a href="Payments.aspx"
                   class="nav-item">

                    <span class="nav-icon">▭</span>

                    Payments

                </a>


                <a href="Address.aspx"
                   class="nav-item">

                    <span class="nav-icon">□</span>

                    Address Book

                </a>


                <a href="Profile.aspx"
                   class="nav-item">

                    <span class="nav-icon">♙</span>

                    Profile

                </a>


            </nav>


            <!-- LOGOUT -->

            <div class="logout">

                <a href="Login.aspx">
                    ↪ &nbsp; Logout
                </a>

            </div>


        </aside>


        <!-- =================================
             MAIN
        ================================== -->

        <main class="main-content">


            <!-- TOP BAR -->

            <header class="topbar">

                <div class="page-title">
                    Dashboard
                </div>


                <div class="user-info">

                    <div class="profile-image">
                        👤
                    </div>

                    <div>

                        <div class="user-name">
                            Nandan Nasit
                        </div>

                        <div class="user-role">
                            Standard Customer
                        </div>

                    </div>

                </div>

            </header>


            <!-- CONTENT -->

            <section class="content">


                <!-- WELCOME -->

                <h1 class="welcome-title">
                    Welcome back, Nandan!
                </h1>

                <p class="welcome-description">
                    Manage your transportation bookings and deliveries.
                </p>


                <!-- =========================
                     STAT CARDS
                ========================== -->

                <div class="stats">


                    <div class="stat-card">

                        <div class="stat-title">
                            Active Bookings
                        </div>

                        <div class="stat-number">
                            3
                        </div>

                    </div>


                    <div class="stat-card">

                        <div class="stat-title">
                            Upcoming Trips
                        </div>

                        <div class="stat-number">
                            5
                        </div>

                    </div>


                    <div class="stat-card">

                        <div class="stat-title">
                            Completed Trips
                        </div>

                        <div class="stat-number">
                            12
                        </div>

                    </div>


                    <div class="stat-card">

                        <div class="stat-title">
                            Pending Payments
                        </div>

                        <div class="stat-number red">
                            1
                        </div>

                    </div>


                </div>


                <!-- =========================
                     LOWER SECTION
                ========================== -->

                <div class="lower-section">


                    <!-- RECENT BOOKINGS -->

                    <div class="booking-card">


                        <div class="card-heading">
                            Recent Bookings
                        </div>


                        <table class="booking-table">

                            <thead>

                                <tr>

                                    <th>Booking<br />ID</th>

                                    <th>Route</th>

                                    <th>Vehicle<br />Type</th>

                                    <th>Date</th>

                                    <th>Status</th>

                                    <th>Action</th>

                                </tr>

                            </thead>


                            <tbody>


                                <tr>

                                    <td class="booking-id">
                                        #BK-8291
                                    </td>

                                    <td>
                                        Rajkot → Baroda
                                    </td>

                                    <td>
                                        Medium<br />Truck
                                    </td>

                                    <td>
                                        17 Aug<br />2026
                                    </td>

                                    <td>

                                        <span class="status active">
                                            Active
                                        </span>

                                    </td>

                                    <td>

                                        <a href="#" class="details">
                                            Details
                                        </a>

                                    </td>

                                </tr>


                                <tr>

                                    <td class="booking-id">
                                        #BK-7542
                                    </td>

                                    <td>
                                        Rajkot →<br />Ahmedabad
                                    </td>

                                    <td>
                                        Small<br />Pickup
                                    </td>

                                    <td>
                                        15 Aug<br />2026
                                    </td>

                                    <td>

                                        <span class="status completed">
                                            Completed
                                        </span>

                                    </td>

                                    <td>

                                        <a href="#" class="details">
                                            Details
                                        </a>

                                    </td>

                                </tr>


                                <tr>

                                    <td class="booking-id">
                                        #BK-6120
                                    </td>

                                    <td>
                                        Ahmedabad →<br />Mumbai
                                    </td>

                                    <td>
                                        Heavy<br />Truck
                                    </td>

                                    <td>
                                        20 Aug<br />2026
                                    </td>

                                    <td>

                                        <span class="status pending">
                                            Pending
                                        </span>

                                    </td>

                                    <td>

                                        <a href="#" class="details">
                                            Details
                                        </a>

                                    </td>

                                </tr>


                            </tbody>

                        </table>

                    </div>


                    <!-- =========================
                         UPCOMING TRIP
                    ========================== -->

                    <div class="trip-card">


                        <div class="trip-heading">

                            <span class="trip-title">
                                Upcoming Trip
                            </span>

                            <span class="active-label">
                                ACTIVE
                            </span>

                        </div>


                        <!-- ROUTE -->

                        <div class="trip-row">

                            <div class="trip-icon">
                                ♟
                            </div>

                            <div>

                                <div class="trip-main">
                                    Rajkot → Baroda
                                </div>

                                <div class="trip-sub">
                                    Scheduled Route
                                </div>

                            </div>

                        </div>


                        <!-- VEHICLE -->

                        <div class="trip-row">

                            <div class="trip-icon">
                                ♧
                            </div>

                            <div>

                                <div class="trip-main">
                                    Medium Truck
                                </div>

                                <div class="trip-sub">
                                    Vehicle Type
                                </div>

                            </div>

                        </div>


                        <!-- DATE -->

                        <div class="trip-row">

                            <div class="trip-icon">
                                □
                            </div>

                            <div>

                                <div class="trip-main">
                                    Monday, 17 August 2026
                                </div>

                                <div class="trip-sub">
                                    Preferred Date
                                </div>

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