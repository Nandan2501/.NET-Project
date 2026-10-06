<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Vehicles.aspx.cs"
    Inherits="WebApplication3.AdminVehicles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Fleet Vehicles - Transpo</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <!-- Because this page is inside Admin folder -->
    <link rel="stylesheet"
          href="../CSS/style.css" />

</head>

<body>

<form id="form1" runat="server">

<div class="admin-dashboard-page">

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

     <a href="Vehicle.aspx" class="cu-nav-item active">
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

     <a href="Payment.aspx" class="cu-nav-item">
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


    <!-- ================= MAIN ================= -->

    <main class="admin-main">


        <!-- TOPBAR -->

        <header class="admin-topbar">

            <div class="admin-page-title">

                <h1>
                    Fleet Vehicles
                </h1>

            </div>


            <div class="admin-user">

                <div class="admin-user-avatar">
                    ♟
                </div>

                <div class="admin-user-details">

                    <strong>
                        Chirag
                    </strong>

                    <span>
                        Admin
                    </span>

                </div>

            </div>

        </header>


        <!-- ================= CONTENT ================= -->

        <section class="admin-content vehicles-page-content">


            <!-- PAGE HEADING -->

            <div class="vehicles-heading-row">

                <div>

                    <h2>
                        Fleet Vehicles
                    </h2>

                    <p>
                        Manage and monitor your vehicle assets
                    </p>

                </div>


                <asp:Button
                    ID="btnAddVehicle"
                    runat="server"
                    Text="+ Add Vehicle"
                    CssClass="add-vehicle-button"
                    OnClick="btnAddVehicle_Click" />

            </div>


            <!-- ================= VEHICLES CARD ================= -->

            <div class="vehicles-card">


                <div class="vehicles-card-title">

                    <span>
                        All Vehicles (32)
                    </span>

                </div>


                <div class="vehicles-table-wrapper">

                    <asp:GridView
                        ID="gvVehicles"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="vehicles-table"
                        GridLines="None"
                        OnRowCommand="gvVehicles_RowCommand">

                        <Columns>


                          

                            <asp:BoundField
                                DataField="VehicleId"
                                HeaderText="VEHICLE ID" />


                           

                            <asp:BoundField
                                DataField="VehicleName"
                                HeaderText="VEHICLE NAME" />


                            

                            <asp:BoundField
                                DataField="Type"
                                HeaderText="TYPE" />


                            

                            <asp:BoundField
                                DataField="LicensePlate"
                                HeaderText="LICENSE PLATE" />


                          

                            <asp:TemplateField
                                HeaderText="STATUS">

                                <ItemTemplate>

                                    <span class='<%# GetVehicleStatusClass(Eval("Status").ToString()) %>'>

                                        <%# Eval("Status") %>

                                    </span>

                                </ItemTemplate>

                            </asp:TemplateField>


                          

                            <asp:BoundField
                                DataField="Driver"
                                HeaderText="DRIVER ASSIGNED" />


                         
                            <asp:TemplateField
                                HeaderText="ACTIONS">

                                <ItemTemplate>

                                    <asp:LinkButton
                                        ID="btnVehicleAction"
                                        runat="server"
                                        CssClass="vehicle-action-button"
                                        CommandName="VehicleAction"
                                        CommandArgument='<%# Eval("VehicleId") %>'>

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
                CssClass="vehicle-message">
            </asp:Label>


        </section>

    </main>

</div>

</form>

</body>

</html>


dadadadada