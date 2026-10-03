<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Settings.aspx.cs"
    Inherits="WebApplication3.Driver.Settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Website Settings - Transpo</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <link rel="stylesheet"
          href="../CSS/style.css" />

</head>

<body>

<form id="form1" runat="server">

<div class="driver-settings-page">

    <!-- ================= SIDEBAR ================= -->

    <aside class="driver-settings-sidebar">

        <div class="driver-settings-logo">

            <div class="driver-settings-logo-icon">
                ▣
            </div>

            <span>Transpo</span>

        </div>


        <nav class="driver-settings-navigation">

            <a href="Dashboard.aspx"
               class="driver-settings-nav-item">

                <span class="driver-settings-nav-icon">▦</span>
                <span>Dashboard</span>

            </a>


            <a href=trips.aspx"
               class="driver-settings-nav-item">

                <span class="driver-settings-nav-icon">→</span>
                <span>My Trips</span>

            </a>


            <a href="ActiveTrip.aspx"
               class="driver-settings-nav-item">

                <span class="driver-settings-nav-icon">♡</span>
                <span>Active Trip</span>

            </a>


            <a href="MyEarnings.aspx"
               class="driver-settings-nav-item">

                <span class="driver-settings-nav-icon">▤</span>
                <span>My Earnings</span>

            </a>


            <a href="MyVehicle.aspx"
               class="driver-settings-nav-item">

                <span class="driver-settings-nav-icon">▱</span>
                <span>My Vehicle</span>

            </a>


            <a href="Profile.aspx"
               class="driver-settings-nav-item">

                <span class="driver-settings-nav-icon">♙</span>
                <span>Profile</span>

            </a>


            <a href="Settings.aspx"
               class="driver-settings-nav-item active">

                <span class="driver-settings-nav-icon">⚙</span>
                <span>Settings</span>

            </a>

        </nav>


        <div class="driver-settings-logout">

            <a href="../Login.aspx">

                <span>↪</span>
                <span>Logout</span>

            </a>

        </div>

    </aside>


    <!-- ================= MAIN ================= -->

    <main class="driver-settings-main">


        <!-- TOP BAR -->

        <header class="driver-settings-topbar">

            <div>

                <h1>
                     Settings
                </h1>

                <p>
                    Configure system preferences, notification methods and security parameters.
                </p>

            </div>


            <div class="driver-settings-user">

                <div class="driver-settings-avatar">
                    ♟
                </div>

                <div class="driver-settings-user-info">

                    <strong>
                        Yashrajsinh
                    </strong>

                    <span>
                        Driver
                    </span>

                </div>

            </div>

        </header>


        <!-- ================= CONTENT ================= -->

        <section class="driver-settings-content">


            <div class="driver-settings-grid">


                <!-- ================= LEFT COLUMN ================= -->

                <div class="driver-settings-left">


                    <!-- ACCOUNT PREFERENCES -->

                    <div class="driver-settings-card preferences-card">

                        <h2>
                            Account Preferences
                        </h2>


                        <div class="driver-settings-field">

                            <label>
                                SYSTEM LANGUAGE
                            </label>

                            <select class="driver-settings-input">

                                <option>
                                    English (United States)
                                </option>

                                <option>
                                    English (India)
                                </option>

                                <option>
                                    Hindi
                                </option>

                                <option>
                                    Gujarati
                                </option>

                            </select>

                        </div>


                        <div class="driver-settings-field">

                            <label>
                                TIME ZONE
                            </label>

                            <select class="driver-settings-input">

                                <option>
                                    GMT+5:30 (India Standard Time)
                                </option>

                                <option>
                                    GMT+0:00 (UTC)
                                </option>

                                <option>
                                    GMT-5:00 (Eastern Time)
                                </option>

                            </select>

                        </div>

                    </div>


                    <!-- SECURITY -->

                    <div class="driver-settings-card security-card">

                        <h2>
                            Security &amp; Password
                        </h2>


                        <div class="driver-settings-field">

                            <label>
                                CURRENT PASSWORD
                            </label>

                            <asp:TextBox
                                ID="txtCurrentPassword"
                                runat="server"
                                TextMode="Password"
                                CssClass="driver-settings-input"
                                placeholder="Enter current password">
                            </asp:TextBox>

                        </div>


                        <div class="driver-settings-field">

                            <label>
                                NEW PASSWORD
                            </label>

                            <asp:TextBox
                                ID="txtNewPassword"
                                runat="server"
                                TextMode="Password"
                                CssClass="driver-settings-input"
                                placeholder="Enter new strong password">
                            </asp:TextBox>

                        </div>


                        <div class="driver-settings-field">

                            <label>
                                RE-ENTER NEW PASSWORD
                            </label>

                            <asp:TextBox
                                ID="txtConfirmPassword"
                                runat="server"
                                TextMode="Password"
                                CssClass="driver-settings-input"
                                placeholder="Re-Enter new strong password">
                            </asp:TextBox>

                        </div>


                        <asp:Button
                            ID="btnUpdatePassword"
                            runat="server"
                            Text="Update Password"
                            CssClass="driver-settings-update-btn"
                            OnClick="btnUpdatePassword_Click" />

                    </div>


                </div>


                <!-- ================= RIGHT COLUMN ================= -->

                <div class="driver-settings-right">


                    

                    


                </div>


            </div>

        </section>

    </main>

</div>

</form>

</body>

</html>