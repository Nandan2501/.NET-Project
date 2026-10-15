<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="MyEarnings.aspx.cs"
    Inherits="WebApplication3.Driver.MyEarnings" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    My Earnings - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    My Earnings
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="driver-earnings-content" style="padding: 0;">

        <!-- SUMMARY CARDS -->
        <div class="driver-earnings-summary">

            <div class="driver-earnings-summary-card">
                <span>Available Balance</span>
                <strong class="balance">₹950</strong>
            </div>

            <div class="driver-earnings-summary-card">
                <span>This Month</span>
                <strong>₹25,500</strong>
            </div>

            <div class="driver-earnings-summary-card">
                <span>Total Payouts</span>
                <strong>₹2,25,900</strong>
            </div>

        </div>

        <!-- TRANSACTION TABLE -->
        <div class="driver-earnings-table-card">
            <div class="driver-earnings-table-wrapper">
                <table class="driver-earnings-table">
                    <thead>
                        <tr>
                            <th>Transaction ID</th>
                            <th>Date</th>
                            <th>Description</th>
                            <th>Amount</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="transaction-id">TXN87654321</td>
                            <td>20 May 2026</td>
                            <td class="transaction-description">Payout to bank account</td>
                            <td class="amount-negative">-₹5500.00</td>
                            <td>
                                <span class="earnings-status delivered">Delivered</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="transaction-id">TXN45678912</td>
                            <td>18 May 2026</td>
                            <td class="transaction-description">Earnings for TRP987654321</td>
                            <td class="amount-positive">+₹3320.00</td>
                            <td>
                                <span class="earnings-status delivered">Delivered</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="transaction-id">TXN12345678</td>
                            <td>15 May 2026</td>
                            <td class="transaction-description">Earnings for TRP123456789</td>
                            <td class="amount-positive">+₹2150.00</td>
                            <td>
                                <span class="earnings-status delivered">Delivered</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </section>

</asp:Content>