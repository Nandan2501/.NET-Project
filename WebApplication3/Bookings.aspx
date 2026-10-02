<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="MyBookings.aspx.cs"
    Inherits="WebApplication3.MyBookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - My Bookings</title>

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
            padding: 18px;
        }


        /* =========================
           BOOKINGS CARD
        ========================= */

        .bookings-card {
            background: white;

            border: 1px solid #e1e6ec;

            border-radius: 7px;

            min-height: 513px;

            padding: 12px;
        }


        /* =========================
           TABLE
        ========================= */

        .booking-table {
            width: 100%;

            border-collapse: collapse;

            table-layout: fixed;
        }


        .booking-table th {
            height: 28px;

            text-align: left;

            border-bottom: 1px solid #e2e7ed;

            color: #66758a;

            font-size: 7px;

            font-weight: 600;
        }


        .booking-table td {
            height: 30px;

            border-bottom: 1px solid #e8edf2;

            color: #344257;

            font-size: 7px;

            vertical-align: middle;
        }


        .booking-table tr:last-child td {
            border-bottom: none;
        }


        /* COLUMN WIDTHS */

        .col-id {
            width: 12%;
        }

        .col-route {
            width: 36%;
        }

        .col-date {
            width: 17%;
        }

        .col-status {
            width: 11%;
        }

        .col-amount {
            width: 11%;
        }

        .col-action {
            width: 13%;
        }


        /* =========================
           BOOKING ID
        ========================= */

        .booking-id {
            color: #1762df;

            font-size: 8px;

            font-weight: 600;
        }


        /* =========================
           ROUTE
        ========================= */

        .route {
            color: #263347;

            font-size: 7px;
        }


        .date {
            color: #718096;

            font-size: 7px;
        }


        /* =========================
           STATUS
        ========================= */

        .status {
            display: inline-block;

            padding: 3px 6px;

            border-radius: 10px;

            font-size: 6px;

            font-weight: 600;
        }


        .ongoing {
            color: #d78b00;

            background: #fff4d8;
        }


        .completed {
            color: #12a56b;

            background: #d9f8eb;
        }


        .cancelled {
            color: #e04444;

            background: #ffe1e1;
        }


        /* =========================
           AMOUNT
        ========================= */

        .amount {
            color: #263347;

            font-size: 7px;

            font-weight: 600;
        }


        /* =========================
           ACTION
        ========================= */

        .details-link {
            color: #1762df;

            font-size: 7px;

            font-weight: 600;

            text-decoration: none;
        }


        .details-link:hover {
            text-decoration: underline;
        }


        /* =========================
           EMPTY MESSAGE
        ========================= */

        .message {
            display: block;

            text-align: center;

            margin-top: 20px;

            font-size: 8px;

            color: #7d899a;
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

            .booking-table {
                min-width: 650px;
            }

            .bookings-card {
                overflow-x: auto;
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
                    My Bookings
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


                <div class="bookings-card">


                    <asp:GridView
                        ID="gvBookings"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="booking-table"
                        GridLines="None"
                        OnRowCommand="gvBookings_RowCommand">


                        <Columns>


                          

                            <asp:BoundField
                                DataField="BookingId"
                                HeaderText="Booking ID">
                            </asp:BoundField>


                        

                            <asp:BoundField
                                DataField="Route"
                                HeaderText="Route">
                            </asp:BoundField>



                            <asp:BoundField
                                DataField="Date"
                                HeaderText="Date">
                            </asp:BoundField>



                            <asp:TemplateField
                                HeaderText="Status">

                                <ItemTemplate>

                                    <span
                                        class='<%# GetStatusClass(Eval("Status").ToString()) %>'>

                                        <%# Eval("Status") %>

                                    </span>

                                </ItemTemplate>

                            </asp:TemplateField>


                          

                            <asp:BoundField
                                DataField="Amount"
                                HeaderText="Amount">
                            </asp:BoundField>


                     

                            <asp:TemplateField
                                HeaderText="Action">

                                <ItemTemplate>

                                    <asp:LinkButton
                                        ID="btnDetails"
                                        runat="server"
                                        CommandName="ViewDetails"
                                        CommandArgument='<%# Eval("BookingId") %>'
                                        CssClass="details-link">

                                        View Details

                                    </asp:LinkButton>

                                </ItemTemplate>

                            </asp:TemplateField>


                        </Columns>

                    </asp:GridView>


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