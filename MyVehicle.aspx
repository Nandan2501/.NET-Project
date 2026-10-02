<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="MyVehicle.aspx.cs"
    Inherits="WebApplication3.Driver.MyVehicle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>My Vehicle - Transpo</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <link rel="stylesheet"
          href="<%= ResolveUrl("~/CSS/style.css") %>" />

</head>

<body>

<form id="form1" runat="server">

<div class="driver-vehicle-page">

    <!-- ================= SIDEBAR ================= -->

    <aside class="driver-vehicle-sidebar">

        <div class="driver-vehicle-logo">

            <div class="driver-vehicle-logo-icon">
                ▣
            </div>

            <span>Transpo</span>

        </div>


        <nav class="driver-vehicle-navigation">

            <a href="Dashboard.aspx"
               class="driver-vehicle-nav-item">

                <span class="driver-vehicle-nav-icon">▦</span>
                <span>Dashboard</span>

            </a>


            <a href="MyTrips.aspx"
               class="driver-vehicle-nav-item">

                <span class="driver-vehicle-nav-icon">→</span>
                <span>My Trips</span>

            </a>


            <a href="ActiveTrip.aspx"
               class="driver-vehicle-nav-item">

                <span class="driver-vehicle-nav-icon">♡</span>
                <span>Active Trip</span>

            </a>


            <a href="MyEarnings.aspx"
               class="driver-vehicle-nav-item">

                <span class="driver-vehicle-nav-icon">▤</span>
                <span>My Earnings</span>

            </a>


            <a href="MyVehicle.aspx"
               class="driver-vehicle-nav-item active">

                <span class="driver-vehicle-nav-icon">▱</span>
                <span>My Vehicle</span>

            </a>


            <a href="Profile.aspx"
               class="driver-vehicle-nav-item">

                <span class="driver-vehicle-nav-icon">♙</span>
                <span>Profile</span>

            </a>


            <a href="Settings.aspx"
               class="driver-vehicle-nav-item">

                <span class="driver-vehicle-nav-icon">⚙</span>
                <span>Settings</span>

            </a>

        </nav>


        <div class="driver-vehicle-logout">

            <a href="../Login.aspx">

                <span>↪</span>
                <span>Logout</span>

            </a>

        </div>

    </aside>


    <!-- ================= MAIN CONTENT ================= -->

    <main class="driver-vehicle-main">


        <!-- TOP BAR -->

        <header class="driver-vehicle-topbar">

            <div>

                <h1>
                    My Vehicle
                </h1>

                <p>
                    Manage your transport specifications and documents.
                </p>

            </div>


            <div class="driver-vehicle-user">

                <div class="driver-vehicle-avatar">
                    ♟
                </div>

                <div class="driver-vehicle-user-info">

                    <strong>
                        Yashrajsinh
                    </strong>

                    <span>
                        Driver
                    </span>

                </div>

            </div>

        </header>


        <!-- ================= PAGE CONTENT ================= -->

        <section class="driver-vehicle-content">


            <div class="driver-vehicle-grid">


                <!-- ================= ACTIVE TRUCK ================= -->

                <div class="driver-vehicle-card truck-card">

                    <h2>
                        Active Truck Details
                    </h2>


                    <div class="driver-truck-image-container">

                        <img src="../Images/truck.png"
                             alt="Medium Duty Flatbed Truck"
                             class="driver-truck-image"
                             onerror="this.style.display='none';" />

                        <div class="truck-fallback">

                            🚚

                        </div>

                    </div>


                    <div class="driver-vehicle-details">


                        <div class="driver-vehicle-detail-row">

                            <span>
                                Plate Number
                            </span>

                            <strong>
                                GJ-01-TA-1234
                            </strong>

                        </div>


                        <div class="driver-vehicle-detail-row">

                            <span>
                                Vehicle Type
                            </span>

                            <strong>
                                Medium Duty Flatbed
                            </strong>

                        </div>


                        <div class="driver-vehicle-detail-row">

                            <span>
                                Max Capacity
                            </span>

                            <strong>
                                5.5 Tons
                            </strong>

                        </div>


                        <div class="driver-vehicle-detail-row">

                            <span>
                                Insurance Valid Till
                            </span>

                            <strong>
                                30 Sep 2026
                            </strong>

                        </div>


                    </div>

                </div>


                <!-- ================= DOCUMENTS ================= -->

                <div class="driver-vehicle-card documents-card">

                    <h2>
                        Uploaded Documents
                    </h2>


                    <div class="driver-document-list">


                        <div class="driver-document-item">

                            <div class="driver-document-icon">
                                📎
                            </div>

                            <div class="driver-document-info">

                                <strong>
                                    Driver's License
                                </strong>

                                <span>
                                    gj845655655
                                </span>

                            </div>

                        </div>


                        <div class="driver-document-item">

                            <div class="driver-document-icon">
                                📎
                            </div>

                            <div class="driver-document-info">

                                <strong>
                                    Vehicle Insurance policy
                                </strong>

                                <span>
                                    30-07-2026
                                </span>

                            </div>

                        </div>


                        <div class="driver-document-item">

                            <div class="driver-document-icon">
                                📎
                            </div>

                            <div class="driver-document-info">

                                <strong>
                                    Pollution Certificate (PUC)
                                </strong>

                                <span>
                                    30-1-2027
                                </span>

                            </div>

                        </div>


                    </div>

                </div>


            </div>

        </section>

    </main>

</div>

</form>

</body>

</html>