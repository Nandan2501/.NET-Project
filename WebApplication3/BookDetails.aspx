<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="BookingDetails.aspx.cs"
    Inherits="WebApplication3.BookingDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Booking Details</title>

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
            height: 595px;

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

            padding-left: 22px;

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
            height: 42px;

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
           CONTENT
        ========================= */

        .content {
            padding: 16px 18px;
        }


        /* =========================
           BOOKING HEADER
        ========================= */

        .booking-header {
            height: 30px;

            display: flex;

            align-items: center;

            gap: 10px;

            margin-bottom: 8px;
        }


        .booking-title {
            font-size: 12px;

            font-weight: 700;

            color: #172033;
        }


        .status {
            padding: 3px 8px;

            border-radius: 10px;

            font-size: 6px;

            font-weight: 600;
        }


        .ongoing {
            color: #d78b00;

            background: #fff1cf;
        }


        /* =========================
           INFORMATION CARD
        ========================= */

        .info-card {
            background: white;

            border: 1px solid #e1e6ec;

            border-radius: 7px;

            padding: 12px;

            margin-bottom: 12px;
        }


        .card-title {
            font-size: 9px;

            font-weight: 700;

            color: #172033;

            margin-bottom: 8px;
        }


        .info-row {
            min-height: 19px;

            display: flex;

            align-items: center;

            justify-content: space-between;
        }


        .info-label {
            color: #8190a4;

            font-size: 7px;
        }


        .info-value {
            color: #202c3e;

            font-size: 7px;

            font-weight: 600;

            text-align: right;
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

            .content {
                padding: 12px;
            }

            .info-row {
                min-height: 25px;
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
                   class="nav-item">

                    <span class="nav-icon">♧</span>

                    Book Transportation

                </a>


                <a href="MyBookings.aspx"
                   class="nav-item active">

                    <span class="nav-icon">☷</span>

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
                    Booking Details
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


                <!-- BOOKING HEADER -->

                <div class="booking-header">

                    <span
                        class="booking-title"
                        id="lblBookingTitle"
                        runat="server">

                        Booking #TRP-1004

                    </span>


                    <span
                        class="status ongoing"
                        id="lblStatus"
                        runat="server">

                        Ongoing

                    </span>

                </div>


                <!-- =========================
                     BOOKING INFORMATION
                ========================= -->

                <div class="info-card">

                    <div class="card-title">
                        Booking Information
                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Booking Date
                        </span>

                        <span
                            class="info-value"
                            id="lblBookingDate"
                            runat="server">

                            17 Aug 2026, 10:00 AM

                        </span>

                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Payment Status
                        </span>

                        <span
                            class="info-value"
                            id="lblPaymentStatus"
                            runat="server">

                            Paid

                        </span>

                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Payment Method
                        </span>

                        <span
                            class="info-value"
                            id="lblPaymentMethod"
                            runat="server">

                            Online

                        </span>

                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Total Amount
                        </span>

                        <span
                            class="info-value"
                            id="lblTotalAmount"
                            runat="server">

                            ₹250.00

                        </span>

                    </div>

                </div>


                <!-- =========================
                     LOAD DETAILS
                ========================= -->

                <div class="info-card">

                    <div class="card-title">
                        Load Details
                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Vehicle Type
                        </span>

                        <span
                            class="info-value"
                            id="lblVehicle"
                            runat="server">

                            Medium Truck (6-Wheeler)

                        </span>

                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Load Type
                        </span>

                        <span
                            class="info-value"
                            id="lblLoadType"
                            runat="server">

                            Industrial Raw Material

                        </span>

                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Total Weight
                        </span>

                        <span
                            class="info-value"
                            id="lblWeight"
                            runat="server">

                            4.5 Tons

                        </span>

                    </div>

                </div>


                <!-- =========================
                     CUSTOMER DETAILS
                ========================= -->

                <div class="info-card">

                    <div class="card-title">
                        Customer Details
                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Company Name
                        </span>

                        <span
                            class="info-value"
                            id="lblCompany"
                            runat="server">

                            Lumen Enterprises

                        </span>

                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Contact Person
                        </span>

                        <span
                            class="info-value"
                            id="lblContactPerson"
                            runat="server">

                            Vraj Akbari

                        </span>

                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Email
                        </span>

                        <span
                            class="info-value"
                            id="lblEmail"
                            runat="server">

                            vraj55652@gmail.com

                        </span>

                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Phone
                        </span>

                        <span
                            class="info-value"
                            id="lblPhone"
                            runat="server">

                            +919865745215

                        </span>

                    </div>

                </div>


            </section>

        </main>

    </div>

</form>

</body>

</html>