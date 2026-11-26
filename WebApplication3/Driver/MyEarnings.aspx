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
                <span>Pending Payout</span>
                <strong class="balance"><asp:Literal ID="litAvailableBalance" runat="server" Text="₹0" /></strong>
            </div>

            <div class="driver-earnings-summary-card">
                <span>This Month</span>
                <strong><asp:Literal ID="litThisMonth" runat="server" Text="₹0" /></strong>
            </div>

            <div class="driver-earnings-summary-card">
                <span>Credited in Account</span>
                <strong><asp:Literal ID="litTotalPayouts" runat="server" Text="₹0" /></strong>
            </div>

        </div>

        <div class="d-flex justify-content-between align-items-center mb-3">
            <asp:Label ID="lblEarningsMsg" runat="server" ForeColor="Green" CssClass="fw-semibold" />
            <asp:Button ID="btnRequestPayout" runat="server" Text="Withdraw Available Balance" CssClass="btn btn-primary btn-sm" OnClick="btnRequestPayout_Click" />
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
                            <th>Gross</th>
                            <th>Net Amount</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptEarnings" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td class="transaction-id"><%# Eval("TransactionRef") %></td>
                                    <td><%# Eval("EarnedDate") %></td>
                                    <td class="transaction-description"><%# Server.HtmlEncode(Eval("Description").ToString()) %></td>
                                    <td>₹<%# Convert.ToDecimal(Eval("GrossAmount")).ToString("N2") %></td>
                                    <td class="amount-positive">+₹<%# Convert.ToDecimal(Eval("NetAmount")).ToString("N2") %></td>
                                    <td>
                                        <span class='earnings-status <%# Eval("PayoutStatus").ToString().Equals("Paid", StringComparison.OrdinalIgnoreCase) ? "delivered" : "pending" %>'>
                                            <%# Eval("PayoutStatus") %>
                                        </span>
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
