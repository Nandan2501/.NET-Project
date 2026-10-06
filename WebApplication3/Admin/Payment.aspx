<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Payments.aspx.cs"
    Inherits="WebApplication3.AdminPayments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Payment History - Transpo</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <link rel="stylesheet"
          href="../CSS/style.css" />

</head>

<body>

<form id="form1" runat="server">

<div class="admin-dashboard-page">

    <!-- SIDEBAR -->

    <aside class="admin-sidebar">

        <div class="admin-brand">

    <div class="brand-icon">
        🚚
    </div>

    <span>Transpo</span>

</div>


         <nav class="cu-navigation">

     <a href="Dashboard.aspx" class="cu-nav-item">
         <span class="cu-nav-icon">▦</span>
         <span>Dashboard</span>
     </a>

     <a href="Vehicle.aspx" class="cu-nav-item">
         <span class="cu-nav-icon">♧</span>
         <span>Vehicles</span>
     </a>

     <a href="Drivers.aspx" class="cu-nav-item">
         <span class="cu-nav-icon">♙</span>
         <span>Drivers</span>
     </a>

     <a href="Customers.aspx" class="cu-nav-item ">
         <span class="cu-nav-icon">♙</span>
         <span>Customers</span>
     </a>

     <a href="Payment.aspx" class="cu-nav-item active">
         <span class="cu-nav-icon">▱</span>
         <span>Payments</span>
     </a>

     <a href="Reports.aspx" class="cu-nav-item">
         <span class="cu-nav-icon">▥</span>
         <span>Reports</span>
     </a>

     <a href="Settings.aspx" class="cu-nav-item">
         <span class="cu-nav-icon">⚙</span>
         <span>Settings</span>
     </a>

 </nav>


        <div class="admin-logout">

            <a href="../Login.aspx">

                <span>↪</span>
                <span>Logout</span>

            </a>

        </div>

    </aside>


    <!-- MAIN -->

    <main class="admin-main">


        <!-- TOPBAR -->

        <header class="admin-topbar">

            <div></div>

            <div class="admin-user">

                <div class="admin-user-avatar">
                    ♟
                </div>

                <div class="admin-user-details">

                    <strong>Chirag</strong>

                    <span>Admin</span>

                </div>

            </div>

        </header>


        <!-- CONTENT -->

        <section class="admin-content payment-page-content">


            <!-- PAGE TITLE -->

            <div class="payment-heading">

                <h1>
                    Payment History
                </h1>

                <p>
                    Keep track of all client invoices, pending transactions and payouts
                </p>

            </div>


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



                            <asp:TemplateField
                                HeaderText="ACTIONS">

                                <ItemTemplate>

                                    <asp:LinkButton
                                        ID="btnPaymentAction"
                                        runat="server"
                                        CssClass="payment-action"
                                        CommandName="PaymentAction"
                                        CommandArgument='<%# Eval("PaymentId") %>'>

                                        ⋯

                                    </asp:LinkButton>

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

    </main>

</div>

</form>

</body>

</html>


dadadadadada