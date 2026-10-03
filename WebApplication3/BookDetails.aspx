<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="BookingDetails.aspx.cs"
    Inherits="WebApplication3.BookingDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Booking Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="CSS/style.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

<div class="bd-layout">

    <!-- ================= SIDEBAR ================= -->

    <aside class="bd-sidebar">

        <div class="bd-logo">
            <div class="bd-logo-icon"></div>
            <span>Transpo</span>
        </div>

        <nav class="bd-navigation">

            <a href="Dashboard.aspx" class="bd-nav-item">
                <span class="bd-nav-icon">▦</span>
                <span>Dashboard</span>
            </a>

            <a href="BookTransportation.aspx" class="bd-nav-item">
                <span class="bd-nav-icon">♧</span>
                <span>Book Transportation</span>
            </a>

            <a href="MyBookings.aspx" class="bd-nav-item active">
                <span class="bd-nav-icon">☷</span>
                <span>My Bookings</span>
            </a>

            <a href="Payments.aspx" class="bd-nav-item">
                <span class="bd-nav-icon">▱</span>
                <span>Payments</span>
            </a>

            <a href="AddressBook.aspx" class="bd-nav-item">
                <span class="bd-nav-icon">▣</span>
                <span>Address Book</span>
            </a>

            <a href="Profile.aspx" class="bd-nav-item">
                <span class="bd-nav-icon">♙</span>
                <span>Profile</span>
            </a>
            
        </nav>

        <a href="Login.aspx" class="dash-logout">
    ↪ &nbsp; Logout
</a>
    </aside>


    <!-- ================= MAIN ================= -->

    <main class="bd-main">

        <!-- TOP BAR -->

        <header class="bd-topbar">

            <h1>Booking Details</h1>

            <div class="bd-user">

                <div class="bd-user-avatar">
                    👤
                </div>

                <div class="bd-user-info">
                    <strong>Nandan Nasit</strong>
                    <span>Standard Customer</span>
                </div>

            </div>

        </header>


        <!-- ================= CONTENT ================= -->

        <section class="bd-content">

            <!-- BOOKING TITLE -->

            <div class="bd-booking-heading">

                <h2>
                    Booking
                    <span id="lblBookingTitle" runat="server">#TRP-1004</span>
                </h2>

                <span id="lblStatus"
                      runat="server"
                      class="bd-status ongoing">
                    Ongoing
                </span>

            </div>


            <!-- ================= BOOKING INFORMATION ================= -->

            <div class="bd-card">

                <h3>Booking Information</h3>

                <div class="bd-info-list">

                    <div class="bd-info-row">
                        <span class="bd-label">Booking Date</span>

                        <strong id="lblBookingDate" runat="server">
                            17 Aug 2026, 10:00 AM
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Payment Status</span>

                        <strong id="lblPaymentStatus" runat="server">
                            Paid
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Payment Method</span>

                        <strong id="lblPaymentMethod" runat="server">
                            Online
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Total Amount</span>

                        <strong id="lblTotalAmount" runat="server">
                            ₹250.00
                        </strong>
                    </div>

                </div>

            </div>


            <!-- ================= LOAD DETAILS ================= -->

            <div class="bd-card">

                <h3>Load Details</h3>

                <div class="bd-info-list">

                    <div class="bd-info-row">
                        <span class="bd-label">Vehicle Type</span>

                        <strong id="lblVehicle" runat="server">
                            Medium Truck (6-Wheeler)
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Load Type</span>

                        <strong id="lblLoadType" runat="server">
                            Industrial Raw Material
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Total Weight</span>

                        <strong id="lblWeight" runat="server">
                            4.5 Tons
                        </strong>
                    </div>

                </div>

            </div>


            <!-- ================= CUSTOMER DETAILS ================= -->

            <div class="bd-card">

                <h3>Customer Details</h3>

                <div class="bd-info-list">

                    <div class="bd-info-row">
                        <span class="bd-label">Company Name</span>

                        <strong id="lblCompany" runat="server">
                            Lumen Enterprises
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Contact Person</span>

                        <strong id="lblContactPerson" runat="server">
                            Vraj Akbari
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Email</span>

                        <strong id="lblEmail" runat="server">
                            vraj55652@gmail.com
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Phone</span>

                        <strong id="lblPhone" runat="server">
                            +919865745215
                        </strong>
                    </div>

                </div>

            </div>

        </section>

    </main>

</div>

</form>

</body>
</html>