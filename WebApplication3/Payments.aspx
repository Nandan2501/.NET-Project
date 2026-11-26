<%@ Page Title="Transpo - Payments" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Payments.aspx.cs"
    Inherits="WebApplication3.Payments" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Transpo - Payments
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
                        <span class="payments-summary-label">Total Spent</span>
                        <strong class="payments-summary-value"><asp:Literal ID="litTotalSpent" runat="server" Text="₹0.00" /></strong>
                        <span class="payments-summary-description">Delivered shipments this year</span>
                    </div>
                    <div class="payments-summary-icon spent">▤</div>
                </div>

                <!-- PENDING -->
                <div class="payments-summary-card">
                    <div>
                        <span class="payments-summary-label">Pending Payments</span>
                        <strong class="payments-summary-value"><asp:Literal ID="litPendingPayments" runat="server" Text="₹0.00" /></strong>
                        <span class="payments-summary-description">Due in current orders</span>
                    </div>
                    <div class="payments-summary-icon pending">◷</div>
                </div>

            </div>

            <!-- PAYMENT HISTORY -->
            <div class="payments-history-card">
                <div class="payments-history-header d-flex justify-content-between align-items-center">
                    <h2>Payment History</h2>
                    <asp:Label ID="lblPayMessage" runat="server" ForeColor="Green" CssClass="fw-semibold" />
                </div>

                <div class="payments-table-wrapper">
                    <table class="payments-table">
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                <th>Date</th>
                                <th>Method</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptPayments" runat="server" OnItemCommand="rptPayments_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <a href='BookDetails.aspx?id=<%# Eval("BookingNumber") %>'>
                                                <%# Eval("BookingNumber") %>
                                            </a>
                                        </td>
                                        <td><%# Eval("PaymentDate") %></td>
                                        <td><%# Eval("PaymentMethod") %></td>
                                        <td class="payment-amount"><%# Eval("FormattedAmount") %></td>
                                        <td>
                                            <span class='payment-status <%# Eval("PaymentStatus").ToString().ToLower() %>'>
                                                <%# Eval("PaymentStatus") %>
                                            </span>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnPay" runat="server"
                                                CommandName="PayNow"
                                                CommandArgument='<%# Eval("PaymentId") %>'
                                                Text="Pay Now"
                                                Visible='<%# Eval("PaymentStatus").ToString().Equals("Pending", StringComparison.OrdinalIgnoreCase) %>'
                                                CssClass="btn btn-primary btn-sm" />
                                            <a href='BookDetails.aspx?id=<%# Eval("BookingNumber") %>' class="btn btn-outline-secondary btn-sm">Details</a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>

        </section>
</asp:Content>
