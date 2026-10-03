<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Payments.aspx.cs"
    Inherits="WebApplication3.Payments" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Payments</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="CSS/style.css" rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

<div class="payments-layout">

    <!-- ================= SIDEBAR ================= -->

    <aside class="payments-sidebar">

        <div class="payments-logo">

            <div class="payments-logo-icon">
                ▰
            </div>

            <span>Transpo</span>

        </div>


        <nav class="payments-navigation">

            <a href="Dashboard.aspx"
               class="payments-nav-item">

                <span class="payments-nav-icon">▦</span>
                <span>Dashboard</span>

            </a>


            <a href="BookTransportation.aspx"
               class="payments-nav-item">

                <span class="payments-nav-icon">♧</span>
                <span>Book Transportation</span>

            </a>


            <a href="Bookings.aspx"
               class="payments-nav-item">

                <span class="payments-nav-icon">☷</span>
                <span>My Bookings</span>

            </a>


            <a href="Payments.aspx"
               class="payments-nav-item active">

                <span class="payments-nav-icon">▱</span>
                <span>Payments</span>

            </a>


            <a href="AddressBook.aspx"
               class="payments-nav-item">

                <span class="payments-nav-icon">▣</span>
                <span>Address Book</span>

            </a>


            <a href="Profile.aspx"
               class="payments-nav-item">

                <span class="payments-nav-icon">♙</span>
                <span>Profile</span>

            </a>

        </nav>
        <a href="Login.aspx" class="dash-logout">
    ↪ &nbsp; Logout
</a>
    </aside>



    <!-- ================= MAIN ================= -->

    <main class="payments-main">


        <!-- TOPBAR -->

        <header class="payments-topbar">

            <h1>Payments</h1>


            <div class="payments-user">

                <div class="payments-user-avatar">
                    👤
                </div>

                <div class="payments-user-info">

                    <strong>Nandan Nasit</strong>

                    <span>Standard Customer</span>

                </div>

            </div>

        </header>



        <!-- CONTENT -->

        <section class="payments-content">


            <!-- SUMMARY CARDS -->

            <div class="payments-summary">


                <!-- TOTAL SPENT -->

                <div class="payments-summary-card">

                    <div>

                        <span class="payments-summary-label">
                            Total Spent
                        </span>

                        <strong class="payments-summary-value">
                            ₹98,450
                        </strong>

                        <span class="payments-summary-description">
                            Delivered shipments this year
                        </span>

                    </div>


                    <div class="payments-summary-icon spent">
                        ▤
                    </div>

                </div>



                <!-- PENDING -->

                <div class="payments-summary-card">

                    <div>

                        <span class="payments-summary-label">
                            Pending Payments
                        </span>

                        <strong class="payments-summary-value">
                            ₹10,500
                        </strong>

                        <span class="payments-summary-description">
                            Due in 3 current orders
                        </span>

                    </div>


                    <div class="payments-summary-icon pending">
                        ◷
                    </div>

                </div>

            </div>



            <!-- PAYMENT HISTORY -->

            <div class="payments-history-card">


                <div class="payments-history-header">

                    <h2>
                        Payment History
                    </h2>

                    

                </div>



                <div class="payments-table-wrapper">

                    <table class="payments-table">

                        <thead>

                            <tr>

                                <th>
                                    Booking ID
                                </th>

                                <th>
                                    Date
                                </th>

                                <th>
                                    Method
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

                                <td>
                                    <a href="#">
                                        TRP-1004
                                    </a>
                                </td>

                                <td>
                                    17 Aug 2026
                                </td>

                                <td>
                                    COD
                                </td>

                                <td class="payment-amount">
                                    ₹1,200.00
                                </td>

                                <td>
                                    <span class="payment-status paid">
                                        Paid
                                    </span>
                                </td>

                            </tr>


                            <tr>

                                <td>
                                    <a href="#">
                                        TRP-1003
                                    </a>
                                </td>

                                <td>
                                    27 Aug 2026
                                </td>

                                <td>
                                    COD
                                </td>

                                <td class="payment-amount">
                                    ₹850.00
                                </td>

                                <td>
                                    <span class="payment-status failed">
                                        Failed
                                    </span>
                                </td>

                            </tr>


                            <tr>

                                <td>
                                    <a href="#">
                                        TRP-1002
                                    </a>
                                </td>

                                <td>
                                    17 Jun 2026
                                </td>

                                <td>
                                    COD
                                </td>

                                <td class="payment-amount">
                                    ₹1,450.00
                                </td>

                                <td>
                                    <span class="payment-status paid">
                                        Paid
                                    </span>
                                </td>

                            </tr>


                            <tr>

                                <td>
                                    <a href="#">
                                        TRP-1001
                                    </a>
                                </td>

                                <td>
                                    7 Aug 2026
                                </td>

                                <td>
                                    COD
                                </td>

                                <td class="payment-amount">
                                    ₹1,150.00
                                </td>

                                <td>
                                    <span class="payment-status paid">
                                        Paid
                                    </span>
                                </td>

                            </tr>


                            <tr>

                                <td>
                                    <a href="#">
                                        TRP-1000
                                    </a>
                                </td>

                                <td>
                                    12 Aug 2026
                                </td>

                                <td>
                                    COD
                                </td>

                                <td class="payment-amount">
                                    ₹300.00
                                </td>

                                <td>
                                    <span class="payment-status paid">
                                        Paid
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