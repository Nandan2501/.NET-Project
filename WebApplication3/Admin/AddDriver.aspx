<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AddDriver.aspx.cs"
    Inherits="WebApplication3.AddDriver" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Driver</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="../CSS/style.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

    <div class="ad-layout">

        <!-- ================= SIDEBAR ================= -->
        <aside class="ad-sidebar">

            <div class="ad-logo">
                <div class="ad-logo-icon">▣</div>
                <span>Transpo</span>
            </div>

            <nav class="ad-navigation">

                <a href="Dashboard.aspx" class="ad-nav-item">
                    <span class="ad-nav-icon">▦</span>
                    <span>Dashboard</span>
                </a>

                <a href="Vehicles.aspx" class="ad-nav-item">
                    <span class="ad-nav-icon">♧</span>
                    <span>Vehicles</span>
                </a>

                <a href="Drivers.aspx" class="ad-nav-item active">
                    <span class="ad-nav-icon">♙</span>
                    <span>Drivers</span>
                </a>

                <a href="Customers.aspx" class="ad-nav-item">
                    <span class="ad-nav-icon">♙</span>
                    <span>Customers</span>
                </a>

                <a href="Payments.aspx" class="ad-nav-item">
                    <span class="ad-nav-icon">▱</span>
                    <span>Payments</span>
                </a>

                <a href="Reports.aspx" class="ad-nav-item">
                    <span class="ad-nav-icon">▥</span>
                    <span>Reports</span>
                </a>

                <a href="Settings.aspx" class="ad-nav-item">
                    <span class="ad-nav-icon">⚙</span>
                    <span>Settings</span>
                </a>

            </nav>

        </aside>


        <!-- ================= MAIN ================= -->
        <main class="ad-main">

            <!-- TOP BAR -->
            <header class="ad-topbar">

                <div></div>

                <div class="ad-admin-profile">

                    <div class="ad-admin-avatar">
                        👤
                    </div>

                    <div class="ad-admin-info">
                        <strong>Chirag</strong>
                        <span>Admin</span>
                    </div>

                </div>

            </header>


            <!-- CONTENT -->
            <section class="ad-content">

                <div class="ad-page-heading">
                    <h1>Add New Driver</h1>

                    <p>
                        Fill in the details below to register a new driver to your fleet.
                    </p>
                </div>


                <!-- FORM CARD -->
                <div class="ad-form-card">

                    <div class="ad-card-title">
                        Driver Information
                    </div>


                    <div class="ad-form-body">

                        <!-- DRIVER NAME -->
                        <div class="ad-form-group">
                            <label for="txtDriverName">
                                DRIVER NAME
                            </label>

                            <asp:TextBox
                                ID="txtDriverName"
                                runat="server"
                                CssClass="ad-input"
                                placeholder="Enter driver's full name">
                            </asp:TextBox>

                            <asp:RequiredFieldValidator
                                ID="rfvDriverName"
                                runat="server"
                                ControlToValidate="txtDriverName"
                                ErrorMessage="Driver name is required."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>


                        <!-- PHONE -->
                        <div class="ad-form-group">
                            <label for="txtPhone">
                                PHONE NUMBER
                            </label>

                            <asp:TextBox
                                ID="txtPhone"
                                runat="server"
                                CssClass="ad-input"
                                placeholder="+91 00000 00000">
                            </asp:TextBox>

                            <asp:RequiredFieldValidator
                                ID="rfvPhone"
                                runat="server"
                                ControlToValidate="txtPhone"
                                ErrorMessage="Phone number is required."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator
                                ID="revPhone"
                                runat="server"
                                ControlToValidate="txtPhone"
                                ValidationExpression="^[0-9]{10}$"
                                ErrorMessage="Please enter a valid 10-digit phone number."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>
                        </div>


                        <!-- LICENSE -->
                        <div class="ad-form-group">
                            <label for="txtLicense">
                                LICENSE NUMBER
                            </label>

                            <asp:TextBox
                                ID="txtLicense"
                                runat="server"
                                CssClass="ad-input"
                                placeholder="DL-XXXXXXXXXXXX">
                            </asp:TextBox>

                            <asp:RequiredFieldValidator
                                ID="rfvLicense"
                                runat="server"
                                ControlToValidate="txtLicense"
                                ErrorMessage="License number is required."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>


                        <!-- DATE OF BIRTH -->
                        <div class="ad-form-group">
                            <label for="txtDOB">
                                DATE OF BIRTH
                            </label>

                            <asp:TextBox
                                ID="txtDOB"
                                runat="server"
                                CssClass="ad-input"
                                TextMode="Date">
                            </asp:TextBox>

                            <asp:RequiredFieldValidator
                                ID="rfvDOB"
                                runat="server"
                                ControlToValidate="txtDOB"
                                ErrorMessage="Date of birth is required."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>


                        <!-- ADDRESS -->
                        <div class="ad-form-group ad-full-width">

                            <label for="txtAddress">
                                FULL ADDRESS
                            </label>

                            <asp:TextBox
                                ID="txtAddress"
                                runat="server"
                                CssClass="ad-textarea"
                                TextMode="MultiLine"
                                placeholder="Enter permanent address details">
                            </asp:TextBox>

                            <asp:RequiredFieldValidator
                                ID="rfvAddress"
                                runat="server"
                                ControlToValidate="txtAddress"
                                ErrorMessage="Address is required."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>

                        </div>


                        <!-- LICENSE PHOTO -->
                        <div class="ad-form-group ad-full-width">

                            <label>
                                DRIVER'S LICENSE PHOTO
                            </label>

                            <div class="ad-upload-box">

                                <div class="ad-upload-icon">
                                    ☁
                                </div>

                                <div class="ad-upload-title">
                                    Click to upload or drag and drop
                                </div>

                                <div class="ad-upload-info">
                                    SVG, PNG, JPG or PDF (max. 5MB)
                                </div>

                                <asp:FileUpload
                                    ID="fuLicense"
                                    runat="server"
                                    CssClass="ad-file-upload" />

                            </div>

                        </div>

                    </div>


                    <!-- ACTIONS -->
                    <div class="ad-actions">

                        <asp:Button
                            ID="btnCancel"
                            runat="server"
                            Text="Cancel"
                            CssClass="ad-btn ad-btn-cancel"
                            CausesValidation="false"
                            OnClick="btnCancel_Click" />

                        <asp:Button
                            ID="btnSaveDriver"
                            runat="server"
                            Text="Save Driver"
                            CssClass="ad-btn ad-btn-primary"
                            OnClick="btnSaveDriver_Click" />

                    </div>

                </div>

            </section>

        </main>

    </div>

</form>

</body>
</html>



dadadada