<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="BookTransportation.aspx.cs"
    Inherits="WebApplication3.BookTransportation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Book Transportation</title>

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


        .logo {
            height: 50px;

            display: flex;
            align-items: center;

            padding-left: 32px;

            font-size: 12px;
            font-weight: bold;
        }


        .logo-icon {
            width: 11px;
            height: 11px;

            background: white;

            margin-right: 10px;
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
            padding: 18px 18px;
        }


        /* =========================
           STEPPER
        ========================= */

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

            background: #e5eaf0;

            color: #6e7b8e;

            font-size: 7px;
        }


        .step.active .step-number {
            background: #2165e8;

            color: white;
        }


        .step.active {
            color: #172033;
        }


        .arrow {
            margin: 0 13px;

            color: #738197;

            font-size: 11px;
        }


        /* =========================
           FORM CARD
        ========================= */

        .form-card {
            background: white;

            border: 1px solid #e1e6ec;

            border-radius: 7px;

            padding: 18px 15px 15px;
        }


        .form-title {
            font-size: 11px;

            font-weight: 700;

            color: #172033;

            margin-bottom: 13px;
        }


        /* =========================
           FORM GROUP
        ========================= */

        .form-group {
            margin-bottom: 12px;
        }


        .form-label {
            display: block;

            font-size: 8px;

            font-weight: 600;

            color: #202a3b;

            margin-bottom: 5px;
        }


        .input-field {
            width: 100%;

            height: 26px;

            border: 1px solid #dfe5ec;

            border-radius: 6px;

            background: #f8fafc;

            padding: 0 8px;

            color: #374457;

            font-size: 8px;

            outline: none;
        }


        .input-field:focus {
            border-color: #2868ed;

            background: white;
        }


        /* =========================
           TWO COLUMN FORM
        ========================= */

        .two-columns {
            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 10px;
        }


        /* =========================
           SELECT
        ========================= */

        .select-field {
            width: 100%;

            height: 26px;

            border: 1px solid #dfe5ec;

            border-radius: 6px;

            background: #f8fafc;

            padding: 0 7px;

            color: #374457;

            font-size: 8px;

            outline: none;
        }


        /* =========================
           DATE
        ========================= */

        .date-field {
            width: 100%;

            height: 26px;

            border: 1px solid #dfe5ec;

            border-radius: 6px;

            background: #f8fafc;

            padding: 0 7px;

            color: #7a8799;

            font-size: 8px;

            outline: none;
        }


        /* =========================
           TEXTAREA
        ========================= */

        .textarea-field {
            width: 100%;

            height: 47px;

            resize: none;

            border: 1px solid #dfe5ec;

            border-radius: 6px;

            background: #f8fafc;

            padding: 8px;

            color: #374457;

            font-size: 8px;

            outline: none;
        }


        .textarea-field:focus {
            border-color: #2868ed;

            background: white;
        }


        /* =========================
           NEXT BUTTON
        ========================= */

        .next-button {
            width: 100%;

            height: 26px;

            border: none;

            border-radius: 5px;

            background: #2868ed;

            color: #07101e;

            font-size: 8px;

            font-weight: 700;

            cursor: pointer;

            margin-top: 1px;
        }


        .next-button:hover {
            background: #1d59d5;

            color: white;
        }


        /* =========================
           ERROR
        ========================= */

        .message {
            display: block;

            text-align: center;

            margin-top: 7px;

            font-size: 8px;

            color: #e04444;
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

            .two-columns {
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


        <!-- =========================
             SIDEBAR
        ========================= -->

        <aside class="sidebar">


            <!-- LOGO -->

            <div class="logo">

                <span class="logo-icon"></span>

                <span>Transpo</span>

            </div>


            <!-- NAVIGATION -->

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


            <!-- LOGOUT -->

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
                ========================== -->

                <div class="stepper">


                    <div class="step active">

                        <span class="step-number">
                            1
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
                            2
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
                            3
                        </span>

                        <span>
                            Review &amp; Confirm
                        </span>

                    </div>


                </div>


                <!-- =========================
                     FORM
                ========================== -->

                <div class="form-card">


                    <h2 class="form-title">
                        Enter Route Details
                    </h2>


                    <!-- FROM LOCATION -->

                    <div class="form-group">

                        <label class="form-label">
                            From Location
                        </label>

                        <asp:TextBox
                            ID="txtFromLocation"
                            runat="server"
                            CssClass="input-field"
                            Text="Rajkot, gujarat">
                        </asp:TextBox>

                    </div>


                    <!-- TO LOCATION -->

                    <div class="form-group">

                        <label class="form-label">
                            To Location
                        </label>

                        <asp:TextBox
                            ID="txtToLocation"
                            runat="server"
                            CssClass="input-field"
                            Text="baroda, gujarat">
                        </asp:TextBox>

                    </div>


                    <!-- VEHICLE + DATE -->

                    <div class="two-columns">


                        <!-- VEHICLE -->

                        <div class="form-group">

                            <label class="form-label">
                                Vehicle Type
                            </label>

                            <asp:DropDownList
                                ID="ddlVehicleType"
                                runat="server"
                                CssClass="select-field">

                                <asp:ListItem
                                    Text="Medium Truck (6-Wheeler)"
                                    Value="Medium Truck">
                                </asp:ListItem>

                                <asp:ListItem
                                    Text="Small Pickup"
                                    Value="Small Pickup">
                                </asp:ListItem>

                                <asp:ListItem
                                    Text="Heavy Truck"
                                    Value="Heavy Truck">
                                </asp:ListItem>

                            </asp:DropDownList>

                        </div>


                        <!-- DATE -->

                        <div class="form-group">

                            <label class="form-label">
                                Preferred Date
                            </label>

                            <asp:TextBox
                                ID="txtPreferredDate"
                                runat="server"
                                CssClass="date-field"
                                TextMode="Date">
                            </asp:TextBox>

                        </div>


                    </div>


                    <!-- INSTRUCTIONS -->

                    <div class="form-group">

                        <label class="form-label">
                            Additional Instructions
                        </label>

                        <asp:TextBox
                            ID="txtInstructions"
                            runat="server"
                            CssClass="textarea-field"
                            TextMode="MultiLine"
                            placeholder="Fragile load. Needs careful stacking.">
                        </asp:TextBox>

                    </div>


                    <!-- NEXT -->

                    <asp:Button
                        ID="btnNext"
                        runat="server"
                        Text="Next: Load Details"
                        CssClass="next-button"
                        OnClick="btnNext_Click" />


                    <!-- MESSAGE -->

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