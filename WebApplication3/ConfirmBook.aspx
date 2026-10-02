<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="BookingSuccess.aspx.cs"
    Inherits="WebApplication3.BookingSuccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Booking Confirmed</title>

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
            width: 780px;
            height: 560px;

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
            width: 140px;

            background: #1d2a3d;

            color: white;

            display: flex;
            flex-direction: column;
        }


        .logo {
            height: 50px;

            display: flex;
            align-items: center;

            padding-left: 17px;

            font-size: 12px;
            font-weight: bold;
        }


        .logo-icon {
            width: 18px;
            height: 18px;

            background: #2868ed;

            border-radius: 4px;

            margin-right: 7px;
        }


        /* =========================
           NAVIGATION
        ========================= */

        .navigation {
            padding: 3px 8px;
        }


        .nav-item {
            height: 29px;

            margin-bottom: 3px;

            border-radius: 5px;

            display: flex;
            align-items: center;

            padding-left: 10px;

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


        /* =========================
           LOGOUT
        ========================= */

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
           MAIN
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
            height: 40px;

            background: white;

            border-bottom: 1px solid #e1e6ec;

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
            width: 23px;
            height: 23px;

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
           CONTENT
        ========================= */

        .content {
            padding: 14px 18px;
        }


        /* =========================
           STEPPER
        ========================= */

        .stepper {
            display: flex;

            align-items: center;

            height: 27px;

            margin-bottom: 12px;

            color: #2868ed;

            font-size: 8px;

            border-bottom: 1px solid #e2e7ed;
        }


        .step {
            display: flex;

            align-items: center;
        }


        .step-number {
            width: 14px;
            height: 14px;

            border-radius: 50%;

            display: flex;

            align-items: center;
            justify-content: center;

            margin-right: 5px;

            background: #dfeeff;

            color: #2868ed;

            font-size: 7px;
        }


        .arrow {
            margin: 0 13px;

            color: #738197;

            font-size: 10px;
        }


        /* =========================
           SUCCESS CARD
        ========================= */

        .success-card {
            background: white;

            border: 1px solid #e1e6ec;

            border-radius: 7px;

            min-height: 450px;

            padding: 17px;
        }


        /* =========================
           SUCCESS AREA
        ========================= */

        .success-content {
            width: 392px;

            margin: 0 auto;

            text-align: center;
        }


        .success-icon {
            width: 34px;
            height: 34px;

            border-radius: 50%;

            background: #d9f9ec;

            color: #19b878;

            display: flex;

            align-items: center;
            justify-content: center;

            margin: 0 auto 10px;

            font-size: 18px;

            font-weight: bold;
        }


        .success-title {
            font-size: 17px;

            color: #172033;

            font-weight: 700;

            margin-bottom: 5px;
        }


        .success-description {
            font-size: 8px;

            color: #8a96a8;

            margin-bottom: 11px;
        }


        /* =========================
           BOOKING INFO
        ========================= */

        .booking-info {
            height: 40px;

            background: #f8fafc;

            border: 1px solid #e0e6ed;

            border-radius: 5px;

            display: grid;

            grid-template-columns: 1fr 1fr 1.25fr;

            margin-bottom: 13px;
        }


        .booking-item {
            display: flex;

            flex-direction: column;

            justify-content: center;

            align-items: center;

            border-right: 1px solid #e3e7ec;
        }


        .booking-item:last-child {
            border-right: none;
        }


        .booking-label {
            font-size: 5px;

            color: #7b899c;

            text-transform: uppercase;

            margin-bottom: 4px;
        }


        .booking-value {
            font-size: 7px;

            color: #172033;

            font-weight: 700;
        }


        .confirmed {
            color: #13a96d;

            background: #d9f9eb;

            padding: 3px 8px;

            border-radius: 10px;

            font-size: 6px;
        }


        /* =========================
           SUMMARY
        ========================= */

        .summary-card {
            border: 1px solid #e0e6ed;

            border-radius: 5px;

            padding: 11px;

            text-align: left;

            margin-bottom: 11px;
        }


        .summary-title {
            font-size: 8px;

            color: #172033;

            font-weight: 700;

            margin-bottom: 7px;
        }


        .summary-row {
            min-height: 23px;

            border-bottom: 1px solid #edf0f3;

            display: flex;

            align-items: center;

            justify-content: space-between;
        }


        .summary-row:last-child {
            border-bottom: none;
        }


        .summary-label {
            color: #63738a;

            font-size: 7px;
        }


        .summary-value {
            color: #202c3e;

            font-size: 7px;

            font-weight: 600;

            text-align: right;
        }


        .cost-row .summary-label {
            color: #2165dc;

            font-weight: 600;
        }


        .cost-row .summary-value {
            color: #2165dc;

            font-size: 15px;

            font-weight: 700;
        }


        /* =========================
           BUTTONS
        ========================= */

        .button-row {
            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 8px;
        }


        .action-button {
            height: 26px;

            border-radius: 5px;

            font-size: 7px;

            font-weight: 600;

            cursor: pointer;
        }


        .another-button {
            background: white;

            border: 1px solid #dfe5ec;

            color: #65758b;
        }


        .bookings-button {
            background: #2868ed;

            border: none;

            color: white;
        }


        .another-button:hover {
            background: #f5f7fa;
        }


        .bookings-button:hover {
            background: #1e59d0;
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

                min-height: 100vh;

                height: auto;

                margin: 0;

                border: none;
            }
        }


        @media (max-width: 600px) {

            .sidebar {
                display: none;
            }

            .success-content {
                width: 100%;
            }

            .booking-info {
                grid-template-columns: 1fr;
                height: auto;
            }

            .booking-item {
                padding: 8px;
                border-right: none;
                border-bottom: 1px solid #e3e7ec;
            }

            .button-row {
                grid-template-columns: 1fr;
            }

            .content {
                padding: 12px;
            }

        }

    </style>

</head>


<body>

<form id="form1" runat="server">

    <div class="dashboard-container">


        <!-- =========================
             SIDEBAR
        ========================= -->

        <aside class="sidebar">


            <div class="logo">

                <span class="logo-icon"></span>

                <span>Transpo</span>

            </div>


            <nav class="navigation">


                <a href="Dashboard.aspx"
                   class="nav-item">

                    <span class="nav-icon">▦</span>

                    Dashboard

                </a>


                <a href="BookTransportation.aspx"
                   class="nav-item active">

                    <span class="nav-icon">♧</span>

                    Book Transportation

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


            <div class="logout">

                <a href="Login.aspx">
                    ↪ &nbsp; Logout
                </a>

            </div>


        </aside>


        <!-- =========================
             MAIN CONTENT
        ========================= -->

        <main class="main-content">


            <!-- TOP BAR -->

            <header class="topbar">

                <div class="page-title">
                    Book Transportation
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


                <!-- =========================
                     STEPPER
                ========================= -->

                <div class="stepper">


                    <div class="step">

                        <span class="step-number">
                            ✓
                        </span>

                        <span>
                            Route Details
                        </span>

                    </div>


                    <span class="arrow">
                        →
                    </span>


                    <div class="step">

                        <span class="step-number">
                            ✓
                        </span>

                        <span>
                            Load Details
                        </span>

                    </div>


                    <span class="arrow">
                        →
                    </span>


                    <div class="step">

                        <span class="step-number">
                            ✓
                        </span>

                        <span>
                            Review &amp; Confirm
                        </span>

                    </div>


                </div>


                <!-- =========================
                     SUCCESS CARD
                ========================= -->

                <div class="success-card">


                    <div class="success-content">


                        <!-- SUCCESS ICON -->

                        <div class="success-icon">
                            ✓
                        </div>


                        <!-- TITLE -->

                        <h1 class="success-title">
                            Booking Confirmed!
                        </h1>


                        <p class="success-description">
                            Your transportation has been successfully booked.
                        </p>


                        <!-- BOOKING INFORMATION -->

                        <div class="booking-info">


                            <div class="booking-item">

                                <span class="booking-label">
                                    Booking ID
                                </span>

                                <span
                                    class="booking-value"
                                    id="lblBookingId"
                                    runat="server">

                                    BK-2026-08174

                                </span>

                            </div>


                            <div class="booking-item">

                                <span class="booking-label">
                                    Status
                                </span>

                                <span class="confirmed">
                                    Confirmed
                                </span>

                            </div>


                            <div class="booking-item">

                                <span class="booking-label">
                                    Estimated Pickup
                                </span>

                                <span
                                    class="booking-value"
                                    id="lblPickupDate"
                                    runat="server">

                                    Monday, 17 August 2026

                                </span>

                            </div>


                        </div>


                        <!-- SUMMARY -->

                        <div class="summary-card">


                            <div class="summary-title">
                                Booking Summary Details
                            </div>


                            <!-- ROUTE -->

                            <div class="summary-row">

                                <span class="summary-label">
                                    ◉ &nbsp; Route Path
                                </span>

                                <span
                                    class="summary-value"
                                    id="lblRoute"
                                    runat="server">

                                    Rajkot, Gujarat → Baroda, Gujarat

                                </span>

                            </div>


                            <!-- VEHICLE -->

                            <div class="summary-row">

                                <span class="summary-label">
                                    ♧ &nbsp; Vehicle Type
                                </span>

                                <span
                                    class="summary-value"
                                    id="lblVehicle"
                                    runat="server">

                                    Medium Truck (6-Wheeler)

                                </span>

                            </div>


                            <!-- LOAD -->

                            <div class="summary-row">

                                <span class="summary-label">
                                    ◉ &nbsp; Load Specifications
                                </span>

                                <span
                                    class="summary-value"
                                    id="lblLoad"
                                    runat="server">

                                    12 Packages (850 kg Total)

                                </span>

                            </div>


                            <!-- COST -->

                            <div class="summary-row cost-row">

                                <span class="summary-label">
                                    Final Estimated Cost
                                </span>

                                <span class="summary-value">
                                    ₹12,500
                                </span>

                            </div>


                        </div>


                        <!-- BUTTONS -->

                        <div class="button-row">


                            <asp:Button
                                ID="btnBookAnother"
                                runat="server"
                                Text="Book Another"
                                CssClass="action-button another-button"
                                OnClick="btnBookAnother_Click" />


                            <asp:Button
                                ID="btnMyBookings"
                                runat="server"
                                Text="View My Bookings"
                                CssClass="action-button bookings-button"
                                OnClick="btnMyBookings_Click" />


                        </div>


                    </div>

                </div>

            </section>

        </main>

    </div>

</form>

</body>

</html>