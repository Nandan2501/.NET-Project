<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ConfirmBook.aspx.cs"
    Inherits="WebApplication3.BookingSuccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Booking Confirmed</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <!-- Common CSS -->
    <link href="CSS/style.css" rel="stylesheet" />

    <!-- Page Specific CSS -->
    <link href="CSS/bookingsuccess.css" rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

    <div class="dashboard-container">


        <!-- =====================================================
             SIDEBAR
        ====================================================== -->

        <aside class="sidebar">

            <div class="logo">

                <span class="logo-icon"></span>

                <span>Transpo</span>

            </div>


            <nav class="navigation">

                <a href="Dashboard.aspx"
                   class="nav-item">

                    <span class="nav-icon">▦</span>

                    <span>Dashboard</span>

                </a>


                <a href="BookTransportation.aspx"
                   class="nav-item active">

                    <span class="nav-icon">♧</span>

                    <span>Book Transportation</span>

                </a>


                <a href="Bookings.aspx"
                   class="nav-item">

                    <span class="nav-icon">▤</span>

                    <span>My Bookings</span>

                </a>


                <a href="Payments.aspx"
                   class="nav-item">

                    <span class="nav-icon">▭</span>

                    <span>Payments</span>

                </a>


                <a href="AddressBook.aspx"
                   class="nav-item">

                    <span class="nav-icon">□</span>

                    <span>Address Book</span>

                </a>


                <a href="Profile.aspx"
                   class="nav-item">

                    <span class="nav-icon">♙</span>

                    <span>Profile</span>

                </a>

            </nav>


            
            <a href="Login.aspx" class="dash-logout">
    ↪ &nbsp; Logout
</a>
            

        </aside>



        <!-- =====================================================
             MAIN CONTENT
        ====================================================== -->

        <main class="main-content">


            <!-- TOP BAR -->

            <header class="topbar">

                <div class="page-title">
                    Book Transportation
                </div>


                <div class="user-info">

                    <div class="profile-image">
                        👤
                    </div>


                    <div class="user-details">

                        <div class="user-name">
                            Nandan Nasit
                        </div>

                        <div class="user-role">
                            Standard Customer
                        </div>

                    </div>

                </div>

            </header>



            <!-- =================================================
                 CONTENT
            ================================================== -->

            <section class="content">


                <!-- STEPPER -->

                <div class="stepper">


                    <div class="step completed">

                        <span class="step-number">
                            ✓
                        </span>

                        <span>
                            Route Details
                        </span>

                    </div>


                    <span class="step-arrow">
                        →
                    </span>


                    <div class="step completed">

                        <span class="step-number">
                            ✓
                        </span>

                        <span>
                            Load Details
                        </span>

                    </div>


                    <span class="step-arrow">
                        →
                    </span>


                    <div class="step completed">

                        <span class="step-number">
                            ✓
                        </span>

                        <span>
                            Review &amp; Confirm
                        </span>

                    </div>

                </div>



                <!-- =================================================
                     CONFIRMATION AREA
                ================================================== -->

                <div class="confirmation-area">


                    <!-- SUCCESS ICON -->

                    <div class="success-icon">
                        ✓
                    </div>


                    <!-- TITLE -->

                    <h1 class="success-title">
                        Booking Confirmed!
                    </h1>


                    <p class="success-description">
                        Your transportation has been successfully booked.
                    </p>



                    <!-- =================================================
                         BOOKING INFORMATION
                    ================================================== -->

                    <div class="booking-info">


                        <div class="booking-info-item">

                            <div class="info-heading">
                                BOOKING ID
                            </div>

                            <asp:Label
                                ID="lblBookingId"
                                runat="server"
                                CssClass="info-value">

                                BK-2026-08174

                            </asp:Label>

                        </div>


                        <div class="booking-info-item">

                            <div class="info-heading">
                                STATUS
                            </div>

                            <span class="confirmed-status">
                                Confirmed
                            </span>

                        </div>


                        <div class="booking-info-item">

                            <div class="info-heading">
                                ESTIMATED PICKUP
                            </div>

                            <asp:Label
                                ID="lblPickupDate"
                                runat="server"
                                CssClass="info-value">

                                Monday, 17 August 2026

                            </asp:Label>

                        </div>

                    </div>



                    <!-- =================================================
                         BOOKING SUMMARY
                    ================================================== -->

                    <div class="summary-card">


                        <h2 class="summary-title">
                            Booking Summary Details
                        </h2>


                        <!-- ROUTE -->

                        <div class="summary-row">

                            <div class="summary-left">

                                <span class="summary-icon">
                                    ●
                                </span>

                                <span>
                                    Route Path
                                </span>

                            </div>


                            <asp:Label
                                ID="lblRoute"
                                runat="server"
                                CssClass="summary-value">

                                Rajkot, Gujarat → Baroda, Gujarat

                            </asp:Label>

                        </div>


                        <!-- VEHICLE -->

                        <div class="summary-row">

                            <div class="summary-left">

                                <span class="summary-icon">
                                    ▱
                                </span>

                                <span>
                                    Vehicle Type
                                </span>

                            </div>


                            <asp:Label
                                ID="lblVehicle"
                                runat="server"
                                CssClass="summary-value">

                                Medium Truck (6-Wheeler)

                            </asp:Label>

                        </div>


                        <!-- LOAD -->

                        <div class="summary-row">

                            <div class="summary-left">

                                <span class="summary-icon">
                                    ◈
                                </span>

                                <span>
                                    Load Specifications
                                </span>

                            </div>


                            <asp:Label
                                ID="lblLoad"
                                runat="server"
                                CssClass="summary-value">

                                12 Packages (850 kg Total)

                            </asp:Label>

                        </div>


                        <!-- COST -->

                        <div class="cost-row">

                            <span>
                                Final Estimated Cost
                            </span>

                            <strong>
                                ₹12,500
                            </strong>

                        </div>

                    </div>



                    <!-- =================================================
                         BUTTONS
                    ================================================== -->

                    <div class="action-buttons">

                        <asp:Button
                            ID="btnBookAnother"
                            runat="server"
                            Text="Book Another"
                            CssClass="book-another-button"
                            OnClick="btnBookAnother_Click" />


                        <asp:Button
                            ID="btnViewBookings"
                            runat="server"
                            Text="View My Bookings"
                            CssClass="view-bookings-button"
                            OnClick="btnMyBookings_Click" />

                    </div>


                </div>

            </section>

        </main>

    </div>

</form>

</body>

</html>