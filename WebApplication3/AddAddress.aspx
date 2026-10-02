<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AddAddress.aspx.cs"
    Inherits="WebApplication3.AddAddress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Add New Address</title>

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

        /* ================= SIDEBAR ================= */

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

        /* ================= MAIN ================= */

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

        /* ================= CONTENT ================= */

        .content {
            padding: 18px;
        }

        /* BREADCRUMB */

        .breadcrumb {
            font-size: 7px;
            color: #7c899b;
            margin-bottom: 6px;
        }

        .breadcrumb .active {
            color: #2868ed;
            font-weight: 600;
        }

        .heading {
            font-size: 13px;
            font-weight: 700;
            color: #172033;
            margin-bottom: 3px;
        }

        .description {
            font-size: 7px;
            color: #8190a4;
            margin-bottom: 12px;
        }

        /* ================= FORM CARD ================= */

        .form-card {
            background: white;
            border: 1px solid #e1e6ec;
            border-radius: 7px;
            padding: 17px;
        }

        .form-group {
            margin-bottom: 10px;
        }

        .form-label {
            display: block;
            font-size: 7px;
            font-weight: 600;
            color: #263347;
            margin-bottom: 5px;
        }

        .input-field {
            width: 100%;
            height: 26px;

            border: 1px solid #dfe5ec;
            border-radius: 5px;

            background: white;

            padding: 0 9px;

            font-size: 7px;
            color: #344257;

            outline: none;
        }

        .input-field:focus {
            border-color: #2868ed;
        }

        textarea.input-field {
            height: 57px;
            padding-top: 8px;
            resize: none;
        }

        .row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }

        /* ================= RADIO ================= */

        .address-type {
            margin-top: 3px;
            margin-bottom: 9px;
        }

        .radio-option {
            display: inline-flex;
            align-items: center;
            margin-right: 15px;
            font-size: 7px;
            color: #344257;
        }

        .radio-option input {
            margin-right: 5px;
            accent-color: #2868ed;
        }

        /* ================= CHECKBOX ================= */

        .default-option {
            display: flex;
            align-items: center;
            gap: 6px;

            font-size: 7px;
            color: #344257;

            margin-bottom: 15px;
        }

        .default-option input {
            accent-color: #2868ed;
        }

        /* ================= BUTTONS ================= */

        .button-row {
            display: flex;
            gap: 9px;
        }

        .button {
            height: 23px;

            border-radius: 5px;

            padding: 0 14px;

            font-size: 7px;

            font-weight: 600;

            cursor: pointer;
        }

        .cancel-button {
            background: white;
            border: 1px solid #dfe5ec;
            color: #65758b;
        }

        .save-button {
            background: #2868ed;
            border: none;
            color: white;
        }

        .cancel-button:hover {
            background: #f5f7fa;
        }

        .save-button:hover {
            background: #1e59d0;
        }

        .message {
            display: block;
            margin-top: 8px;
            color: #e04444;
            font-size: 7px;
        }

        /* ================= RESPONSIVE ================= */

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

            .row {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .radio-option {
                margin-bottom: 6px;
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

            <!-- TOP BAR -->

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


            <!-- CONTENT -->

            <section class="content">

                <!-- BREADCRUMB -->

                <div class="breadcrumb">

                    Address Book
                    &nbsp;›&nbsp;

                    <span class="active">
                        Add New Address
                    </span>

                </div>


                <h1 class="heading">
                    Add New Address
                </h1>

                <p class="description">
                    Fill in the details below to add a new shipping address
                </p>


                <!-- FORM -->

                <div class="form-card">


                    <!-- ADDRESS LABEL -->

                    <div class="form-group">

                        <label class="form-label">
                            Address Label
                        </label>

                        <asp:TextBox
                            ID="txtAddressLabel"
                            runat="server"
                            CssClass="input-field"
                            placeholder="e.g. Warehouse, Office, Home">
                        </asp:TextBox>

                    </div>


                    <!-- FULL ADDRESS -->

                    <div class="form-group">

                        <label class="form-label">
                            Full Address
                        </label>

                        <asp:TextBox
                            ID="txtFullAddress"
                            runat="server"
                            CssClass="input-field"
                            TextMode="MultiLine"
                            placeholder="Street address, building name, floor, etc.">
                        </asp:TextBox>

                    </div>


                    <!-- CITY / STATE -->

                    <div class="row">

                        <div class="form-group">

                            <label class="form-label">
                                City
                            </label>

                            <asp:TextBox
                                ID="txtCity"
                                runat="server"
                                CssClass="input-field"
                                placeholder="Enter city">
                            </asp:TextBox>

                        </div>


                        <div class="form-group">

                            <label class="form-label">
                                State
                            </label>

                            <asp:TextBox
                                ID="txtState"
                                runat="server"
                                CssClass="input-field"
                                placeholder="Enter state">
                            </asp:TextBox>

                        </div>

                    </div>


                    <!-- PIN / COUNTRY -->

                    <div class="row">

                        <div class="form-group">

                            <label class="form-label">
                                PIN Code
                            </label>

                            <asp:TextBox
                                ID="txtPinCode"
                                runat="server"
                                CssClass="input-field"
                                MaxLength="6"
                                placeholder="6-digit postal code">
                            </asp:TextBox>

                        </div>


                        <div class="form-group">

                            <label class="form-label">
                                Country
                            </label>

                            <asp:DropDownList
                                ID="ddlCountry"
                                runat="server"
                                CssClass="input-field">

                                <asp:ListItem>
                                    India
                                </asp:ListItem>

                                <asp:ListItem>
                                    United States
                                </asp:ListItem>

                                <asp:ListItem>
                                    United Kingdom
                                </asp:ListItem>

                                <asp:ListItem>
                                    Canada
                                </asp:ListItem>

                            </asp:DropDownList>

                        </div>

                    </div>


                    <!-- PHONE -->

                    <div class="form-group">

                        <label class="form-label">
                            Contact Phone
                        </label>

                        <asp:TextBox
                            ID="txtPhone"
                            runat="server"
                            CssClass="input-field"
                            placeholder="+91 98765 43210">
                        </asp:TextBox>

                    </div>


                    <!-- ADDRESS TYPE -->

                    <div class="form-group">

                        <label class="form-label">
                            Address Type
                        </label>


                        <div class="address-type">

                            <label class="radio-option">

                                <asp:RadioButton
                                    ID="rbWarehouse"
                                    runat="server"
                                    GroupName="AddressType"
                                    Text="Warehouse"
                                    Checked="true" />

                            </label>


                            <label class="radio-option">

                                <asp:RadioButton
                                    ID="rbOffice"
                                    runat="server"
                                    GroupName="AddressType"
                                    Text="Office" />

                            </label>


                            <label class="radio-option">

                                <asp:RadioButton
                                    ID="rbResidential"
                                    runat="server"
                                    GroupName="AddressType"
                                    Text="Residential" />

                            </label>


                            <label class="radio-option">

                                <asp:RadioButton
                                    ID="rbPort"
                                    runat="server"
                                    GroupName="AddressType"
                                    Text="Port/Terminal" />

                            </label>

                        </div>

                    </div>


                    <!-- DEFAULT -->

                    <div class="default-option">

                        <asp:CheckBox
                            ID="chkDefault"
                            runat="server"
                            Checked="true" />

                        <span>
                            Set as Default Delivery Address
                        </span>

                    </div>


                    <!-- BUTTONS -->

                    <div class="button-row">

                        <asp:Button
                            ID="btnCancel"
                            runat="server"
                            Text="Cancel"
                            CssClass="button cancel-button"
                            OnClick="btnCancel_Click" />


                        <asp:Button
                            ID="btnSave"
                            runat="server"
                            Text="Save Address"
                            CssClass="button save-button"
                            OnClick="btnSave_Click" />

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