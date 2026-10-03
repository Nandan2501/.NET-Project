<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs"
    Inherits="WebApplication3.ChangePassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Change Password</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

    <link href="CSS/style.css" rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

<div class="cp-layout">

    <!-- SIDEBAR -->

    <aside class="cp-sidebar">

        <div class="cp-logo">
            <div class="cp-logo-icon">🚚</div>
            <span>Transpo</span>
        </div>

        <nav class="cp-navigation">

            <a href="Dashboard.aspx" class="cp-nav-item">
                <span class="cp-nav-icon">▦</span>
                <span>Dashboard</span>
            </a>

            <a href="BookTransportation.aspx" class="cp-nav-item">
                <span class="cp-nav-icon">♧</span>
                <span>Book Transportation</span>
            </a>

            <a href="MyBookings.aspx" class="cp-nav-item">
                <span class="cp-nav-icon">☷</span>
                <span>My Bookings</span>
            </a>

            <a href="Payments.aspx" class="cp-nav-item">
                <span class="cp-nav-icon">▱</span>
                <span>Payments</span>
            </a>

            <a href="AddressBook.aspx" class="cp-nav-item">
                <span class="cp-nav-icon">▣</span>
                <span>Address Book</span>
            </a>

            <a href="Profile.aspx" class="cp-nav-item active">
                <span class="cp-nav-icon">♙</span>
                <span>Profile</span>
            </a>

        </nav>

        <a href="Login.aspx" class="dash-logout">
    ↪ &nbsp; Logout
</a>

    </aside>


    <!-- MAIN -->

    <main class="cp-main">

        <!-- TOPBAR -->

        <header class="cp-topbar">

            <h1>My Profile</h1>

            <div class="cp-user">

                <div class="cp-user-avatar">
                    👤
                </div>

                <div class="cp-user-info">
                    <strong>Nandan Nasit</strong>
                    <span>Standard Customer</span>
                </div>

            </div>

        </header>


        <!-- CONTENT -->

        <section class="cp-content">

            <!-- TABS -->

            <div class="cp-tabs">

                <a href="Profile.aspx"
                   class="cp-tab">
                    Personal Information
                </a>

                <a href="ChangePassword.aspx"
                   class="cp-tab active">
                    Change Password
                </a>

                

            </div>


            <!-- PASSWORD CARD -->

            <div class="cp-card">

                <!-- LEFT PROFILE -->

                <div class="cp-profile">

                    <div class="cp-photo">

                        <img src="https://randomuser.me/api/portraits/men/32.jpg"
                             alt="Profile Photo" />

                    </div>

                    <h2>Nandan Nasit</h2>

                    <p>
                        Manage your security settings and<br />
                        password
                    </p>

                </div>


                <!-- RIGHT FORM -->

                <div class="cp-form">

                    <!-- CURRENT PASSWORD -->

                    <div class="cp-field">

                        <label>
                            Current Password
                        </label>

                        <div class="cp-password-box">

                            <asp:TextBox
                                ID="txtCurrentPassword"
                                runat="server"
                                TextMode="Password"
                                CssClass="cp-input"
                                placeholder="••••••••">
                            </asp:TextBox>

                            <span class="cp-eye">
                                ◉
                            </span>

                        </div>

                    </div>


                    <!-- NEW PASSWORD -->

                    <div class="cp-field">

                        <label>
                            New Password
                        </label>

                        <div class="cp-password-box">

                            <asp:TextBox
                                ID="txtNewPassword"
                                runat="server"
                                TextMode="Password"
                                CssClass="cp-input"
                                placeholder="Enter new password">
                            </asp:TextBox>

                            <span class="cp-eye">
                                ◉
                            </span>

                        </div>

                        <small>
                            Minimum 8 characters with at least one number
                            and special character.
                        </small>

                    </div>


                    <!-- CONFIRM PASSWORD -->

                    <div class="cp-field">

                        <label>
                            Confirm New Password
                        </label>

                        <div class="cp-password-box">

                            <asp:TextBox
                                ID="txtConfirmPassword"
                                runat="server"
                                TextMode="Password"
                                CssClass="cp-input"
                                placeholder="Confirm new password">
                            </asp:TextBox>

                            <span class="cp-eye">
                                ◉
                            </span>

                        </div>

                    </div>


                    <!-- BUTTON -->

                    <div class="cp-button-area">

                        <asp:Button
                            ID="btnUpdatePassword"
                            runat="server"
                            Text="Update Password"
                            CssClass="cp-update-btn"
                            OnClick="btnUpdatePassword_Click" />

                    </div>


                    <asp:Label
                        ID="lblMessage"
                        runat="server"
                        CssClass="cp-message">
                    </asp:Label>

                </div>

            </div>

        </section>

    </main>

</div>

</form>

</body>

</html>