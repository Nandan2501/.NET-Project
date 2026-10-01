<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs"
    Inherits="WebApplication3.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - My Profile</title>

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

        /* ================= MAIN ================= */

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

        /* ================= TOPBAR ================= */

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

        .user-info {
            display: flex;

            align-items: center;

            gap: 7px;
        }

        .profile-image-small {
            width: 23px;
            height: 23px;

            border-radius: 50%;

            background: #dce3e9;

            display: flex;

            align-items: center;
            justify-content: center;

            font-size: 9px;
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
            padding: 17px;
        }

        /* ================= TABS ================= */

        .tabs {
            height: 25px;

            display: flex;

            align-items: flex-start;

            gap: 20px;

            border-bottom: 1px solid #e1e6ec;

            margin-bottom: 12px;
        }

        .tab {
            height: 25px;

            color: #63738a;

            font-size: 8px;

            text-decoration: none;
        }

        .tab.active {
            color: #2868ed;

            border-bottom: 2px solid #2868ed;

            font-weight: 600;
        }

        /* ================= PROFILE CARD ================= */

        .profile-card {
            background: white;

            border: 1px solid #e1e6ec;

            border-radius: 7px;

            min-height: 230px;

            padding: 18px;

            display: flex;

            gap: 25px;
        }

        /* ================= PHOTO ================= */

        .photo-section {
            width: 150px;

            text-align: center;

            flex-shrink: 0;
        }

        .profile-photo {
            width: 92px;
            height: 92px;

            border-radius: 50%;

            margin: 0 auto 10px;

            background: #dce3e9;

            border: 2px solid #cbd4dd;

            display: flex;

            align-items: center;
            justify-content: center;

            font-size: 32px;

            color: #6d7b8e;

            overflow: hidden;
        }

        .change-photo {
            height: 25px;

            padding: 0 12px;

            background: #edf4ff;

            border: none;

            border-radius: 5px;

            color: #2868ed;

            font-size: 7px;

            cursor: pointer;
        }

        .photo-help {
            margin-top: 9px;

            font-size: 6px;

            color: #8996a8;

            line-height: 1.4;
        }

        /* ================= DETAILS ================= */

        .profile-details {
            flex: 1;

            padding-top: 1px;
        }

        .form-row {
            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 12px;

            margin-bottom: 11px;
        }

        .form-group.full {
            margin-bottom: 11px;
        }

        .form-label {
            display: block;

            font-size: 7px;

            color: #263347;

            font-weight: 600;

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

        /* ================= BUTTON ================= */

        .edit-button {
            height: 26px;

            padding: 0 15px;

            border: none;

            border-radius: 5px;

            background: #2868ed;

            color: white;

            font-size: 7px;

            font-weight: 600;

            cursor: pointer;
        }

        .edit-button:hover {
            background: #1e59d0;
        }

        .message {
            display: block;

            margin-top: 8px;

            font-size: 7px;

            color: #e04444;
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

            .profile-card {
                flex-direction: column;
            }

            .photo-section {
                width: 100%;
            }

            .form-row {
                grid-template-columns: 1fr;
            }
        }

    </style>

</head>


<body>

<form id="form1" runat="server">

    <div class="dashboard-container">


        <!-- ================= SIDEBAR ================= -->

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
                   class="nav-item">

                    <span class="nav-icon">▣</span>
                    Address Book

                </a>


                <a href="Profile.aspx"
                   class="nav-item active">

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


        <!-- ================= MAIN ================= -->

        <main class="main-content">


            <!-- TOPBAR -->

            <header class="topbar">

                <div class="page-title">
                    My Profile
                </div>


                <div class="user-info">

                    <div class="profile-image-small">
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


                <!-- ================= TABS ================= -->

                <div class="tabs">

                    <a href="Profile.aspx"
                       class="tab active">

                        Personal Information

                    </a>


                    <a href="ChangePassword.aspx"
                       class="tab">

                        Change Password

                    </a>


                    <a href="Documents.aspx"
                       class="tab">

                        Documents

                    </a>

                </div>


                <!-- ================= PROFILE CARD ================= -->

                <div class="profile-card">


                    <!-- PHOTO -->

                    <div class="photo-section">


                        <div class="profile-photo">

                            👤

                        </div>


                        <asp:FileUpload
                            ID="fuProfilePhoto"
                            runat="server"
                            Style="display:none;" />


                        <div class="photo-help">

                            Allowed JPG, GIF or PNG.
                            Max size of 800Kb

                        </div>

                    </div>


                    <!-- DETAILS -->

                    <div class="profile-details">


                        <!-- NAME / EMAIL -->

                        <div class="form-row">


                            <div class="form-group">

                                <label class="form-label">
                                    Full Name
                                </label>

                                <asp:TextBox
                                    ID="txtFullName"
                                    runat="server"
                                    CssClass="input-field"
                                    Text="Nandan Nasit">
                                </asp:TextBox>

                            </div>


                            <div class="form-group">

                                <label class="form-label">
                                    Email
                                </label>

                                <asp:TextBox
                                    ID="txtEmail"
                                    runat="server"
                                    CssClass="input-field"
                                    Text="jnandannasit@gmail.com">
                                </asp:TextBox>

                            </div>

                        </div>


                        <!-- PHONE / DOB -->

                        <div class="form-row">


                            <div class="form-group">

                                <label class="form-label">
                                    Phone
                                </label>

                                <asp:TextBox
                                    ID="txtPhone"
                                    runat="server"
                                    CssClass="input-field"
                                    Text="98765-43210">
                                </asp:TextBox>

                            </div>


                            <div class="form-group">

                                <label class="form-label">
                                    Date of Birth
                                </label>

                                <asp:TextBox
                                    ID="txtDateOfBirth"
                                    runat="server"
                                    CssClass="input-field"
                                    Text="12 Mar 1990">
                                </asp:TextBox>

                            </div>

                        </div>


                        <!-- ADDRESS -->

                        <div class="form-group full">

                            <label class="form-label">
                                Address
                            </label>

                            <asp:TextBox
                                ID="txtAddress"
                                runat="server"
                                CssClass="input-field"
                                Text="Gandhinagar, gujarat 360002">
                            </asp:TextBox>

                        </div>


                        <!-- EDIT -->

                        <asp:Button
                            ID="btnEditProfile"
                            runat="server"
                            Text="Edit Profile"
                            CssClass="edit-button"
                            OnClick="btnEditProfile_Click" />


                        <asp:Label
                            ID="lblMessage"
                            runat="server"
                            CssClass="message">
                        </asp:Label>


                    </div>

                </div>

            </section>

        </main>

    </div>

</form>

</body>

</html>