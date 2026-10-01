<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="LoadDetails.aspx.cs"
    Inherits="WebApplication3.LoadDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Load Details</title>

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

            padding-left: 17px;

            font-size: 12px;
            font-weight: bold;
        }

        .logo-icon {
            width: 19px;
            height: 19px;

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
            padding: 18px;
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
            background: #2868ed;

            color: white;
        }

        .step.completed .step-number {
            background: #dfeeff;

            color: #2868ed;
        }

        .step.active {
            color: #2868ed;
        }

        .step.completed {
            color: #2868ed;
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
            min-height: 488px;

            background: white;

            border: 1px solid #e1e6ec;

            border-radius: 7px;

            padding: 18px 15px;
        }

        .form-title {
            font-size: 11px;

            font-weight: 700;

            color: #172033;

            margin-bottom: 14px;
        }

        /* =========================
           FORM
        ========================= */

        .form-group {
            margin-bottom: 11px;
        }

        .form-label {
            display: block;

            font-size: 8px;

            font-weight: 600;

            color: #202a3b;

            margin-bottom: 5px;
        }

        .input-field,
        .select-field {
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

        .input-field:focus,
        .select-field:focus {
            border-color: #2868ed;

            background: white;
        }

        /* =========================
           TWO COLUMN
        ========================= */

        .two-columns {
            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 10px;
        }

        /* =========================
           DIMENSIONS
        ========================= */

        .dimensions {
            display: grid;

            grid-template-columns: repeat(3, 1fr);

            gap: 7px;
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
           BUTTONS
        ========================= */

        .button-row {
            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 10px;

            margin-top: 19px;
        }

        .back-button,
        .next-button {
            width: 100%;

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

        .back-button:hover {
            background: #f5f7fa;
        }

        .next-button {
            background: #2868ed;

            border: none;

            color: white;
        }

        .next-button:hover {
            background: #1e59d0;
        }

        /* =========================
           MESSAGE
        ========================= */

        .message {
            display: block;

            text-align: center;

            margin-top: 8px;

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

            .dimensions {
                grid-template-columns: 1fr;
            }

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
             MAIN
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


                    <!-- STEP 1 -->

                    <div class="step completed">

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


                    <!-- STEP 2 -->

                    <div class="step active">

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


                    <!-- STEP 3 -->

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
                     FORM CARD
                ========================= -->

                <div class="form-card">


                    <h2 class="form-title">
                        Enter Load Details
                    </h2>


                    <!-- LOAD TYPE + WEIGHT -->

                    <div class="two-columns">


                        <!-- LOAD TYPE -->

                        <div class="form-group">

                            <label class="form-label">
                                Load Type
                            </label>

                            <asp:DropDownList
                                ID="ddlLoadType"
                                runat="server"
                                CssClass="select-field">

                                <asp:ListItem
                                    Text="Packaged Goods"
                                    Value="Packaged Goods">
                                </asp:ListItem>

                                <asp:ListItem
                                    Text="Furniture"
                                    Value="Furniture">
                                </asp:ListItem>

                                <asp:ListItem
                                    Text="Machinery"
                                    Value="Machinery">
                                </asp:ListItem>

                                <asp:ListItem
                                    Text="Agricultural Goods"
                                    Value="Agricultural Goods">
                                </asp:ListItem>

                            </asp:DropDownList>

                        </div>


                        <!-- WEIGHT -->

                        <div class="form-group">

                            <label class="form-label">
                                Weight (in kg)
                            </label>

                            <asp:TextBox
                                ID="txtWeight"
                                runat="server"
                                CssClass="input-field"
                                Text="850">
                            </asp:TextBox>

                        </div>

                    </div>


                    <!-- NUMBER + DIMENSIONS -->

                    <div class="two-columns">


                        <!-- NUMBER OF PACKAGES -->

                        <div class="form-group">

                            <label class="form-label">
                                Number of Packages
                            </label>

                            <asp:TextBox
                                ID="txtPackages"
                                runat="server"
                                CssClass="input-field"
                                Text="12">
                            </asp:TextBox>

                        </div>


                        <!-- DIMENSIONS -->

                        <div class="form-group">

                            <label class="form-label">
                                Package Dimensions (L x W x H in cm)
                            </label>


                            <div class="dimensions">


                                <asp:TextBox
                                    ID="txtLength"
                                    runat="server"
                                    CssClass="input-field"
                                    placeholder="L:120">
                                </asp:TextBox>


                                <asp:TextBox
                                    ID="txtWidth"
                                    runat="server"
                                    CssClass="input-field"
                                    placeholder="W:80">
                                </asp:TextBox>


                                <asp:TextBox
                                    ID="txtHeight"
                                    runat="server"
                                    CssClass="input-field"
                                    placeholder="H:60">
                                </asp:TextBox>


                            </div>

                        </div>

                    </div>


                    <!-- SPECIAL HANDLING -->

                    <div class="form-group">

                        <label class="form-label">
                            Special Handling Requirements
                        </label>

                        <asp:TextBox
                            ID="txtSpecialHandling"
                            runat="server"
                            CssClass="textarea-field"
                            TextMode="MultiLine"
                            Text="Temperature sensitive. Keep below 25°C.">
                        </asp:TextBox>

                    </div>


                    <!-- BUTTONS -->

                    <div class="button-row">


                        <asp:Button
                            ID="btnBack"
                            runat="server"
                            Text="Back: Route Details"
                            CssClass="back-button"
                            OnClick="btnBack_Click" />


                        <asp:Button
                            ID="btnNext"
                            runat="server"
                            Text="Next: Review & Confirm"
                            CssClass="next-button"
                            OnClick="btnNext_Click" />


                    </div>


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