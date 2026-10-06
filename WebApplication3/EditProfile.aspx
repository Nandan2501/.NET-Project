<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="EditProfile.aspx.cs"
    Inherits="WebApplication3.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Edit Profile</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="CSS/style.css" rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

    <div class="edit-profile-layout">

        <!-- ================= SIDEBAR ================= -->

        <aside class="edit-profile-sidebar">

            <div class="edit-profile-logo">

                <div class="edit-profile-logo-icon">
                    ▣
                </div>

                <span>Transpo</span>

            </div>


            <nav class="edit-profile-navigation">

                <a href="Dashboard.aspx"
                   class="edit-profile-nav-item">

                    <span class="edit-profile-nav-icon">▦</span>
                    <span>Dashboard</span>

                </a>


                <a href="BookTransportation.aspx"
                   class="edit-profile-nav-item">

                    <span class="edit-profile-nav-icon">▣</span>
                    <span>Book Transportation</span>

                </a>


                <a href="MyBookings.aspx"
                   class="edit-profile-nav-item">

                    <span class="edit-profile-nav-icon">☷</span>
                    <span>My Bookings</span>

                </a>


                <a href="Payments.aspx"
                   class="edit-profile-nav-item">

                    <span class="edit-profile-nav-icon">▱</span>
                    <span>Payments</span>

                </a>


                <a href="AddressBook.aspx"
                   class="edit-profile-nav-item">

                    <span class="edit-profile-nav-icon">▣</span>
                    <span>Address Book</span>

                </a>


                <a href="Profile.aspx"
                   class="edit-profile-nav-item active">

                    <span class="edit-profile-nav-icon">♙</span>
                    <span>Profile</span>

                </a>

            </nav>


            <!-- LOGOUT -->

            <div class="edit-profile-logout">

                <a href="Login.aspx">

                    <span>↪</span>
                    <span>Logout</span>

                </a>

            </div>

        </aside>


        <!-- ================= MAIN ================= -->

        <main class="edit-profile-main">

            <!-- TOP BAR -->

            <header class="edit-profile-topbar">

                <div class="edit-profile-heading">

                    <h1>My Profile</h1>

                    <p>
                        Manage your personal credentials, fleet stats, and performance verification.
                    </p>

                </div>


                <div class="edit-profile-user">

                    <div class="edit-profile-user-avatar">

                        <img src="Images/profile.jpg"
                             alt="Nandan Nasit"
                             onerror="this.style.display='none';" />

                    </div>


                    <div class="edit-profile-user-details">

                        <strong>Nandan Nasit</strong>

                        <span>Standard Customer</span>

                    </div>

                </div>

            </header>


            <!-- CONTENT -->

            <section class="edit-profile-content">


                <!-- TABS -->

                <div class="edit-profile-tabs">

                    <a href="Profile.aspx"
                       class="edit-profile-tab active">

                        Personal Information

                    </a>


                  


                   

                </div>


                <!-- CARD -->

                <div class="edit-profile-card">


                    <!-- PHOTO SECTION -->

                    <div class="edit-profile-photo-section">

                        <div class="edit-profile-photo-wrapper">

                            <asp:Image
                                ID="imgProfile"
                                runat="server"
                                CssClass="edit-profile-photo"
                                ImageUrl="Images/profile.jpg"
                                AlternateText="Profile Photo" />

                        </div>


                        <asp:FileUpload
                            ID="fuProfilePhoto"
                            runat="server"
                            CssClass="edit-profile-file-upload" />


                        <asp:Button
                            ID="btnChangePhoto"
                            runat="server"
                            Text="Change Photo"
                            CssClass="edit-profile-change-photo"
                            CausesValidation="false"
                            OnClick="btnChangePhoto_Click" />


                        <div class="edit-profile-photo-note">

                            Allowed JPG, GIF or PNG.
                            Max size of 800KB

                        </div>

                    </div>


                    <!-- INFORMATION -->

                    <div class="edit-profile-information">


                        <!-- ROW 1 -->

                        <div class="edit-profile-field-row">

                            <div class="edit-profile-field">

                                <label>Full Name</label>

                                <asp:TextBox
                                    ID="txtFullName"
                                    runat="server"
                                    CssClass="edit-profile-input">
                                </asp:TextBox>

                            </div>


                            <div class="edit-profile-field">

                                <label>Email</label>

                                <asp:TextBox
                                    ID="txtEmail"
                                    runat="server"
                                    CssClass="edit-profile-input">
                                </asp:TextBox>

                            </div>

                        </div>


                        <!-- ROW 2 -->

                        <div class="edit-profile-field-row">

                            <div class="edit-profile-field">

                                <label>Phone</label>

                                <asp:TextBox
                                    ID="txtPhone"
                                    runat="server"
                                    CssClass="edit-profile-input">
                                </asp:TextBox>

                            </div>


                            <div class="edit-profile-field">

                                <label>Date of Birth</label>

                                <asp:TextBox
                                    ID="txtDob"
                                    runat="server"
                                    CssClass="edit-profile-input">
                                </asp:TextBox>

                            </div>

                        </div>


                        <!-- ADDRESS -->

                        <div class="edit-profile-field edit-profile-address">

                            <label>Address</label>

                            <asp:TextBox
                                ID="txtAddress"
                                runat="server"
                                CssClass="edit-profile-input">
                            </asp:TextBox>

                        </div>


                        <!-- BUTTONS -->

                        <div class="edit-profile-buttons">

                            <asp:Button
                                ID="btnSave"
                                runat="server"
                                Text="Save Changes"
                                CssClass="edit-profile-save-button"
                                OnClick="btnSave_Click" />


                            <asp:Button
                                ID="btnCancel"
                                runat="server"
                                Text="Cancel"
                                CssClass="edit-profile-cancel-button"
                                CausesValidation="false"
                                OnClick="btnCancel_Click" />

                        </div>

                    </div>

                </div>

            </section>

        </main>

    </div>

</form>

</body>

</html>