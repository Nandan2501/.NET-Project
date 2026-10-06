<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs"
    Inherits="WebApplication3.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>My Profile</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="CSS/style.css" rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

    <div class="profile-layout">

        <!-- ================= SIDEBAR ================= -->

        <aside class="profile-sidebar">

            <div class="profile-logo">
                <div class="profile-logo-icon">▣</div>
                <span>Transpo</span>
            </div>

            <nav class="profile-navigation">

                <a href="Dashboard.aspx" class="profile-nav-item">
                    <span class="profile-nav-icon">▦</span>
                    <span>Dashboard</span>
                </a>

                <a href="BookTransportation.aspx" class="profile-nav-item">
                    <span class="profile-nav-icon">▣</span>
                    <span>Book Transportation</span>
                </a>

                <a href="MyBookings.aspx" class="profile-nav-item">
                    <span class="profile-nav-icon">☷</span>
                    <span>My Bookings</span>
                </a>

                <a href="Payments.aspx" class="profile-nav-item">
                    <span class="profile-nav-icon">▱</span>
                    <span>Payments</span>
                </a>

                <a href="AddressBook.aspx" class="profile-nav-item">
                    <span class="profile-nav-icon">▣</span>
                    <span>Address Book</span>
                </a>

                <a href="Profile.aspx" class="profile-nav-item active">
                    <span class="profile-nav-icon">♙</span>
                    <span>Profile</span>
                </a>

            </nav>

            <div class="profile-logout">

                <a href="Login.aspx">
                    <span>↪</span>
                    <span>Logout</span>
                </a>

            </div>

        </aside>


        <!-- ================= MAIN CONTENT ================= -->

        <main class="profile-main">

            <!-- TOP BAR -->

            <header class="profile-topbar">

                <h1>My Profile</h1>

                <div class="profile-user">

                    <div class="profile-user-avatar">
                        <img src="Images/profile.jpg"
                             alt="Nandan Nasit"
                             onerror="this.style.display='none';" />
                    </div>

                    <div class="profile-user-details">
                        <strong>Nandan Nasit</strong>
                        <span>Standard Customer</span>
                    </div>

                </div>

            </header>


            <!-- PAGE CONTENT -->

            <section class="profile-content">

                <!-- TABS -->

                <div class="profile-tabs">

                    <a href="#" class="profile-tab active">
                        Personal Information
                    </a>

                    <a href="ChangePassword.aspx" class="profile-tab">
                        Change Password
                    </a>

                  

                </div>


                <!-- PROFILE CARD -->

                <div class="profile-card">

                    <!-- LEFT PHOTO -->

                    <div class="profile-photo-section">

                        <div class="profile-photo-wrapper">

                            <asp:Image
                                ID="imgProfile"
                                runat="server"
                                CssClass="profile-photo"
                                ImageUrl="Images/profile.jpg"
                                AlternateText="Profile Photo" />

                        </div>


                        <button type="button"
                                class="profile-change-photo">
                            Change Photo
                        </button>


                        <div class="profile-photo-note">
                            Allowed JPG, GIF or PNG. Max size of 800KB
                        </div>

                    </div>


                    <!-- RIGHT INFORMATION -->

                    <div class="profile-information">

                        <!-- ROW 1 -->

                        <div class="profile-field-row">

                            <div class="profile-field">

                                <label>Full Name</label>

                                <asp:TextBox
                                    ID="txtFullName"
                                    runat="server"
                                    CssClass="profile-input"
                                    ReadOnly="true">
                                </asp:TextBox>

                            </div>


                            <div class="profile-field">

                                <label>Email</label>

                                <asp:TextBox
                                    ID="txtEmail"
                                    runat="server"
                                    CssClass="profile-input"
                                    ReadOnly="true">
                                </asp:TextBox>

                            </div>

                        </div>


                        <!-- ROW 2 -->

                        <div class="profile-field-row">

                            <div class="profile-field">

                                <label>Phone</label>

                                <asp:TextBox
                                    ID="txtPhone"
                                    runat="server"
                                    CssClass="profile-input"
                                    ReadOnly="true">
                                </asp:TextBox>

                            </div>


                            <div class="profile-field">

                                <label>Date of Birth</label>

                                <asp:TextBox
                                    ID="txtDob"
                                    runat="server"
                                    CssClass="profile-input"
                                    ReadOnly="true">
                                </asp:TextBox>

                            </div>

                        </div>


                        <!-- ADDRESS -->

                        <div class="profile-field profile-address">

                            <label>Address</label>

                            <asp:TextBox
                                ID="txtAddress"
                                runat="server"
                                CssClass="profile-input"
                                ReadOnly="true">
                            </asp:TextBox>

                        </div>


                        <!-- EDIT BUTTON -->

                        <div class="profile-button-area">

                            <asp:Button
                                ID="btnEditProfile"
                                runat="server"
                                Text="Edit Profile"
                                CssClass="profile-edit-button"
                                OnClick="btnEditProfile_Click" />

                        </div>

                    </div>

                </div>

            </section>

        </main>

    </div>

</form>

</body>

</html>