<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="WebApplication3.Driver.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Driver Dashboard - Transpo</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <!-- Common CSS -->
    <link href="../CSS/style.css" rel="stylesheet" />

    <!-- Driver Dashboard CSS -->
    <link href="../CSS/ddashboard.css" rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

    <div class="driver-page">

        <!-- =====================================================
             SIDEBAR
        ====================================================== -->

        <aside class="driver-sidebar">

            <!-- LOGO -->

            <div class="driver-logo">

                <div class="driver-logo-icon">
                    ▣
                </div>

                <span>Transpo</span>

            </div>


            <!-- NAVIGATION -->

            <nav class="driver-navigation">

                <a href="Dashboard.aspx"
                   class="driver-nav-item active">

                    <span class="driver-nav-icon">▦</span>

                    <span>Dashboard</span>

                </a>


                <a href="MyTrips.aspx"
                   class="driver-nav-item">

                    <span class="driver-nav-icon">→</span>

                    <span>My Trips</span>

                </a>


                <a href="ActiveTrip.aspx"
                   class="driver-nav-item">

                    <span class="driver-nav-icon">♡</span>

                    <span>Active Trip</span>

                </a>


                <a href="MyEarnings.aspx"
                   class="driver-nav-item">

                    <span class="driver-nav-icon">▤</span>

                    <span>My Earnings</span>

                </a>


                <a href="MyVehicle.aspx"
                   class="driver-nav-item">

                    <span class="driver-nav-icon">▱</span>

                    <span>My Vehicle</span>

                </a>


                <a href="Profile.aspx"
                   class="driver-nav-item">

                    <span class="driver-nav-icon">♙</span>

                    <span>Profile</span>

                </a>


                <a href="Settings.aspx"
                   class="driver-nav-item">

                    <span class="driver-nav-icon">⚙</span>

                    <span>Settings</span>

                </a>

            </nav>


            <!-- LOGOUT -->

            <div class="driver-logout">

                <a href="../Login.aspx">

                    <span>↪</span>

                    <span>Logout</span>

                </a>

            </div>

        </aside>


        <!-- =====================================================
             MAIN CONTENT
        ====================================================== -->

        <main class="driver-main">


            <!-- TOP BAR -->

            <header class="driver-topbar">

                <div class="driver-welcome">

                    <h1>
                        Welcome Back, Yashrajsinh 👋
                    </h1>

                    <p>
                        Here is your fleet performance for today.
                    </p>

                </div>


                <!-- DRIVER PROFILE -->

                <div class="driver-user">

                    <div class="driver-user-photo">
                        ♟
                    </div>

                    <div class="driver-user-details">

                        <strong>
                            Yashrajsinh
                        </strong>

                        <span>
                            Driver
                        </span>

                    </div>

                </div>

            </header>


            <!-- =================================================
                 CONTENT
            ================================================== -->

            <section class="driver-content">


                <!-- =================================================
                     STAT CARDS
                ================================================== -->

                <div class="driver-stats">


                    <!-- ACTIVE TRIPS -->

                    <div class="driver-stat-card">

                        <span class="driver-stat-title">
                            Active Trips
                        </span>

                        <strong class="driver-stat-value">
                            3
                        </strong>

                    </div>


                    <!-- TOTAL DISTANCE -->

                    <div class="driver-stat-card">

                        <span class="driver-stat-title">
                            Total Distance
                        </span>

                        <strong class="driver-stat-value">
                            320 km
                        </strong>

                    </div>


                    <!-- WEEKLY EARNINGS -->

                    <div class="driver-stat-card">

                        <span class="driver-stat-title">
                            Weekly Earnings
                        </span>

                        <strong class="driver-stat-value earnings">
                            ₹4,500
                        </strong>

                    </div>

                </div>


                <!-- =================================================
                     ACTIVE DELIVERY ROUTE
                ================================================== -->

                <div class="active-route-card">

                    <h2>
                        Active Delivery Route
                    </h2>


                    <div class="route-box">


                        <!-- START LOCATION -->

                        <div class="route-location">

                            <div class="route-marker start-marker">
                            </div>

                            <div class="route-location-info">

                                <strong>
                                    Ahmedabad Hub
                                </strong>

                            </div>

                            <span class="route-time">
                                10:00 AM
                            </span>

                        </div>


                        <!-- ROUTE LINE -->

                        <div class="route-line">
                        </div>


                        <!-- DESTINATION -->

                        <div class="route-location">

                            <div class="route-marker end-marker">
                            </div>

                            <div class="route-location-info">

                                <strong>
                                    Surat Delivery Office
                                </strong>

                            </div>

                            <span class="route-time">
                                01:30 PM (Est.)
                            </span>

                        </div>

                    </div>

                </div>

            </section>

        </main>

    </div>

</form>

</body>

</html>