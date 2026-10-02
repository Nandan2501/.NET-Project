<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ActiveTrip.aspx.cs"
    Inherits="WebApplication3.Driver.ActiveTrip" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Active Trip Tracking - Transpo</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <link rel="stylesheet"
          href="<%= ResolveUrl("~/CSS/style.css") %>" />

</head>

<body>

<form id="form1" runat="server">

<div class="driver-active-page">

    <!-- SIDEBAR -->

    <aside class="driver-active-sidebar">

        <div class="driver-active-logo">

            <div class="driver-active-logo-icon">
                ▣
            </div>

            <span>Transpo</span>

        </div>


        <nav class="driver-active-navigation">

            <a href="Dashboard.aspx"
               class="driver-active-nav-item">

                <span class="driver-active-nav-icon">▦</span>
                <span>Dashboard</span>

            </a>


            <a href="MyTrips.aspx"
               class="driver-active-nav-item">

                <span class="driver-active-nav-icon">→</span>
                <span>My Trips</span>

            </a>


            <a href="ActiveTrip.aspx"
               class="driver-active-nav-item active">

                <span class="driver-active-nav-icon">♡</span>
                <span>Active Trip</span>

            </a>


            <a href="MyEarnings.aspx"
               class="driver-active-nav-item">

                <span class="driver-active-nav-icon">▤</span>
                <span>My Earnings</span>

            </a>


            <a href="MyVehicle.aspx"
               class="driver-active-nav-item">

                <span class="driver-active-nav-icon">▱</span>
                <span>My Vehicle</span>

            </a>


            <a href="Profile.aspx"
               class="driver-active-nav-item">

                <span class="driver-active-nav-icon">♙</span>
                <span>Profile</span>

            </a>


            <a href="Settings.aspx"
               class="driver-active-nav-item">

                <span class="driver-active-nav-icon">⚙</span>
                <span>Settings</span>

            </a>

        </nav>


        <div class="driver-active-logout">

            <a href="../Login.aspx">

                <span>↪</span>
                <span>Logout</span>

            </a>

        </div>

    </aside>


    <!-- MAIN CONTENT -->

    <main class="driver-active-main">


        <!-- TOP BAR -->

        <header class="driver-active-topbar">

            <div>

                <h1>
                    Active Trip Tracking
                </h1>

                <p>
                    Monitor current live transport progress.
                </p>

            </div>


            <div class="driver-active-user">

                <div class="driver-active-avatar">
                    ♟
                </div>

                <div class="driver-active-user-info">

                    <strong>
                        Yashrajsinh
                    </strong>

                    <span>
                        Driver
                    </span>

                </div>

            </div>

        </header>


        <!-- CONTENT -->

        <section class="driver-active-content">


            <!-- TRACKING CARD -->

            <div class="driver-active-card tracking-card">

                <div class="tracking-label">
                    TRACKING ID
                </div>

                <div class="tracking-id">
                    TRP123456789
                </div>


                <div class="tracking-divider"></div>


                <div class="tracking-route">

                    <div class="tracking-point">

                        <span class="tracking-dot blue-dot"></span>

                        <div>

                            <div class="tracking-location">
                                Ahmedabad Hub
                            </div>

                            <div class="tracking-time">
                                10:00 AM
                            </div>

                        </div>

                    </div>


                    <div class="tracking-line"></div>


                    <div class="tracking-point">

                        <span class="tracking-dot green-dot"></span>

                        <div>

                            <div class="tracking-location">
                                Surat Delivery Office
                            </div>

                            <div class="tracking-time">
                                01:30 PM
                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <!-- STATISTICS CARD -->

            <div class="driver-active-card statistics-card">

                <h2>
                    Statistics
                </h2>


                <div class="statistics-row">

                    <span>
                        Speed limit
                    </span>

                    <strong>
                        78 km/h
                    </strong>

                </div>


                <div class="statistics-row">

                    <span>
                        Cargo weight
                    </span>

                    <strong>
                        4.2 Tons
                    </strong>

                </div>

            </div>


        </section>

    </main>

</div>

</form>

</body>

</html>