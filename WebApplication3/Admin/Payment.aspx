<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Payment.aspx.cs"
    Inherits="WebApplication3.AdminPayments" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Payment History - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Payments
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="admin-content payment-page-content" style="padding: 0;">

       

        <!-- PAYMENT CARD -->
        <div class="payment-card">

            <!-- CARD TITLE -->
            <div class="payment-card-header d-flex justify-content-between align-items-center">
                <span>Recent Transactions</span>
                <asp:DropDownList ID="ddlPayStatus" runat="server" CssClass="form-select form-select-sm" style="width:160px;" AutoPostBack="true" OnSelectedIndexChanged="ddlPayStatus_SelectedIndexChanged">
                    <asp:ListItem Text="All Statuses" Value="ALL" Selected="True" />
                    <asp:ListItem Text="Paid" Value="Paid" />
                    <asp:ListItem Text="Pending" Value="Pending" />
                    <asp:ListItem Text="Refunded" Value="Refunded" />
                    <asp:ListItem Text="Failed" Value="Failed" />
                </asp:DropDownList>
            </div>

            <!-- TABLE -->
            <div class="payment-table-wrapper">
                <asp:GridView
                    ID="gvPayments"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="payment-table"
                    GridLines="None"
                    OnRowCommand="gvPayments_RowCommand">
                    <Columns>
                        <asp:BoundField
                            DataField="PaymentId"
                            HeaderText="PAYMENT ID" />

                        <asp:BoundField
                            DataField="Customer"
                            HeaderText="CUSTOMER" />

                        <asp:BoundField
                            DataField="BookingId"
                            HeaderText="BOOKING ID" />

                        <asp:BoundField
                            DataField="Date"
                            HeaderText="DATE" />

                        <asp:BoundField
                            DataField="Amount"
                            HeaderText="AMOUNT" />

                        <asp:BoundField
                            DataField="Method"
                            HeaderText="METHOD" />

                        <asp:TemplateField
                            HeaderText="STATUS">
                            <ItemTemplate>
                                <span class='<%# GetPaymentStatusClass(Eval("Status").ToString()) %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ACTION">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnMarkPaid" runat="server"
                                    CommandName="MarkPaid"
                                    CommandArgument='<%# Eval("RawPaymentId") %>'
                                    Text="Mark Paid"
                                    Visible='<%# Eval("Status").ToString().Equals("Pending", StringComparison.OrdinalIgnoreCase) %>'
                                    CssClass="btn btn-outline-success btn-sm" />
                                <asp:LinkButton ID="btnRefund" runat="server"
                                    CommandName="MarkRefunded"
                                    CommandArgument='<%# Eval("RawPaymentId") %>'
                                    Text="Refund"
                                    Visible='<%# Eval("Status").ToString().Equals("Paid", StringComparison.OrdinalIgnoreCase) %>'
                                    OnClientClick="return confirm('Mark this payment as Refunded?');"
                                    CssClass="btn btn-outline-danger btn-sm" />
                                <a href='TripDetails.aspx?id=<%# Eval("BookingId") %>' class="btn btn-outline-primary btn-sm ms-1">Trip</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>

        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="payment-message">
        </asp:Label>

    </section>

</asp:Content>
