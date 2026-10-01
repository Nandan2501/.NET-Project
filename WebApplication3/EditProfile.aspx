<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="EditProfile.aspx.cs"
    Inherits="WebApplication3.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Edit Profile</title>

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
            width: 720px;
            height: 515px;
            margin: 30px auto;
            background: #f3f7fb;
            display: flex;
            overflow: hidden;
            border: 1px solid #087de0;
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            width: 130px;
            background: #0d1d39;
            color: white;
            display: flex;
            flex-direction: column;
        }

        .logo {
            height: 50px;
            display: flex;
            align-items: center;
            padding-left: 13px;
            font-size: 11px;
            font-weight: bold;
        }

        .logo-icon {
            width: 17px;
            height: 17px;
            background: #2868ed;
            border-radius: 4px;
            margin-right: 6px;
        }

        .navigation {
            padding: 5px 10px;
        }

        .nav-item {
            height: 28px;
            margin-bottom: 3px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            padding-left: 8px;
            color: #8997ad;
            text-decoration: none;
            font-size: 7px;
        }

        .nav-icon {
            width: 16px;
            margin-right: 4px;
            text-align: center;
            font-size: 9px;
        }

        .nav-item.active {
            background: #2868ed;
            color: white;
        }

        .nav-item:hover {
            background: #172b4e;
            color: white;
        }

        .logout {
            margin-top: auto;
            padding: 0 17px 18px;
        }

        .logout a {
            color: #ff4d55;
            font-size: 7px;
            text-decoration: none;
        }

        /* ================= MAIN ================= */

        .main-content {
            flex: 1;
            background: #f3f7fb;
            min-width: 0;
        }

        .topbar {
            height: 51px;
            background: white;
            border-bottom: 1px solid #e0e6ed;
            padding: 10px 16px;
        }

        .page-title {
            font-size: 12px;
            font-weight: 700;
            color: #172033;
            margin-bottom: 3px;
        }

        .page-description {
            font-size: 6px;
            color: #7d899a;
        }

        .user-info {
            position: absolute;
            margin-top: -34px;
            margin-left: 475px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .profile-image-small {
            width: 21px;
            height: 21px;
            border-radius: 50%;
            background: #dce3e9;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 9px;
        }

        .user-name {
            font-size: 7px;
            font-weight: 700;
            color: #1c2738;
        }

        .user-role {
            font-size: 5px;
            color: #7d899a;
        }

        /* ================= CONTENT ================= */

        .content {
            padding: 13px 16px;
        }

        /* TABS */

        .tabs {
            height: 25px;
            display: flex;
            gap: 20px;
            border-bottom: 1px solid #dfe5ec;
            margin-bottom: 11px;
        }

        .tab {
            height: 25px;
            font-size: 7px;
            color: #6f7e93;
            text-decoration: none;
            padding-top: 3px;
        }

        .tab.active {
            color: #2868ed;
            border-bottom: 2px solid #2868ed;
            font-weight: 600;
        }

        /* PROFILE CARD */

        .profile-card {
            background: white;
            border: 1px solid #e0e6ed;
            border-radius: 7px;
            padding: 17px;
            display: flex;
            gap: 25px;
            min-height: 220px;
        }

        /* PHOTO */

        .photo-section {
            width: 120px;
            text-align: center;
            flex-shrink: 0;
        }

        .profile-photo {
            width: 78px;
            height: 78px;
            margin: 0 auto 9px;
            border-radius: 50%;
            border: 2px solid #cbd4dd;
            background: #dce3e9;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            color: #6d7b8e;
            overflow: hidden;
        }

        .change-photo {
            height: 23px;
            padding: 0 11px;
            background: #edf4ff;
            border: none;
            border-radius: 5px;
            color: #2868ed;
            font-size: 6px;
            cursor: pointer;
        }

        .photo-help {
            margin-top: 8px;
            font-size: 5px;
            color: #8996a8;
            line-height: 1.4;
        }

        /* DETAILS */

        .profile-details {
            flex: 1;
            padding-top: 1px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-bottom: 9px;
        }

        .form-group.full {
            margin-bottom: 12px;
        }

        .form-label {
            display: block;
            font-size: 6px;
            font-weight: 600;
            color: #263347;
            margin-bottom: 4px;
        }

        .input-field {
            width: 100%;
            height: 25px;
            border: 1px solid #dfe5ec;
            border-radius: 4px;
            background: white;
            padding: 0 8px;
            font-size: 6px;
            color: #344257;
            outline: none;
        }

        .input-field:focus {
            border-color: #2868ed;
        }

        /* BUTTONS */

        .button-row {
            display: flex;
            gap: 8px;
        }

        .button {
            height: 24px;
            padding: 0 15px;
            border-radius: 5px;
            font-size: 6px;
            font-weight: 600;
            cursor: pointer;
        }

        .save-button {
            background: #2868ed;
            color: white;
            border: none;
        }

        .cancel-button {
            background: white;
            color: #64748b;
            border: 1px solid #dfe5ec;
        }

        .save-button:hover {
            background: #1e59d0;
        }

        .cancel-button:hover {
            background: #f5f7fa;
        }

        .message {
            display: block;
            margin-top: 7px;
            font-size: 6px;
            color: #e04444;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 800px) {

            body {
                background: #f3f7fb;
            }

            .dashboard-container {
                width: 100%;
                min-height: 100vh;
                height: auto;
                margin: 0;
                border: none;
            }

            .user-info {
                margin-left: 0;
                right: 15px;
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

        <!-- SIDEBAR -->

        <aside class="sidebar">

            <div class="logo">

                <span class="logo-icon"></span>

                <span>Transpo</span>

            </div>

            <nav class="navigation">

                <a href="Dashboard.aspx" class="nav-item">
                    <span class="nav-icon">▦</span>
                    Dashboard
                </a>

                <a href="BookTransportation.aspx" class="nav-item">
                    <span class="nav-icon">→</span>
                    My Trips
                </a>

                <a href="#" class="nav-item">
                    <span class="nav-icon">♡</span>
                    Active Trip
                </a>

                <a href="#" class="nav-item">
                    <span class="nav-icon">▣</span>
                    My Earnings
                </a>

                <a href="#" class="nav-item">
                    <span class="nav-icon">♧</span>
                    My Vehicle
                </a>

                <a href="Profile.aspx" class="nav-item active">
                    <span class="nav-icon">♙</span>
                    Profile
                </a>

                <a href="#" class="nav-item">
                    <span class="nav-icon">⚙</span>
                    Settings
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

            <!-- HEADER -->

            <header class="topbar">

                <div class="page-title">
                    My Profile
                </div>

                <div class="page-description">
                    Manage your personal credentials, fleet stats, and performance verification.
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


                <!-- TABS -->

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


                <!-- PROFILE CARD -->

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

                        <asp:Button
                            ID="btnChangePhoto"
                            runat="server"
                            Text="Change Photo"
                            CssClass="change-photo"
                            OnClick="btnChangePhoto_Click" />

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
                                    CssClass="input-field">
                                </asp:TextBox>

                            </div>


                            <div class="form-group">

                                <label class="form-label">
                                    Email
                                </label>

                                <asp:TextBox
                                    ID="txtEmail"
                                    runat="server"
                                    CssClass="input-field">
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
                                    CssClass="input-field">
                                </asp:TextBox>

                            </div>


                            <div class="form-group">

                                <label class="form-label">
                                    Date of Birth
                                </label>

                                <asp:TextBox
                                    ID="txtDateOfBirth"
                                    runat="server"
                                    CssClass="input-field">
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
                                CssClass="input-field">
                            </asp:TextBox>

                        </div>


                        <!-- BUTTONS -->

                        <div class="button-row">

                            <asp:Button
                                ID="btnSave"
                                runat="server"
                                Text="Save Changes"
                                CssClass="button save-button"
                                OnClick="btnSave_Click" />

                            <asp:Button
                                ID="btnCancel"
                                runat="server"
                                Text="Cancel"
                                CssClass="button cancel-button"
                                OnClick="btnCancel_Click" />

                        </div>


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