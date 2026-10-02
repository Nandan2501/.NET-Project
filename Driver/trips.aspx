<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="trips.aspx.cs"
    Inherits="WebApplication3.Driver.MyTrips" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>My Trips - Transpo</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <link rel="stylesheet"
          href="<%= ResolveUrl("~/CSS/style.css") %>" />

</head>
<body>

<form id="form1" runat="server">

<div class="driver-trips-page">

    <!-- =====================================================
         SIDEBAR
    ====================================================== -->

    <aside class="driver-trips-sidebar">

        <div class="driver-trips-logo">

            <div class="driver-trips-logo-icon">
                ▣
            </div>

            <span>Transpo</span>

        </div>


        <nav class="driver-trips-navigation">

            <a href="Dashboard.aspx"
               class="driver-trips-nav-item">

                <span class="driver-trips-nav-icon">▦</span>

                <span>Dashboard</span>

            </a>


            <a href="MyTrips.aspx"
               class="driver-trips-nav-item active">

                <span class="driver-trips-nav-icon">→</span>

                <span>My Trips</span>

            </a>


            <a href="ActiveTrip.aspx"
               class="driver-trips-nav-item">

                <span class="driver-trips-nav-icon">♡</span>

                <span>Active Trip</span>

            </a>


            <a href="MyEarnings.aspx"
               class="driver-trips-nav-item">

                <span class="driver-trips-nav-icon">▤</span>

                <span>My Earnings</span>

            </a>


            <a href="MyVehicle.aspx"
               class="driver-trips-nav-item">

                <span class="driver-trips-nav-icon">▱</span>

                <span>My Vehicle</span>

            </a>


            <a href="Profile.aspx"
               class="driver-trips-nav-item">

                <span class="driver-trips-nav-icon">♙</span>

                <span>Profile</span>

            </a>


            <a href="Settings.aspx"
               class="driver-trips-nav-item">

                <span class="driver-trips-nav-icon">⚙</span>

                <span>Settings</span>

            </a>

        </nav>


        <div class="driver-trips-logout">

            <a href="../Login.aspx">

                <span>↪</span>

                <span>Logout</span>

            </a>

        </div>

    </aside>


    <!-- =====================================================
         MAIN
    ====================================================== -->

    <main class="driver-trips-main">


        <!-- TOP BAR -->

        <header class="driver-trips-topbar">

            <div>

                <h1>
                    My Trips
                </h1>

                <p>
                    Manage and monitor all your transport history.
                </p>

            </div>


            <div class="driver-trips-user">

                <div class="driver-trips-avatar">
                    ♟
                </div>

                <div class="driver-trips-user-info">

                    <strong>
                        Yashrajsinh
                    </strong>

                    <span>
                        Driver
                    </span>

                </div>

            </div>

        </header>


        <!-- =====================================================
             CONTENT
        ====================================================== -->

        <section class="driver-trips-content">


            <!-- FILTER -->

            <div class="driver-trips-filter">

                <button type="button"
                        class="driver-trips-filter-active">
                    All Trips
                </button>

            </div>


            <!-- =================================================
                 TRIPS TABLE
            ================================================== -->

            <div class="driver-trips-table-card">

                <div class="driver-trips-table-wrapper">

                    <table class="driver-trips-table">

                        <thead>

                            <tr>

                                <th>
                                    Trip ID
                                </th>

                                <th>
                                    Route
                                </th>

                                <th>
                                    Departure Time
                                </th>

                                <th>
                                    Status
                                </th>

                                <th>
                                    Distance
                                </th>

                                <th>
                                    Earnings
                                </th>

                            </tr>

                        </thead>


                        <tbody>

                            <tr>

                                <td class="trip-id">
                                    TRP123456789
                                </td>

                                <td class="trip-route">
                                    Ahmedabad → Surat
                                </td>

                                <td>
                                    21 May 2024, 10:00 AM
                                </td>

                                <td>

                                    <span class="trip-status in-transit">
                                        In Transit
                                    </span>

                                </td>

                                <td>
                                    263 km
                                </td>

                                <td class="trip-earnings">
                                    ₹2000
                                </td>

                            </tr>


                            <tr>

                                <td class="trip-id">
                                    TRP987654321
                                </td>

                                <td class="trip-route">
                                    Vadodara → Mumbai
                                </td>

                                <td>
                                    18 May 2024, 08:30 AM
                                </td>

                                <td>

                                    <span class="trip-status delivered">
                                        Delivered
                                    </span>

                                </td>

                                <td>
                                    410 km
                                </td>

                                <td class="trip-earnings">
                                    ₹3500
                                </td>

                            </tr>


                            <tr>

                                <td class="trip-id">
                                    TRP456789123
                                </td>

                                <td class="trip-route">
                                    Mumbai → Ahmedabad
                                </td>

                                <td>
                                    15 May 2024, 02:15 PM
                                </td>

                                <td>

                                    <span class="trip-status cancelled">
                                        Cancelled
                                    </span>

                                </td>

                                <td>
                                    656 km
                                </td>

                                <td class="trip-earnings">
                                    ₹4500
                                </td>

                            </tr>

                        </tbody>

                    </table>

                </div>

            </div>

        </section>

    </main>

</div>

</form>

</body>

</html>