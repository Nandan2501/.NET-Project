<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AddAddress.aspx.cs"
    Inherits="WebApplication3.AddAddress" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Add New Address</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="CSS/style.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

<div class="aa-layout">

    <!-- ================= SIDEBAR ================= -->

    <aside class="aa-sidebar">

        <div class="aa-logo">
            <div class="aa-logo-icon"></div>
            <span>Transpo</span>
        </div>

        <nav class="aa-navigation">

            <a href="Dashboard.aspx" class="aa-nav-item">
                <span class="aa-nav-icon">▦</span>
                <span>Dashboard</span>
            </a>

            <a href="BookTransportation.aspx" class="aa-nav-item">
                <span class="aa-nav-icon">♧</span>
                <span>Book Transportation</span>
            </a>

            <a href="MyBookings.aspx" class="aa-nav-item">
                <span class="aa-nav-icon">☷</span>
                <span>My Bookings</span>
            </a>

            <a href="Payments.aspx" class="aa-nav-item">
                <span class="aa-nav-icon">▱</span>
                <span>Payments</span>
            </a>

            <a href="AddressBook.aspx" class="aa-nav-item active">
                <span class="aa-nav-icon">▣</span>
                <span>Address Book</span>
            </a>

            <a href="Profile.aspx" class="aa-nav-item">
                <span class="aa-nav-icon">♙</span>
                <span>Profile</span>
            </a>

        </nav>

        <a href="Login.aspx" class="aa-logout">
            ↪ &nbsp; Logout
        </a>


    </aside>


    <!-- ================= MAIN ================= -->

    <main class="aa-main">

        <!-- TOP BAR -->

        <header class="aa-topbar">

            <h1>Address Book</h1>

            <div class="aa-user">

                <div class="aa-user-avatar">
                    👤
                </div>

                <div class="aa-user-info">
                    <strong>Nandan Nasit</strong>
                    <span>Standard Customer</span>
                </div>

            </div>

        </header>


        <!-- ================= CONTENT ================= -->

        <section class="aa-content">

            <!-- BREADCRUMB -->

            <div class="aa-breadcrumb">

                <a href="AddressBook.aspx">
                    Address Book
                </a>

                <span>›</span>

                <strong>
                    Add New Address
                </strong>

            </div>


            <!-- PAGE HEADING -->

            <div class="aa-page-heading">

                <h2>Add New Address</h2>

                <p>
                    Fill in the details below to add a new shipping address
                </p>

            </div>


            <!-- ================= FORM CARD ================= -->

            <div class="aa-card">

                <!-- ADDRESS LABEL -->

                <div class="aa-field aa-full">

                    <label>Address Label</label>

                    <asp:TextBox
                        ID="txtAddressLabel"
                        runat="server"
                        CssClass="aa-input"
                        placeholder="e.g. Warehouse, Office, Home">
                    </asp:TextBox>

                </div>


                <!-- FULL ADDRESS -->

                <div class="aa-field aa-full">

                    <label>Full Address</label>

                    <asp:TextBox
                        ID="txtFullAddress"
                        runat="server"
                        CssClass="aa-textarea"
                        TextMode="MultiLine"
                        placeholder="Street address, building name, floor, etc.">
                    </asp:TextBox>

                </div>


                <!-- CITY -->

                <div class="aa-field">

                    <label>City</label>

                    <asp:TextBox
                        ID="txtCity"
                        runat="server"
                        CssClass="aa-input"
                        placeholder="Enter city">
                    </asp:TextBox>

                </div>


                <!-- STATE -->

                <div class="aa-field">

                    <label>State</label>

                    <asp:TextBox
                        ID="txtState"
                        runat="server"
                        CssClass="aa-input"
                        placeholder="Enter state">
                    </asp:TextBox>

                </div>


                <!-- PIN -->

                <div class="aa-field">

                    <label>PIN Code</label>

                    <asp:TextBox
                        ID="txtPinCode"
                        runat="server"
                        CssClass="aa-input"
                        placeholder="6-digit postal code"
                        MaxLength="6">
                    </asp:TextBox>

                </div>


                <!-- COUNTRY -->

                <div class="aa-field">

                    <label>Country</label>

                    <asp:DropDownList
                        ID="ddlCountry"
                        runat="server"
                        CssClass="aa-input">

                        <asp:ListItem Text="India" Value="India" />

                        <asp:ListItem Text="United States" Value="United States" />

                        <asp:ListItem Text="United Kingdom" Value="United Kingdom" />

                    </asp:DropDownList>

                </div>


                <!-- PHONE -->

                <div class="aa-field aa-full">

                    <label>Contact Phone</label>

                    <asp:TextBox
                        ID="txtPhone"
                        runat="server"
                        CssClass="aa-input"
                        placeholder="+91 98765 43210">
                    </asp:TextBox>

                </div>


                <!-- ADDRESS TYPE -->

                <div class="aa-field aa-full">

                    <label>Address Type</label>

                    <div class="aa-radio-group">

                        <label class="aa-radio">
                            <asp:RadioButton
                                ID="rbWarehouse"
                                runat="server"
                                GroupName="AddressType"
                                Checked="true" />
                            <span>Warehouse</span>
                        </label>

                        <label class="aa-radio">
                            <asp:RadioButton
                                ID="rbOffice"
                                runat="server"
                                GroupName="AddressType" />
                            <span>Office</span>
                        </label>

                        <label class="aa-radio">
                            <asp:RadioButton
                                ID="rbResidential"
                                runat="server"
                                GroupName="AddressType" />
                            <span>Residential</span>
                        </label>

                        <label class="aa-radio">
                            <asp:RadioButton
                                ID="rbPort"
                                runat="server"
                                GroupName="AddressType" />
                            <span>Port/Terminal</span>
                        </label>

                    </div>

                </div>


                <!-- DEFAULT ADDRESS -->

                <div class="aa-default">

                    <asp:CheckBox
                        ID="chkDefault"
                        runat="server"
                        Checked="true" />

                    <label for="chkDefault">
                        Set as Default Delivery Address
                    </label>

                </div>


                <!-- BUTTONS -->

                <div class="aa-actions">

                    <asp:Button
                        ID="btnCancel"
                        runat="server"
                        Text="Cancel"
                        CssClass="aa-btn aa-cancel"
                        OnClick="btnCancel_Click" />

                    <asp:Button
                        ID="btnSave"
                        runat="server"
                        Text="Save Address"
                        CssClass="aa-btn aa-save"
                        OnClick="btnSave_Click" />

                </div>

            </div>

        </section>

    </main>

</div>

</form>

</body>
</html>