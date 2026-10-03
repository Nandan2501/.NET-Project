<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Customers.aspx.cs"
    Inherits="WebApplication3.Customers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Active Customer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="../CSS/style.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

<div class="cu-layout">

    <!-- ================= SIDEBAR ================= -->

    <aside class="cu-sidebar">

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

            <a href="Customers.aspx" class="cu-nav-item active">
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

    </aside>


    <!-- ================= MAIN ================= -->

    <main class="cu-main">

        <!-- TOP BAR -->

        <header class="cu-topbar">

            <div></div>

            <div class="cu-admin-profile">

                <div class="cu-admin-avatar">
                    👤
                </div>

                <div class="cu-admin-info">
                    <strong>Chirag</strong>
                    <span>Admin</span>
                </div>

            </div>

        </header>


        <!-- ================= CONTENT ================= -->

        <section class="cu-content">

            <div class="cu-page-header">

                <h1>Active Customer</h1>

                <asp:Button
                    ID="btnAddCustomer"
                    runat="server"
                    Text="+  Add customer"
                    CssClass="cu-add-btn"
                    OnClick="btnAddCustomer_Click" />

            </div>


            <!-- CUSTOMER CARD -->

            <div class="cu-card">

                <div class="cu-card-title">
                    All Registered Drivers (35)
                </div>


                <!-- TABLE HEADER -->

                <div class="cu-table-head">

                    <div>Customer ID</div>
                    <div>Customer NAME</div>
                    <div>PHONE</div>
                    <div>CITY</div>
                    <div>STATUS</div>
                    <div>Email</div>
                    <div>ACTIONS</div>

                </div>


                <!-- CUSTOMER 1 -->

                <div class="cu-table-row">

                    <div class="cu-id">
                        #cut-5501
                    </div>

                    <div>
                        yash
                    </div>

                    <div>
                        +91 93274 68707
                    </div>

                    <div>
                        Rajkot
                    </div>

                    <div>
                        <span class="cu-status active">
                            Active
                        </span>
                    </div>

                    <div>
                        yashop78@gmail.com
                    </div>

                    <div class="cu-action">
                        ⋯
                    </div>

                </div>


                <!-- CUSTOMER 2 -->

                <div class="cu-table-row">

                    <div class="cu-id">
                        #cut-5502
                    </div>

                    <div>
                        vijay
                    </div>

                    <div>
                        +91 83202 46902
                    </div>

                    <div>
                        surat
                    </div>

                    <div>
                        <span class="cu-status active">
                            Active
                        </span>
                    </div>

                    <div>
                        vijayop788@gmail.com
                    </div>

                    <div class="cu-action">
                        ⋯
                    </div>

                </div>


                <!-- CUSTOMER 3 -->

                <div class="cu-table-row">

                    <div class="cu-id">
                        #cut-5503
                    </div>

                    <div>
                        himil
                    </div>

                    <div>
                        +91 85964 54698
                    </div>

                    <div>
                        aanad
                    </div>

                    <div>
                        <span class="cu-status active">
                            Active
                        </span>
                    </div>

                    <div>
                        himilbhaya45@gmail.com
                    </div>

                    <div class="cu-action">
                        ⋯
                    </div>

                </div>


                <!-- CUSTOMER 4 -->

                <div class="cu-table-row">

                    <div class="cu-id">
                        #cut-5504
                    </div>

                    <div>
                        ramesh
                    </div>

                    <div>
                        +91 78455 36589
                    </div>

                    <div>
                        akleshwar
                    </div>

                    <div>
                        <span class="cu-status active">
                            Active
                        </span>
                    </div>

                    <div>
                        ramesh554@gmail.com
                    </div>

                    <div class="cu-action">
                        ⋯
                    </div>

                </div>


                <!-- CUSTOMER 5 -->

                <div class="cu-table-row">

                    <div class="cu-id">
                        #cut-5505
                    </div>

                    <div>
                        raju
                    </div>

                    <div>
                        +91 96589 65896
                    </div>

                    <div>
                        baroda
                    </div>

                    <div>
                        <span class="cu-status inactive">
                            Inactive
                        </span>
                    </div>

                    <div>
                        rajubhau4558@gmail.com
                    </div>

                    <div class="cu-action">
                        ⋯
                    </div>

                </div>


                <!-- CUSTOMER 6 -->

                <div class="cu-table-row">

                    <div class="cu-id">
                        #cut-5506
                    </div>

                    <div>
                        viram
                    </div>

                    <div>
                        +91 96587 25698
                    </div>

                    <div>
                        bhuj
                    </div>

                    <div>
                        <span class="cu-status active">
                            Active
                        </span>
                    </div>

                    <div>
                        viramviro789@gmail.com
                    </div>

                    <div class="cu-action">
                        ⋯
                    </div>

                </div>

            </div>

        </section>

    </main>

</div>

</form>

</body>
</html>