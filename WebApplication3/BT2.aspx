<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="BT2.aspx.cs"
    Inherits="WebApplication3.BT2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Book Transportation - Load Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="CSS/style.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

<div class="ld-layout">

    <!-- SIDEBAR -->
    <aside class="ld-sidebar">

        <div class="ld-logo">
            <div class="ld-logo-icon"></div>
            <span>Transpo</span>
        </div>

        <nav class="ld-navigation">

            <a href="Dashboard.aspx" class="ld-nav-item">
                <span class="ld-nav-icon">▦</span>
                <span>Dashboard</span>
            </a>

            <a href="BookTransportation.aspx"
               class="ld-nav-item active">
                <span class="ld-nav-icon">♧</span>
                <span>Book Transportation</span>
            </a>

            <a href="MyBookings.aspx" class="ld-nav-item">
                <span class="ld-nav-icon">☷</span>
                <span>My Bookings</span>
            </a>

            <a href="Payments.aspx" class="ld-nav-item">
                <span class="ld-nav-icon">▱</span>
                <span>Payments</span>
            </a>

            <a href="AddressBook.aspx" class="ld-nav-item">
                <span class="ld-nav-icon">▣</span>
                <span>Address Book</span>
            </a>

            <a href="Profile.aspx" class="ld-nav-item">
                <span class="ld-nav-icon">♙</span>
                <span>Profile</span>
            </a>

        </nav>

        <a href="Login.aspx" class="dash-logout">
    ↪ &nbsp; Logout
</a>

    </aside>


    <!-- MAIN -->
    <main class="ld-main">

        <!-- TOP BAR -->
        <header class="ld-topbar">

            <h1>Book Transportation</h1>

            <div class="ld-user">

                <div class="ld-user-avatar">
                    👤
                </div>

                <div class="ld-user-info">
                    <strong>Nandan Nasit</strong>
                    <span>Standard Customer</span>
                </div>

            </div>

        </header>


        <!-- CONTENT -->
        <section class="ld-content">

            <!-- PROGRESS -->
            <div class="ld-progress">

                <div class="ld-step completed">
                    <span class="ld-step-number">✓</span>
                    <span>Route Details</span>
                </div>

                <span class="ld-arrow">→</span>

                <div class="ld-step active">
                    <span class="ld-step-number">2</span>
                    <span>Load Details</span>
                </div>

                <span class="ld-arrow">→</span>

                <div class="ld-step">
                    <span class="ld-step-number">3</span>
                    <span>Review &amp; Confirm</span>
                </div>

            </div>


            <!-- FORM CARD -->
            <div class="ld-card">

                <h2>Enter Load Details</h2>


                <!-- LOAD TYPE + WEIGHT -->
                <div class="ld-two-column">

                    <div class="ld-field">

                        <label for="ddlLoadType">
                            Load Type
                        </label>

                        <asp:DropDownList
                            ID="ddlLoadType"
                            runat="server"
                            CssClass="ld-input">

                            <asp:ListItem>
                                Packaged Goods
                            </asp:ListItem>

                            <asp:ListItem>
                                Industrial Raw Material
                            </asp:ListItem>

                            <asp:ListItem>
                                Fragile Goods
                            </asp:ListItem>

                            <asp:ListItem>
                                Agricultural Products
                            </asp:ListItem>

                            <asp:ListItem>
                                Other
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>


                    <div class="ld-field">

                        <label for="txtWeight">
                            Weight (in kg)
                        </label>

                        <asp:TextBox
                            ID="txtWeight"
                            runat="server"
                            CssClass="ld-input"
                            Text="850">
                        </asp:TextBox>

                    </div>

                </div>


                <!-- PACKAGES + DIMENSIONS -->
                <div class="ld-two-column">

                    <div class="ld-field">

                        <label for="txtPackages">
                            Number of Packages
                        </label>

                        <asp:TextBox
                            ID="txtPackages"
                            runat="server"
                            CssClass="ld-input"
                            Text="12">
                        </asp:TextBox>

                    </div>


                    <div class="ld-field">

                        <label>
                            Package Dimensions (L x W x H in cm)
                        </label>

                        <div class="ld-dimensions">

                            <asp:TextBox
                                ID="txtLength"
                                runat="server"
                                CssClass="ld-dimension-input"
                                Text="L: 120">
                            </asp:TextBox>

                            <asp:TextBox
                                ID="txtWidth"
                                runat="server"
                                CssClass="ld-dimension-input"
                                Text="W: 80">
                            </asp:TextBox>

                            <asp:TextBox
                                ID="txtHeight"
                                runat="server"
                                CssClass="ld-dimension-input"
                                Text="H: 60">
                            </asp:TextBox>

                        </div>

                    </div>

                </div>


                <!-- SPECIAL HANDLING -->
                <div class="ld-field">

                    <label for="txtHandling">
                        Special Handling Requirements
                    </label>

                    <asp:TextBox
                        ID="txtHandling"
                        runat="server"
                        TextMode="MultiLine"
                        CssClass="ld-textarea"
                        Text="Temperature sensitive. Keep below 25°C.">
                    </asp:TextBox>

                </div>


                <!-- BUTTONS -->
                <div class="ld-buttons">

                    <asp:Button
                        ID="btnBack"
                        runat="server"
                        Text="Back: Route Details"
                        CssClass="ld-back-btn"
                        OnClick="btnBack_Click" />

                    <asp:Button
                        ID="btnNext"
                        runat="server"
                        Text="Next: Review &amp; Confirm"
                        CssClass="ld-next-btn"
                        OnClick="btnNext_Click" />

                </div>

            </div>

        </section>

    </main>

</div>

</form>

</body>
</html>