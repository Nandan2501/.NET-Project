<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="BookTransportation.aspx.cs"
    Inherits="WebApplication3.BookTransportation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Book Transportation</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="CSS/style.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

<div class="bt-layout">

    <!-- ================= SIDEBAR ================= -->

    <aside class="bt-sidebar">

        <div class="bt-logo">
            <div class="bt-logo-icon"></div>
            <span>Transpo</span>
        </div>

        <nav class="bt-navigation">

            <a href="Dashboard.aspx" class="bt-nav-item">
                <span class="bt-nav-icon">▦</span>
                <span>Dashboard</span>
            </a>

            <a href="BookTransportation.aspx"
               class="bt-nav-item active">
                <span class="bt-nav-icon">♧</span>
                <span>Book Transportation</span>
            </a>

            <a href="Bookings.aspx" class="bt-nav-item">
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

    <main class="bt-main">

        <!-- TOP BAR -->

        <header class="bt-topbar">

            <h1>Book Transportation</h1>

            <div class="bt-user">

                <div class="bt-user-avatar">
                    👤
                </div>

                <div class="bt-user-info">
                    <strong>Nandan Nasit</strong>
                    <span>Standard Customer</span>
                </div>

            </div>

        </header>


        <!-- ================= CONTENT ================= -->

        <section class="bt-content">

            <!-- PROGRESS -->

            <div class="bt-progress">

                <div class="bt-step active">

                    <span class="bt-step-number">1</span>

                    <span class="bt-step-text">
                        Route Details
                    </span>

                </div>

                <span class="bt-arrow">→</span>

                <div class="bt-step">

                    <span class="bt-step-number">2</span>

                    <span class="bt-step-text">
                        Load Details
                    </span>

                </div>

                <span class="bt-arrow">→</span>

                <div class="bt-step">

                    <span class="bt-step-number">3</span>

                    <span class="bt-step-text">
                        Review &amp; Confirm
                    </span>

                </div>

            </div>


            <!-- ================= FORM CARD ================= -->

            <div class="bt-card">

                <h2>Enter Route Details</h2>


                <!-- FROM -->

                <div class="bt-field">

                    <label for="txtFrom">
                        From Location
                    </label>

                    <asp:TextBox
                        ID="txtFrom"
                        runat="server"
                        CssClass="bt-input"
                        Text="Rajkot, gujarat">
                    </asp:TextBox>

                </div>


                <!-- TO -->

                <div class="bt-field">

                    <label for="txtTo">
                        To Location
                    </label>

                    <asp:TextBox
                        ID="txtTo"
                        runat="server"
                        CssClass="bt-input"
                        Text="baroda,gujarat">
                    </asp:TextBox>

                </div>


                <!-- VEHICLE + DATE -->

                <div class="bt-two-column">

                    <div class="bt-field">

                        <label for="ddlVehicle">
                            Vehicle Type
                        </label>

                        <asp:DropDownList
                            ID="ddlVehicle"
                            runat="server"
                            CssClass="bt-input">

                            <asp:ListItem>
                                Medium Truck (6-Wheeler)
                            </asp:ListItem>

                            <asp:ListItem>
                                Small Truck
                            </asp:ListItem>

                            <asp:ListItem>
                                Large Truck
                            </asp:ListItem>

                            <asp:ListItem>
                                Pickup Truck
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>


                    <div class="bt-field">

                        <label for="txtDate">
                            Preferred Date
                        </label>

                        <asp:TextBox
                            ID="txtDate"
                            runat="server"
                            TextMode="Date"
                            CssClass="bt-input">
                        </asp:TextBox>

                    </div>

                </div>


                <!-- INSTRUCTIONS -->

                <div class="bt-field">

                    <label for="txtInstructions">
                        Additional Instructions
                    </label>

                    <asp:TextBox
                        ID="txtInstructions"
                        runat="server"
                        TextMode="MultiLine"
                        CssClass="bt-textarea"
                        Text="Fragile load. Needs careful stacking.">
                    </asp:TextBox>

                </div>


                <!-- NEXT BUTTON -->

                <asp:Button
                    ID="btnNext"
                    runat="server"
                    Text="Next: Load Details"
                    CssClass="bt-next-btn"
                    OnClick="btnNext_Click" />

            </div>

        </section>

    </main>

</div>

</form>

</body>
</html>