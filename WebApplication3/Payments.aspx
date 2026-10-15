<%@ Page Title="Payments" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Payments.aspx.cs"
    Inherits="WebApplication3.Payments" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    - Payments
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    Payments
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
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
                                    <a href="">
                                        TRP-1004
                                   
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
                                    <a href="">
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
                                    <a href="">
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
                                    <a href="">
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
                                    <a href="">
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
</asp:Content>