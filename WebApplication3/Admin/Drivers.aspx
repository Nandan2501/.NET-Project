<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Drivers.aspx.cs"
    Inherits="WebApplication3.AdminDrivers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Active Drivers - Transpo</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <!-- Main CSS -->
    <link rel="stylesheet"
          href="../CSS/style.css" />

</head>

<body>

<form id="form1" runat="server">

<div class="admin-dashboard-page">

    <!-- =====================================================
         SIDEBAR
    ====================================================== -->

    <aside class="admin-sidebar">

        <!-- LOGO -->

       <div class="admin-brand">

    <div class="brand-icon">
        🚚
    </div>

    <span>Transpo</span>

</div>


        <!-- NAVIGATION -->
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


        <!-- LOGOUT -->

        <div class="admin-logout">

            <a href="../Login.aspx">

                <span>↪</span>

                <span>Logout</span>

            </a>

        </div>

    </aside>


    <!-- =====================================================
         MAIN CONTENT
    ====================================================== -->

    <main class="admin-main">


        <!-- TOP BAR -->

        <header class="admin-topbar">

            <div class="admin-page-title">

                <h1>
                    Active Drivers
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


        <!-- =================================================
             PAGE CONTENT
        ================================================== -->

        <section class="admin-content drivers-page-content">


            <!-- HEADING -->

            <div class="drivers-heading-row">

                <div>

                    <h2>
                        Active Drivers
                    </h2>

                    <p>
                        Verify, manage, and assign drivers to your fleet
                    </p>

                </div>


                <asp:Button
                    ID="btnAddDriver"
                    runat="server"
                    Text="+ Add Driver"
                    CssClass="add-driver-button"
                    OnClick="btnAddDriver_Click" />

            </div>


            <!-- =================================================
                 DRIVER TABLE CARD
            ================================================== -->

            <div class="drivers-card">



                <div class="drivers-card-title">

                    <span>
                        All Registered Drivers (35)
                    </span>

                </div>


               

                <div class="drivers-table-wrapper">

                    <asp:GridView
                        ID="gvDrivers"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="drivers-table"
                        GridLines="None"
                        OnRowCommand="gvDrivers_RowCommand">

                        <Columns>


                           

                            <asp:BoundField
                                DataField="DriverId"
                                HeaderText="DRIVER ID" />


                            

                            <asp:BoundField
                                DataField="DriverName"
                                HeaderText="DRIVER NAME" />



                            <asp:BoundField
                                DataField="Phone"
                                HeaderText="PHONE" />


                       

                            <asp:BoundField
                                DataField="LicenseNo"
                                HeaderText="LICENSE NO." />


                         

                            <asp:TemplateField
                                HeaderText="STATUS">

                                <ItemTemplate>

                                    <span class='<%# GetDriverStatusClass(Eval("Status").ToString()) %>'>

                                        <%# Eval("Status") %>

                                    </span>

                                </ItemTemplate>

                            </asp:TemplateField>


                          

                            <asp:BoundField
                                DataField="Vehicle"
                                HeaderText="ASSIGNED VEHICLE" />


                            

                            <asp:TemplateField
                                HeaderText="ACTIONS">

                                <ItemTemplate>

                                    <asp:LinkButton
                                        ID="btnDriverAction"
                                        runat="server"
                                        CssClass="driver-action-button"
                                        CommandName="DriverAction"
                                        CommandArgument='<%# Eval("DriverId") %>'>

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
                CssClass="driver-message">
            </asp:Label>


        </section>

    </main>

</div>

</form>

</body>

</html>



adadadada