<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ReviewConfirm.aspx.cs"
    Inherits="WebApplication3.ReviewConfirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Review & Confirm</title>

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

        .dashboard-container {
            width: 850px;
            height: 605px;
            margin: 30px auto;
            background: #f7f9fb;
            display: flex;
            overflow: hidden;
            border: 2px solid #0787e8;
        }

        /* SIDEBAR */

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

        .logout {
            margin-top: auto;
            padding: 0 20px 22px;
        }

        .logout a {
            color: #ff4d55;
            font-size: 9px;
            text-decoration: none;
        }

        /* MAIN */

        .main-content {
            flex: 1;
            background: #f7f9fb;
            min-width: 0;
        }

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

        /* CONTENT */

        .content {
            padding: 18px;
        }

        /* STEPPER */

        .stepper {
            display: flex;
            align-items: center;
            height: 28px;
            margin-bottom: 12px;
            color: #66758a;
            font-size: 8px;
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

        .step.active {
            color: #2868ed;
        }

        .step.active .step-number {
            background: #2868ed;
            color: white;
        }

        .arrow {
            margin: 0 13px;
            color: #738197;
            font-size: 11px;
        }

        /* REVIEW CARD */

        .review-card {
            background: white;
            border: 1px solid #e1e6ec;
            border-radius: 7px;
            padding: 18px 15px;
            min-height: 450px;
        }

        .review-title {
            font-size: 11px;
            font-weight: 700;
            color: #172033;
            margin-bottom: 13px;
        }

        /* TWO INFO CARDS */

        .details-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .details-card {
            background: #f8fafc;
            border: 1px solid #e0e6ed;
            border-radius: 5px;
            padding: 11px;
            min-height: 172px;
        }

        .details-heading {
            color: #1760dc;
            font-size: 8px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .detail-item {
            margin-bottom: 7px;
        }

        .detail-label {
            display: block;
            color: #78869a;
            font-size: 6px;
            text-transform: uppercase;
            margin-bottom: 2px;
        }

        .detail-value {
            display: block;
            color: #202c3e;
            font-size: 7px;
            line-height: 1.3;
        }

        /* COST */

        .cost-box {
            margin-top: 18px;
            height: 45px;
            background: #edf5ff;
            border: 1px solid #cce0ff;
            border-radius: 5px;
            padding: 8px 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .cost-title {
            color: #2165dc;
            font-size: 7px;
            font-weight: 600;
        }

        .cost-description {
            color: #8290a2;
            font-size: 5.5px;
            margin-top: 2px;
        }

        .cost-value {
            color: #175bd0;
            font-size: 17px;
            font-weight: 700;
        }

        /* PAYMENT */

        .payment-card {
            margin-top: 12px;
            border: 1px solid #e1e6ec;
            border-radius: 5px;
            padding: 11px;
            background: white;
        }

        .payment-title {
            color: #2165dc;
            font-size: 8px;
            font-weight: 600;
            margin-bottom: 7px;
        }

        .payment-option {
            height: 24px;
            border: 1px solid #cfe1ff;
            border-radius: 4px;
            background: #edf5ff;
            display: flex;
            align-items: center;
            padding-left: 8px;
            font-size: 7px;
            color: #202c3e;
        }

        .radio {
            width: 10px;
            height: 10px;
            border: 2px solid #2868ed;
            border-radius: 50%;
            margin-right: 6px;
            position: relative;
        }

        .radio:after {
            content: "";
            position: absolute;
            width: 4px;
            height: 4px;
            background: #2868ed;
            border-radius: 50%;
            top: 1px;
            left: 1px;
        }

        /* BUTTONS */

        .button-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-top: 20px;
        }

        .back-button,
        .confirm-button {
            height: 26px;
            border-radius: 5px;
            font-size: 8px;
            font-weight: 600;
            cursor: pointer;
        }

        .back-button {
            background: white;
            border: 1px solid #dfe5ec;
            color: #65758b;
        }

        .confirm-button {
            background: #2868ed;
            border: none;
            color: white;
        }

        .back-button:hover {
            background: #f5f7fa;
        }

        .confirm-button:hover {
            background: #1e59d0;
        }

        .message {
            display: block;
            text-align: center;
            margin-top: 8px;
            font-size: 8px;
            color: #e04444;
        }

        /* RESPONSIVE */

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

            .details-row,
            .button-row {
                grid-template-columns: 1fr;
            }

            .topbar {
                height: 55px;
            }

            .content {
                padding: 15px;
            }

        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="dashboard-container">

        <!-- SIDEBAR -->

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


        <!-- MAIN -->

        <main class="main-content">

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


            <section class="content">

                <!-- STEPPER -->

                <div class="stepper">

                    <div class="step">

                        <span class="step-number">✓</span>

                        <span>Route Details</span>

                    </div>

                    <span class="arrow">→</span>

                    <div class="step">

                        <span class="step-number">✓</span>

                        <span>Load Details</span>

                    </div>

                    <span class="arrow">→</span>

                    <div class="step active">

                        <span class="step-number">3</span>

                        <span>Review &amp; Confirm</span>

                    </div>

                </div>


                <!-- REVIEW -->

                <div class="review-card">

                    <h2 class="review-title">
                        Review &amp; Confirm
                    </h2>


                    <!-- ROUTE + LOAD -->

                    <div class="details-row">

                        <!-- ROUTE -->

                        <div class="details-card">

                            <div class="details-heading">
                                ◉ &nbsp; Route Details
                            </div>

                            <div class="detail-item">

                                <span class="detail-label">
                                    From
                                </span>

                                <span class="detail-value"
                                      id="lblFrom"
                                      runat="server">
                                    Rajkot, Gujarat
                                </span>

                            </div>

                            <div class="detail-item">

                                <span class="detail-label">
                                    To
                                </span>

                                <span class="detail-value"
                                      id="lblTo"
                                      runat="server">
                                    Baroda, Gujarat
                                </span>

                            </div>

                            <div class="detail-item">

                                <span class="detail-label">
                                    Vehicle Type
                                </span>

                                <span class="detail-value"
                                      id="lblVehicle"
                                      runat="server">
                                    Medium Truck (6-Wheeler)
                                </span>

                            </div>

                            <div class="detail-item">

                                <span class="detail-label">
                                    Preferred Date
                                </span>

                                <span class="detail-value"
                                      id="lblDate"
                                      runat="server">
                                    Monday, 17 August 2026
                                </span>

                            </div>

                            <div class="detail-item">

                                <span class="detail-label">
                                    Additional Instructions
                                </span>

                                <span class="detail-value"
                                      id="lblInstructions"
                                      runat="server">
                                    Fragile load. Needs careful stacking.
                                </span>

                            </div>

                        </div>


                        <!-- LOAD -->

                        <div class="details-card">

                            <div class="details-heading">
                                ◉ &nbsp; Load Details
                            </div>

                            <div class="detail-item">

                                <span class="detail-label">
                                    Load Type
                                </span>

                                <span class="detail-value"
                                      id="lblLoadType"
                                      runat="server">
                                    Packaged Goods
                                </span>

                            </div>

                            <div class="detail-item">

                                <span class="detail-label">
                                    Total Weight
                                </span>

                                <span class="detail-value"
                                      id="lblWeight"
                                      runat="server">
                                    850 kg
                                </span>

                            </div>

                            <div class="detail-item">

                                <span class="detail-label">
                                    No. of Packages
                                </span>

                                <span class="detail-value"
                                      id="lblPackages"
                                      runat="server">
                                    12 Packages
                                </span>

                            </div>

                            <div class="detail-item">

                                <span class="detail-label">
                                    Dimensions
                                </span>

                                <span class="detail-value"
                                      id="lblDimensions"
                                      runat="server">
                                    120 x 80 x 60 cm
                                </span>

                            </div>

                            <div class="detail-item">

                                <span class="detail-label">
                                    Special Handling
                                </span>

                                <span class="detail-value"
                                      id="lblHandling"
                                      runat="server">
                                    Temperature sensitive. Keep below 25°C.
                                </span>

                            </div>

                        </div>

                    </div>


                    <!-- COST -->

                    <div class="cost-box">

                        <div>

                            <div class="cost-title">
                                Estimated Transportation Cost
                            </div>

                            <div class="cost-description">
                                Based on distance, vehicle type, and current
                                fuel rates. Toll taxes extra.
                            </div>

                        </div>

                        <div class="cost-value">
                            ₹12,500
                        </div>

                    </div>


                    <!-- PAYMENT -->

                    <div class="payment-card">

                        <div class="payment-title">
                            Payment Method
                        </div>

                        <div class="payment-option">

                            <span class="radio"></span>

                            Cash on Delivery (COD)

                        </div>

                    </div>


                    <!-- BUTTONS -->

                    <div class="button-row">

                        <asp:Button
                            ID="btnBack"
                            runat="server"
                            Text="Back: Load Details"
                            CssClass="back-button"
                            OnClick="btnBack_Click" />

                        <asp:Button
                            ID="btnConfirm"
                            runat="server"
                            Text="Confirm Booking"
                            CssClass="confirm-button"
                            OnClick="btnConfirm_Click" />

                    </div>


                    <asp:Label
                        ID="lblMessage"
                        runat="server"
                        CssClass="message">
                    </asp:Label>

                </div>

            </section>

        </main>

    </div>

</form>

</body>

</html>