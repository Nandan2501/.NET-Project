<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AddressBook.aspx.cs"
    Inherits="WebApplication3.AddressBook" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Address Book</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="CSS/style.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

<div class="ab-layout">

    <!-- ================= SIDEBAR ================= -->

    <aside class="ab-sidebar">

        <div class="ab-logo">
            <div class="ab-logo-icon"></div>
            <span>Transpo</span>
        </div>

        <nav class="ab-navigation">

            <a href="Dashboard.aspx" class="ab-nav-item">
                <span class="ab-nav-icon">▦</span>
                <span>Dashboard</span>
            </a>

            <a href="BookTransportation.aspx" class="ab-nav-item">
                <span class="ab-nav-icon">♧</span>
                <span>Book Transportation</span>
            </a>

            <a href="MyBookings.aspx" class="ab-nav-item">
                <span class="ab-nav-icon">☷</span>
                <span>My Bookings</span>
            </a>

            <a href="Payments.aspx" class="ab-nav-item">
                <span class="ab-nav-icon">▱</span>
                <span>Payments</span>
            </a>

            <a href="AddressBook.aspx" class="ab-nav-item active">
                <span class="ab-nav-icon">▣</span>
                <span>Address Book</span>
            </a>

            <a href="Profile.aspx" class="ab-nav-item">
                <span class="ab-nav-icon">♙</span>
                <span>Profile</span>
            </a>

        </nav>

        
        <a href="Login.aspx" class="dash-logout">
            ↪ &nbsp; Logout
        </a>
    </aside>


    <!-- ================= MAIN ================= -->

    <main class="ab-main">

        <!-- TOP BAR -->

        <header class="ab-topbar">

            <h1>Address Book</h1>

            <div class="ab-user">

                <div class="ab-user-avatar">
                    👤
                </div>

                <div class="ab-user-info">
                    <strong>Nandan Nasit</strong>
                    <span>Standard Customer</span>
                </div>

            </div>

        </header>


        <!-- ================= CONTENT ================= -->

        <section class="ab-content">

            <!-- HEADER CARD -->

            <div class="ab-header-card">

                <div class="ab-header-text">

                    <h2>Manage Shipping Addresses</h2>

                    <p>
                        Save your warehouses, offices, and ports for streamlined bookings.
                    </p>

                </div>

                <asp:Button
                    ID="btnAddAddress"
                    runat="server"
                    Text="+  Add New Address"
                    CssClass="ab-add-btn"
                    OnClick="btnAddAddress_Click" />

            </div>


            <!-- ================= ADDRESS 1 ================= -->

            <div class="ab-address-card default-address">

                <div class="ab-address-left">

                    <div class="ab-address-icon location-icon">
                        ♧
                    </div>

                    <div class="ab-address-info">

                        <div class="ab-address-title">

                            <strong>Rajkot main office</strong>

                            <span class="ab-default-badge">
                                Default Delivery
                            </span>

                        </div>

                        <p>
                            spara,rajkot,gujarat 360002
                        </p>

                        <span class="ab-phone">
                            ☎ &nbsp;+91 98765 43210
                        </span>

                    </div>

                </div>

                <div class="ab-actions">

                    <asp:Button
                        ID="btnEdit1"
                        runat="server"
                        Text="✎"
                        CommandArgument="1"
                        CssClass="ab-icon-btn edit-btn"
                        OnClick="btnEdit_Click" />

                    <asp:Button
                        ID="btnDelete1"
                        runat="server"
                        Text="▥"
                        CommandArgument="1"
                        CssClass="ab-icon-btn delete-btn"
                        OnClick="btnDelete_Click" />

                </div>

            </div>


            <!-- ================= ADDRESS 2 ================= -->

            <div class="ab-address-card">

                <div class="ab-address-left">

                    <div class="ab-address-icon home-icon">
                        ♙
                    </div>

                    <div class="ab-address-info">

                        <div class="ab-address-title">
                            <strong>Private Residence (Home)</strong>
                        </div>

                        <p>
                            Apartment 402, Royal Residency, CG Road, Navrangpura, Ahmedabad, Gujarat, 380009
                        </p>

                        <span class="ab-phone">
                            ☎ &nbsp;+91 91234 56789
                        </span>

                    </div>

                </div>

                <div class="ab-actions">

                    <asp:Button
                        ID="btnEdit2"
                        runat="server"
                        Text="✎"
                        CommandArgument="2"
                        CssClass="ab-icon-btn edit-btn"
                        OnClick="btnEdit_Click" />

                    <asp:Button
                        ID="btnDelete2"
                        runat="server"
                        Text="▥"
                        CommandArgument="2"
                        CssClass="ab-icon-btn delete-btn"
                        OnClick="btnDelete_Click" />

                </div>

            </div>


            <!-- ================= ADDRESS 3 ================= -->

            <div class="ab-address-card">

                <div class="ab-address-left">

                    <div class="ab-address-icon industrial-icon">
                        ∿
                    </div>

                    <div class="ab-address-info">

                        <div class="ab-address-title">
                            <strong>Industrial Construction Hub (Site Location)</strong>
                        </div>

                        <p>
                            Plot 14-B, Surat Special Economic Zone (SEZ), Sachin, Surat, Gujarat, 394230
                        </p>

                        <span class="ab-phone">
                            ☎ &nbsp;+91 94567 12304
                        </span>

                    </div>

                </div>

                <div class="ab-actions">

                    <asp:Button
                        ID="btnEdit3"
                        runat="server"
                        Text="✎"
                        CommandArgument="3"
                        CssClass="ab-icon-btn edit-btn"
                        OnClick="btnEdit_Click" />

                    <asp:Button
                        ID="btnDelete3"
                        runat="server"
                        Text="▥"
                        CommandArgument="3"
                        CssClass="ab-icon-btn delete-btn"
                        OnClick="btnDelete_Click" />

                </div>

            </div>


            <!-- ================= ADDRESS 4 ================= -->

            <div class="ab-address-card">

                <div class="ab-address-left">

                    <div class="ab-address-icon port-icon">
                        ⚓
                    </div>

                    <div class="ab-address-info">

                        <div class="ab-address-title">
                            <strong>Kandla Port Terminal (Port Address)</strong>
                        </div>

                        <p>
                            Berth No. 8, Cargo Terminal East, Kandla Port, Gandhidham, Gujarat, 370210
                        </p>

                        <span class="ab-phone">
                            ☎ &nbsp;+91 93210 98765
                        </span>

                    </div>

                </div>

                <div class="ab-actions">

                    <asp:Button
                        ID="btnEdit4"
                        runat="server"
                        Text="✎"
                        CommandArgument="4"
                        CssClass="ab-icon-btn edit-btn"
                        OnClick="btnEdit_Click" />

                    <asp:Button
                        ID="btnDelete4"
                        runat="server"
                        Text="▥"
                        CommandArgument="4"
                        CssClass="ab-icon-btn delete-btn"
                        OnClick="btnDelete_Click" />

                </div>

            </div>

        </section>

    </main>

</div>

</form>

</body>
</html>