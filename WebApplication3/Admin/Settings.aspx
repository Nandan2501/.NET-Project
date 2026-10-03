<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Settings.aspx.cs"
    Inherits="WebApplication3.AdminSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Settings - Transpo</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <link rel="stylesheet"
          href="../CSS/style.css" />

    <link rel="stylesheet"
          href="../CSS/admin-settings.css" />

</head>

<body>

<form id="form1" runat="server">

<div class="admin-layout">

    <!-- ================= SIDEBAR ================= -->

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

     <a href="Customers.aspx" class="cu-nav-item">
         <span class="cu-nav-icon">♙</span>
         <span>Customers</span>
     </a>

     <a href="Payment.aspx" class="cu-nav-item">
         <span class="cu-nav-icon">▱</span>
         <span>Payments</span>
     </a>

     <a href="Reports.aspx" class="cu-nav-item">
         <span class="cu-nav-icon">▥</span>
         <span>Reports</span>
     </a>

     <a href="Settings.aspx" class="cu-nav-item active">
         <span class="cu-nav-icon">⚙</span>
         <span>Settings</span>
     </a>

 </nav>

        <div class="admin-logout">

            <a href="../Login.aspx">

                <span class="logout-icon">↪</span>

                <span>Logout</span>

            </a>

        </div>

    </aside>


    <!-- ================= MAIN ================= -->

    <main class="admin-main">


        <!-- TOP BAR -->

        <header class="admin-topbar">

            <div class="topbar-title">
                Settings
            </div>


            <div class="admin-profile">

                <div class="admin-profile-image">
                    👤
                </div>

                <div class="admin-profile-text">

                    <strong>Chirag</strong>

                    <span>Admin</span>

                </div>

            </div>

        </header>


        <!-- ================= CONTENT ================= -->

        <section class="settings-content">


            <div class="settings-card">


                <!-- HEADER -->

                <div class="settings-header">

                    <h1>
                        Company Profile
                    </h1>

                    <p>
                        Manage your organization details, registration info, and billing address.
                    </p>

                </div>


                <div class="settings-divider"></div>


                <!-- LOGO SECTION -->

                <div class="company-logo-section">


                    <div class="company-logo">

                        🚚

                    </div>


                    <div class="logo-actions">

                        <asp:Button
                            ID="btnUploadLogo"
                            runat="server"
                            Text="Upload New Logo"
                            CssClass="btn-upload-logo" />


                        <asp:Button
                            ID="btnRemoveLogo"
                            runat="server"
                            Text="Remove"
                            CssClass="btn-remove-logo" />

                    </div>

                </div>


                <!-- FORM -->

                <div class="company-form">


                    <!-- ROW 1 -->

                    <div class="form-group">

                        <label>
                            Company Name
                        </label>

                        <asp:TextBox
                            ID="txtCompanyName"
                            runat="server"
                            CssClass="settings-input"
                            Text="tata">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <label>
                            State / Province
                        </label>

                        <asp:TextBox
                            ID="txtState"
                            runat="server"
                            CssClass="settings-input"
                            Text="Gujarat">
                        </asp:TextBox>

                    </div>


                    <!-- ROW 2 -->

                    <div class="form-group">

                        <label>
                            Street Address
                        </label>

                        <asp:TextBox
                            ID="txtStreetAddress"
                            runat="server"
                            CssClass="settings-input"
                            Text="401-404, Dev Prime, Corporate Road">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <label>
                            pincode
                        </label>

                        <asp:TextBox
                            ID="txtPincode"
                            runat="server"
                            CssClass="settings-input"
                            Text="380051">
                        </asp:TextBox>

                    </div>


                    <!-- ROW 3 -->

                    <div class="form-group">

                        <label>
                            City
                        </label>

                        <asp:TextBox
                            ID="txtCity"
                            runat="server"
                            CssClass="settings-input"
                            Text="Ahmedabad">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <label>
                            Country
                        </label>

                        <asp:DropDownList
                            ID="ddlCountry"
                            runat="server"
                            CssClass="settings-input">

                            <asp:ListItem
                                Text="India"
                                Value="India"
                                Selected="True">
                            </asp:ListItem>

                            <asp:ListItem
                                Text="United States"
                                Value="United States">
                            </asp:ListItem>

                            <asp:ListItem
                                Text="United Kingdom"
                                Value="United Kingdom">
                            </asp:ListItem>

                            <asp:ListItem
                                Text="Canada"
                                Value="Canada">
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>


                    <!-- ROW 4 -->

                    <div class="form-group empty-form-group">
                    </div>


                    <div class="form-group">

                        <label>
                            Billing Contact Email
                        </label>

                        <asp:TextBox
                            ID="txtBillingEmail"
                            runat="server"
                            CssClass="settings-input"
                            Text="accounts@transpo.com">
                        </asp:TextBox>

                    </div>

                </div>


                <!-- BOTTOM -->

                <div class="settings-bottom">

                    <asp:Button
                        ID="btnUpdateProfile"
                        runat="server"
                        Text="Update Profile"
                        CssClass="btn-update-profile"
                        OnClick="btnUpdateProfile_Click" />

                </div>


                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="settings-message">
                </asp:Label>


            </div>

        </section>

    </main>

</div>

</form>

</body>

</html>