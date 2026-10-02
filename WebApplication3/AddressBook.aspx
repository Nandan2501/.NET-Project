<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AddressBook.aspx.cs"
    Inherits="WebApplication3.AddressBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Address Book</title>

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
            height: 595px;
            margin: 30px auto;
            background: #f7f9fb;
            display: flex;
            overflow: hidden;
            border: 2px solid #0787e8;
        }

        /* SIDEBAR */

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
            padding-left: 18px;
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

        /* HEADER CARD */

        .manage-card {
            background: white;
            border: 1px solid #e1e6ec;
            border-radius: 7px;
            height: 47px;
            padding: 8px 10px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            margin-bottom: 14px;
        }

        .manage-title {
            font-size: 9px;
            font-weight: 700;
            color: #172033;
            margin-bottom: 3px;
        }

        .manage-description {
            font-size: 6.5px;
            color: #8190a4;
        }

        /* ADD BUTTON */

        .add-button {
            height: 23px;
            padding: 0 11px;

            background: #2868ed;
            border: none;
            border-radius: 5px;

            color: white;
            font-size: 7px;
            font-weight: 600;

            cursor: pointer;
        }

        .add-button:hover {
            background: #1e59d0;
        }

        /* ADDRESS CARD */

        .address-card {
            min-height: 69px;

            background: white;

            border: 1px solid #e1e6ec;

            border-radius: 7px;

            padding: 9px 11px;

            display: flex;

            align-items: center;

            margin-bottom: 10px;
        }

        .address-card.default {
            border: 2px solid #2868ed;
        }

        /* ICON */

        .address-icon {
            width: 28px;
            height: 28px;

            border-radius: 50%;

            background: #f1f4f8;

            display: flex;
            align-items: center;
            justify-content: center;

            color: #66758a;

            font-size: 11px;

            margin-right: 11px;

            flex-shrink: 0;
        }

        .default .address-icon {
            background: #edf4ff;
            color: #2868ed;
        }

        /* DETAILS */

        .address-details {
            flex: 1;
        }

        .address-name-row {
            display: flex;
            align-items: center;
            gap: 8px;

            margin-bottom: 4px;
        }

        .address-name {
            font-size: 8px;
            font-weight: 700;
            color: #202c3e;
        }

        .default-label {
            background: #d9f8eb;
            color: #11a66b;

            padding: 2px 5px;

            border-radius: 7px;

            font-size: 5px;
            font-weight: 600;
        }

        .address-text {
            font-size: 6.5px;
            color: #718096;

            margin-bottom: 4px;
        }

        .phone {
            font-size: 6px;
            color: #8090a4;
        }

        /* ACTIONS */

        .address-actions {
            display: flex;
            gap: 8px;
        }

        .icon-button {
            width: 23px;
            height: 23px;

            border: 1px solid #dfe5ec;

            border-radius: 5px;

            background: white;

            display: flex;
            align-items: center;
            justify-content: center;

            cursor: pointer;

            font-size: 9px;
        }

        .edit-button {
            color: #66758a;
        }

        .delete-button {
            color: #e04444;
        }

        .icon-button:hover {
            background: #f5f7fa;
        }

        /* MESSAGE */

        .message {
            display: block;

            text-align: center;

            margin-top: 10px;

            font-size: 7px;

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

            .content {
                padding: 12px;
            }

            .address-card {
                align-items: flex-start;
            }

            .address-actions {
                margin-left: 5px;
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
                   class="nav-item">

                    <span class="nav-icon">♧</span>
                    Book Transportation

                </a>

                <a href="MyBookings.aspx"
                   class="nav-item">

                    <span class="nav-icon">☷</span>
                    My Bookings

                </a>

                <a href="Payments.aspx"
                   class="nav-item">

                    <span class="nav-icon">▭</span>
                    Payments

                </a>

                <a href="AddressBook.aspx"
                   class="nav-item active">

                    <span class="nav-icon">▣</span>
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
                    Address Book
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

                <!-- MANAGE HEADER -->

                <div class="manage-card">

                    <div>

                        <div class="manage-title">
                            Manage Shipping Addresses
                        </div>

                        <div class="manage-description">
                            Save your warehouses, offices, and ports for streamlined bookings.
                        </div>

                    </div>


                    <asp:Button
                        ID="btnAddAddress"
                        runat="server"
                        Text="+  Add New Address"
                        CssClass="add-button"
                        OnClick="btnAddAddress_Click" />

                </div>


                <!-- ADDRESS 1 -->

                <div class="address-card default">

                    <div class="address-icon">
                        ♧
                    </div>


                    <div class="address-details">

                        <div class="address-name-row">

                            <span class="address-name">
                                Rajkot main office
                            </span>

                            <span class="default-label">
                                Default Delivery
                            </span>

                        </div>

                        <div class="address-text">
                            sapar,rajkot, gujarat 360002
                        </div>

                        <div class="phone">
                            ☎ &nbsp;+91 98765 43210
                        </div>

                    </div>


                    <div class="address-actions">

                        <asp:Button
                            ID="btnEdit1"
                            runat="server"
                            Text="✎"
                            CssClass="icon-button edit-button"
                            CommandArgument="1"
                            OnClick="btnEditAddress_Click" />

                        <asp:Button
                            ID="btnDelete1"
                            runat="server"
                            Text="♙"
                            CssClass="icon-button delete-button"
                            CommandArgument="1"
                            OnClick="btnDeleteAddress_Click" />

                    </div>

                </div>


                <!-- ADDRESS 2 -->

                <div class="address-card">

                    <div class="address-icon">
                        ⌂
                    </div>


                    <div class="address-details">

                        <div class="address-name-row">

                            <span class="address-name">
                                Private Residence (Home)
                            </span>

                        </div>

                        <div class="address-text">
                            Apartment 402, Royal Residency, CG Road, Navrangpura, Ahmedabad, Gujarat, 380009
                        </div>

                        <div class="phone">
                            ☎ &nbsp;+91 91234 56789
                        </div>

                    </div>


                    <div class="address-actions">

                        <asp:Button
                            ID="btnEdit2"
                            runat="server"
                            Text="✎"
                            CssClass="icon-button edit-button"
                            CommandArgument="2"
                            OnClick="btnEditAddress_Click" />

                        <asp:Button
                            ID="btnDelete2"
                            runat="server"
                            Text="♙"
                            CssClass="icon-button delete-button"
                            CommandArgument="2"
                            OnClick="btnDeleteAddress_Click" />

                    </div>

                </div>


                <!-- ADDRESS 3 -->

                <div class="address-card">

                    <div class="address-icon">
                        ∿
                    </div>


                    <div class="address-details">

                        <div class="address-name-row">

                            <span class="address-name">
                                Industrial Construction Hub (Site Location)
                            </span>

                        </div>

                        <div class="address-text">
                            Plot 14-B, Surat Special Economic Zone (SEZ), Sachin, Surat, Gujarat, 394230
                        </div>

                        <div class="phone">
                            ☎ &nbsp;+91 94567 12304
                        </div>

                    </div>


                    <div class="address-actions">

                        <asp:Button
                            ID="btnEdit3"
                            runat="server"
                            Text="✎"
                            CssClass="icon-button edit-button"
                            CommandArgument="3"
                            OnClick="btnEditAddress_Click" />

                        <asp:Button
                            ID="btnDelete3"
                            runat="server"
                            Text="♙"
                            CssClass="icon-button delete-button"
                            CommandArgument="3"
                            OnClick="btnDeleteAddress_Click" />

                    </div>

                </div>


                <!-- ADDRESS 4 -->

                <div class="address-card">

                    <div class="address-icon">
                        ⚓
                    </div>


                    <div class="address-details">

                        <div class="address-name-row">

                            <span class="address-name">
                                Kandla Port Terminal (Port Address)
                            </span>

                        </div>

                        <div class="address-text">
                            Berth No. 8, Cargo Terminal East, Kandla Port, Gandhidham, Gujarat, 370210
                        </div>

                        <div class="phone">
                            ☎ &nbsp;+91 93210 98765
                        </div>

                    </div>


                    <div class="address-actions">

                        <asp:Button
                            ID="btnEdit4"
                            runat="server"
                            Text="✎"
                            CssClass="icon-button edit-button"
                            CommandArgument="4"
                            OnClick="btnEditAddress_Click" />

                        <asp:Button
                            ID="btnDelete4"
                            runat="server"
                            Text="♙"
                            CssClass="icon-button delete-button"
                            CommandArgument="4"
                            OnClick="btnDeleteAddress_Click" />

                    </div>

                </div>


                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>

            </section>

        </main>

    </div>

</form>

</body>

</html>