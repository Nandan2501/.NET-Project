<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AddVehicle.aspx.cs"
    Inherits="WebApplication3.AddVehicle" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Vehicle</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="../CSS/style.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

    <div class="av-layout">

        <!-- ================= SIDEBAR ================= -->
        <aside class="av-sidebar">

            <div class="av-logo">
                <div class="av-logo-icon">▣</div>
                <span>Transpo</span>
            </div>

            <nav class="av-navigation">

                <a href="Dashboard.aspx" class="av-nav-item">
                    <span class="av-nav-icon">▦</span>
                    <span>Dashboard</span>
                </a>

                <a href="Vehicles.aspx" class="av-nav-item active">
                    <span class="av-nav-icon">♧</span>
                    <span>Vehicles</span>
                </a>

                <a href="Drivers.aspx" class="av-nav-item">
                    <span class="av-nav-icon">♙</span>
                    <span>Drivers</span>
                </a>

                <a href="Payments.aspx" class="av-nav-item">
                    <span class="av-nav-icon">▱</span>
                    <span>Payments</span>
                </a>

                <a href="Reports.aspx" class="av-nav-item">
                    <span class="av-nav-icon">▥</span>
                    <span>Reports</span>
                </a>

                <a href="Settings.aspx" class="av-nav-item">
                    <span class="av-nav-icon">⚙</span>
                    <span>Settings</span>
                </a>

            </nav>

        </aside>


        <!-- ================= MAIN ================= -->
        <main class="av-main">

            <!-- TOP BAR -->
            <header class="av-topbar">

                <h1>Add Vehicle</h1>

                <div class="av-admin-profile">

                    <div class="av-admin-avatar">
                        👤
                    </div>

                    <div class="av-admin-info">
                        <strong>Chirag</strong>
                        <span>Admin</span>
                    </div>

                </div>

            </header>


            <!-- CONTENT -->
            <section class="av-content">

                <div class="av-form-card">

                    <div class="av-form-grid">

                        <!-- VEHICLE NAME -->
                        <div class="av-form-group">
                            <label for="ddlVehicleName">
                                Vehicle Name
                            </label>

                            <asp:DropDownList
                                ID="ddlVehicleName"
                                runat="server"
                                CssClass="av-input">

                                <asp:ListItem Value="">
                                    Select vehicle
                                </asp:ListItem>

                                <asp:ListItem>
                                    Mahindra Bolero
                                </asp:ListItem>

                                <asp:ListItem>
                                    Tata Ace
                                </asp:ListItem>

                                <asp:ListItem>
                                    Ashok Leyland
                                </asp:ListItem>

                            </asp:DropDownList>
                        </div>


                        <!-- DRIVER -->
                        <div class="av-form-group">
                            <label for="ddlDriver">
                                Driver
                            </label>

                            <asp:DropDownList
                                ID="ddlDriver"
                                runat="server"
                                CssClass="av-input">

                                <asp:ListItem Value="">
                                    Assign driver
                                </asp:ListItem>

                                <asp:ListItem>
                                    Abhay
                                </asp:ListItem>

                                <asp:ListItem>
                                    Raj Patel
                                </asp:ListItem>

                                <asp:ListItem>
                                    Nandan
                                </asp:ListItem>

                            </asp:DropDownList>
                        </div>


                        <!-- VEHICLE TYPE -->
                        <div class="av-form-group">
                            <label for="txtVehicleType">
                                Vehicle type
                            </label>

                            <asp:TextBox
                                ID="txtVehicleType"
                                runat="server"
                                CssClass="av-input"
                                placeholder="Enter vehicle type">
                            </asp:TextBox>
                        </div>


                        <!-- LICENSE PLATE -->
                        <div class="av-form-group">
                            <label for="txtLicensePlate">
                                LICENSE PLATE
                            </label>

                            <asp:TextBox
                                ID="txtLicensePlate"
                                runat="server"
                                CssClass="av-input"
                                Text="GJ-01-XX-1102">
                            </asp:TextBox>
                        </div>


                        <!-- STATUS -->
                        <div class="av-form-group">
                            <label for="txtStatus">
                                Status
                            </label>

                            <asp:TextBox
                                ID="txtStatus"
                                runat="server"
                                CssClass="av-input"
                                Text="Active">
                            </asp:TextBox>
                        </div>


                        <!-- AGE -->
                        <div class="av-form-group">
                            <label for="txtAge">
                                Age
                            </label>

                            <asp:TextBox
                                ID="txtAge"
                                runat="server"
                                CssClass="av-input"
                                placeholder="Age Enter"
                                TextMode="Number">
                            </asp:TextBox>
                        </div>


                        <!-- AADHAR CARD -->
                        <div class="av-form-group">
                            <label for="txtAadhar">
                                AAdhar card
                            </label>

                            <asp:DropDownList
                                ID="txtAadhar"
                                runat="server"
                                CssClass="av-input">

                                <asp:ListItem Value="">
                                    Aadhar card Enter
                                </asp:ListItem>

                                <asp:ListItem>
                                    Verified
                                </asp:ListItem>

                                <asp:ListItem>
                                    Not Verified
                                </asp:ListItem>

                            </asp:DropDownList>
                        </div>


                        <!-- EMPTY GRID SPACE -->
                        <div></div>

                    </div>


                    <!-- NOTES -->
                    <div class="av-notes-group">

                        <label for="txtNotes">
                            Notes
                        </label>

                        <asp:TextBox
                            ID="txtNotes"
                            runat="server"
                            CssClass="av-textarea"
                            TextMode="MultiLine"
                            placeholder="Add optional booking notes or dispatch instructions...">
                        </asp:TextBox>

                    </div>


                    <!-- BUTTONS -->
                    <div class="av-actions">

                        <asp:Button
                            ID="btnCancel"
                            runat="server"
                            Text="Cancel"
                            CssClass="av-btn av-btn-cancel"
                            OnClick="btnCancel_Click" />

                        <asp:Button
                            ID="btnAddVehicle"
                            runat="server"
                            Text="Add Vehicle"
                            CssClass="av-btn av-btn-primary"
                            OnClick="btnAddVehicle_Click" />

                    </div>

                </div>

            </section>

        </main>

    </div>

</form>

</body>
</html>


adadaada