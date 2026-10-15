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
            <div class="payment-card-header">
                Recent Transactions
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
