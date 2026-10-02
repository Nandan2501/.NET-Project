<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs"
    Inherits="WebApplication3.Driver.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>My Profile - Transpo</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <link rel="stylesheet"
          href="../CSS/style.css" />

</head>

<body>

<form id="form1" runat="server">

<div class="driver-profile-page">

    <!-- ================= SIDEBAR ================= -->

    <aside class="driver-profile-sidebar">

        <div class="driver-profile-logo">

            <div class="driver-profile-logo-icon">
                ▣
            </div>

            <span>Transpo</span>

        </div>


        <nav class="driver-profile-navigation">

            <a href="Dashboard.aspx"
               class="driver-profile-nav-item">

                <span class="driver-profile-nav-icon">▦</span>
                <span>Dashboard</span>

            </a>


            <a href="MyTrips.aspx"
               class="driver-profile-nav-item">

                <span class="driver-profile-nav-icon">→</span>
                <span>My Trips</span>

            </a>


            <a href="ActiveTrip.aspx"
               class="driver-profile-nav-item">

                <span class="driver-profile-nav-icon">♡</span>
                <span>Active Trip</span>

            </a>


            <a href="MyEarnings.aspx"
               class="driver-profile-nav-item">

                <span class="driver-profile-nav-icon">▤</span>
                <span>My Earnings</span>

            </a>


            <a href="MyVehicle.aspx"
               class="driver-profile-nav-item">

                <span class="driver-profile-nav-icon">▱</span>
                <span>My Vehicle</span>

            </a>


            <a href="Profile.aspx"
               class="driver-profile-nav-item active">

                <span class="driver-profile-nav-icon">♙</span>
                <span>Profile</span>

            </a>


            <a href="Settings.aspx"
               class="driver-profile-nav-item">

                <span class="driver-profile-nav-icon">⚙</span>
                <span>Settings</span>

            </a>

        </nav>


        <div class="driver-profile-logout">

            <a href="../Login.aspx">

                <span>↪</span>
                <span>Logout</span>

            </a>

        </div>

    </aside>


    <!-- ================= MAIN CONTENT ================= -->

    <main class="driver-profile-main">


        <!-- TOP BAR -->

        <header class="driver-profile-topbar">

            <div>

                <h1>
                    My Profile
                </h1>

                <p>
                    Manage your personal credentials, fleet stats, and performance verification.
                </p>

            </div>


            <div class="driver-profile-user">

                <div class="driver-profile-avatar-small">
                    ♟
                </div>

                <div class="driver-profile-user-info">

                    <strong>
                        Yashrajsinh
                    </strong>

                    <span>
                        Driver
                    </span>

                </div>

            </div>

        </header>


        <!-- ================= PROFILE CONTENT ================= -->

        <section class="driver-profile-content">


            <div class="driver-profile-grid">


                <!-- ================= LEFT PROFILE CARD ================= -->

                <div class="driver-profile-card driver-profile-summary">


                    <div class="driver-profile-photo-area">

                        <div class="driver-profile-photo">

                            <img src="../Images/driver.png"
                                 alt="Driver Profile"
                                 onerror="this.style.display='none';" />

                            <span class="driver-profile-photo-fallback">
                                👨
                            </span>

                        </div>


                        <div class="driver-profile-name">
                            Yashrajsinh
                        </div>


                        <div class="driver-verified">
                            Verified Driver
                        </div>

                    </div>


                    <div class="driver-profile-divider"></div>


                    <!-- Rating -->

                    <div class="driver-rating">

                        <span class="driver-rating-star">
                            ☆
                        </span>

                        <strong>
                            4.9
                        </strong>

                        <span class="driver-rating-count">
                            (428 ratings)
                        </span>

                    </div>


                    <div class="driver-profile-divider"></div>


                    <!-- Driver Details -->

                    <div class="driver-summary-details">


                        <div class="driver-summary-row">

                            <span>
                                Operator License
                            </span>

                            <strong>
                                gj-451646114
                            </strong>

                        </div>


                        <div class="driver-summary-row">

                            <span>
                                Join Date
                            </span>

                            <strong>
                                12 Feb 2023
                            </strong>

                        </div>


                        <div class="driver-summary-row">

                            <span>
                                Assigned Vehicle
                            </span>

                            <strong class="vehicle-number">
                                GJ-12-AB-1234
                            </strong>

                        </div>


                    </div>

                </div>


                <!-- ================= RIGHT SIDE ================= -->

                <div class="driver-profile-right">


                    <!-- PERSONAL INFORMATION -->

                    <div class="driver-profile-card driver-information-card">

                        <h2>
                            Personal Information
                        </h2>


                        <div class="driver-information-grid">


                            <div class="driver-information-item">

                                <label>
                                    FULL NAME
                                </label>

                                <span>
                                    yashraj
                                </span>

                            </div>


                            <div class="driver-information-item">

                                <label>
                                    EMAIL ADDRESS
                                </label>

                                <span>
                                    yashraj485@gmail.com
                                </span>

                            </div>


                            <div class="driver-information-item">

                                <label>
                                    PHONE NUMBER
                                </label>

                                <span>
                                    +919327468707
                                </span>

                            </div>


                            <div class="driver-information-item">

                                <label>
                                    EMERGENCY CONTACT
                                </label>

                                <span>
                                    +919327468707
                                </span>

                            </div>


                            <div class="driver-information-item full-width">

                                <label>
                                    RESIDENTIAL ADDRESS
                                </label>

                                <span>
                                    Suite 400, Ahmedabad Logistic Center, Ahmedabad, India
                                </span>

                            </div>


                        </div>

                    </div>


                    <!-- PERFORMANCE -->

                    <div class="driver-profile-card driver-performance-card">

                        <h2>
                            Performance
                        </h2>


                        <div class="driver-performance-grid">


                            <div class="driver-performance-item">

                                <div class="driver-performance-icon">
                                    ♧
                                </div>

                                <div>

                                    <strong>
                                        1,842
                                    </strong>

                                    <span>
                                        Trips Completed
                                    </span>

                                </div>

                            </div>


                            <div class="driver-performance-item">

                                <div class="driver-performance-icon">
                                    ✓
                                </div>

                                <div>

                                    <strong>
                                        98.4%
                                    </strong>

                                    <span>
                                        Acceptance Rate
                                    </span>

                                </div>

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