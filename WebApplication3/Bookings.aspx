<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="MyBookings.aspx.cs"
    Inherits="WebApplication3.MyBookings" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>My Bookings</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="CSS/style.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

<div class="mb-layout">

    <!-- ================= SIDEBAR ================= -->

    <aside class="mb-sidebar">

        <div class="mb-logo">
            <div class="mb-logo-icon"></div>
            <span>Transpo</span>
        </div>

        <nav class="bt-navigation">

    <a href="Dashboard.aspx" class="bt-nav-item">
        <span class="bt-nav-icon">▦</span>
        <span>Dashboard</span>
    </a>

    <a href="BookTransportation.aspx"
       class="bt-nav-item ">
        <span class="bt-nav-icon">♧</span>
        <span>Book Transportation</span>
    </a>

    <a href="Bookings.aspx" class="bt-nav-item active">
        <span class="bt-nav-icon">☷</span>
        <span>My Bookings</span>
    </a>

    <a href="Payments.aspx" class="bt-nav-item">
        <span class="bt-nav-icon">▱</span>
        <span>Payments</span>
    </a>

    <a href="AddressBook.aspx" class="bt-nav-item">
        <span class="bt-nav-icon">▣</span>
        <span>Address Book</span>
    </a>

    <a href="Profile.aspx" class="bt-nav-item">
        <span class="bt-nav-icon">♙</span>
        <span>Profile</span>
    </a>

</nav>

        <a href="Login.aspx" class="dash-logout">
    ↪ &nbsp; Logout
</a>

    </aside>


    <!-- ================= MAIN ================= -->

    <main class="mb-main">

        <!-- TOP BAR -->

        <header class="mb-topbar">

            <h1>My Bookings</h1>

            <div class="mb-user">

                <div class="mb-user-avatar">
                    👤
                </div>

                <div class="mb-user-info">
                    <strong>Nandan Nasit</strong>
                    <span>Standard Customer</span>
                </div>

            </div>

        </header>


        <!-- ================= CONTENT ================= -->

        <section class="mb-content">

            <div class="mb-table-card">

                <asp:GridView
                    ID="gvBookings"
                    runat="server"
                    AutoGenerateColumns="false"
                    CssClass="mb-table"
                    GridLines="None"
                    OnRowCommand="gvBookings_RowCommand">

                    <Columns>

                        <asp:BoundField
                            DataField="BookingID"
                            HeaderText="Booking ID" />

                        <asp:BoundField
                            DataField="Route"
                            HeaderText="Route" />

                        <asp:BoundField
                            DataField="Date"
                            HeaderText="Date" />

                        <asp:TemplateField HeaderText="Status">

                            <ItemTemplate>

                                <span class='<%# GetStatusClass(Eval("Status").ToString()) %>'>
                                    <%# Eval("Status") %>
                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:BoundField
                            DataField="Amount"
                            HeaderText="Amount" />

                        <asp:TemplateField HeaderText="Action">

                            <ItemTemplate>

                                <asp:LinkButton
                                    ID="btnView"
                                    runat="server"
                                    Text="View Details"
                                    CommandName="ViewBooking"
                                    CommandArgument='<%# Eval("BookingID") %>'
                                    CssClass="mb-view-btn">
                                </asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

        </section>

    </main>

</div>

</form>

</body>
</html>