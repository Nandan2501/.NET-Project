<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="MyEarnings.aspx.cs"
    Inherits="WebApplication3.Driver.MyEarnings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>My Earnings - Transpo</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <link rel="stylesheet"
          href="<%= ResolveUrl("~/CSS/style.css") %>" />

</head>

<body>

<form id="form1" runat="server">

<div class="driver-earnings-page">

    <!-- ================= SIDEBAR ================= -->

    <aside class="driver-earnings-sidebar">

        <div class="driver-earnings-logo">

            <div class="driver-earnings-logo-icon">
                ▣
            </div>

            <span>Transpo</span>

        </div>


        <nav class="driver-earnings-navigation">

            <a href="Dashboard.aspx"
               class="driver-earnings-nav-item">

                <span class="driver-earnings-nav-icon">▦</span>
                <span>Dashboard</span>

            </a>


            <a href="MyTrips.aspx"
               class="driver-earnings-nav-item">

                <span class="driver-earnings-nav-icon">→</span>
                <span>My Trips</span>

            </a>


            <a href="ActiveTrip.aspx"
               class="driver-earnings-nav-item">

                <span class="driver-earnings-nav-icon">♡</span>
                <span>Active Trip</span>

            </a>


            <a href="MyEarnings.aspx"
               class="driver-earnings-nav-item active">

                <span class="driver-earnings-nav-icon">▤</span>
                <span>My Earnings</span>

            </a>


            <a href="MyVehicle.aspx"
               class="driver-earnings-nav-item">

                <span class="driver-earnings-nav-icon">▱</span>
                <span>My Vehicle</span>

            </a>


            <a href="Profile.aspx"
               class="driver-earnings-nav-item">

                <span class="driver-earnings-nav-icon">♙</span>
                <span>Profile</span>

            </a>


            <a href="Settings.aspx"
               class="driver-earnings-nav-item">

                <span class="driver-earnings-nav-icon">⚙</span>
                <span>Settings</span>

            </a>

        </nav>


        <div class="driver-earnings-logout">

            <a href="../Login.aspx">

                <span>↪</span>
                <span>Logout</span>

            </a>

        </div>

    </aside>


    <!-- ================= MAIN ================= -->

    <main class="driver-earnings-main">


        <!-- TOP BAR -->

        <header class="driver-earnings-topbar">

            <div>

                <h1>
                    My Earnings
                </h1>

                <p>
                    Track and manage all your payouts.
                </p>

            </div>


            <div class="driver-earnings-user">

                <div class="driver-earnings-avatar">
                    ♟
                </div>

                <div class="driver-earnings-user-info">

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

        <section class="driver-earnings-content">


            <!-- SUMMARY CARDS -->

            <div class="driver-earnings-summary">


                <div class="driver-earnings-summary-card">

                    <span>
                        Available Balance
                    </span>

                    <strong class="balance">
                        ₹950
                    </strong>

                </div>


                <div class="driver-earnings-summary-card">

                    <span>
                        This Month
                    </span>

                    <strong>
                        ₹25,500
                    </strong>

                </div>


                <div class="driver-earnings-summary-card">

                    <span>
                        Total Payouts
                    </span>

                    <strong>
                        ₹2,25,900
                    </strong>

                </div>


            </div>


            <!-- TRANSACTION TABLE -->

            <div class="driver-earnings-table-card">

                <div class="driver-earnings-table-wrapper">

                    <table class="driver-earnings-table">

                        <thead>

                            <tr>

                                <th>
                                    Transaction ID
                                </th>

                                <th>
                                    Date
                                </th>

                                <th>
                                    Description
                                </th>

                                <th>
                                    Amount
                                </th>

                                <th>
                                    Status
                                </th>

                            </tr>

                        </thead>


                        <tbody>


                            <tr>

                                <td class="transaction-id">
                                    TXN87654321
                                </td>

                                <td>
                                    20 May 2026
                                </td>

                                <td class="transaction-description">
                                    Payout to bank account
                                </td>

                                <td class="amount-negative">
                                    -₹5500.00
                                </td>

                                <td>

                                    <span class="earnings-status delivered">
                                        Delivered
                                    </span>

                                </td>

                            </tr>


                            <tr>

                                <td class="transaction-id">
                                    TXN45678912
                                </td>

                                <td>
                                    18 May 2026
                                </td>

                                <td class="transaction-description">
                                    Earnings for TRP987654321
                                </td>

                                <td class="amount-positive">
                                    +₹3320.00
                                </td>

                                <td>

                                    <span class="earnings-status delivered">
                                        Delivered
                                    </span>

                                </td>

                            </tr>


                            <tr>

                                <td class="transaction-id">
                                    TXN12345678
                                </td>

                                <td>
                                    15 May 2026
                                </td>

                                <td class="transaction-description">
                                    Earnings for TRP123456789
                                </td>

                                <td class="amount-positive">
                                    +₹2150.00
                                </td>

                                <td>

                                    <span class="earnings-status delivered">
                                        Delivered
                                    </span>

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