<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="EditProfile.aspx.cs"
    Inherits="WebApplication3.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - My Profile</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <link href="CSS/style.css"
          rel="stylesheet" />

    <link href="CSS/editprofile.css"
          rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

<div class="profile-page">


    <!-- =====================================================
         SIDEBAR
    ====================================================== -->

    <aside class="profile-sidebar">

        <div class="profile-logo">

            <div class="profile-logo-icon">
                ▣
            </div>

            <span>Transpo</span>

        </div>


        <nav class="profile-navigation">

            <a href="Dashboard.aspx"
               class="profile-nav-item">

                <span class="nav-icon">□</span>

                <span>Dashboard</span>

            </a>


            <a href="Bookings.aspx"
               class="profile-nav-item">

                <span class="nav-icon">→</span>

                <span>My Trips</span>

            </a>


            <a href="BookTransportation.aspx"
               class="profile-nav-item">

                <span class="nav-icon">♡</span>

                <span>Active Trip</span>

            </a>


            <a href="Payments.aspx"
               class="profile-nav-item">

                <span class="nav-icon">□</span>

                <span>My Earnings</span>

            </a>


            <a href="BookTransportation.aspx"
               class="profile-nav-item">

                <span class="nav-icon">▣</span>

                <span>My Vehicle</span>

            </a>


            <a href="Profile.aspx"
               class="profile-nav-item active">

                <span class="nav-icon">♙</span>

                <span>Profile</span>

            </a>


            <a href="#"
               class="profile-nav-item">

                <span class="nav-icon">⚙</span>

                <span>Settings</span>

            </a>

        </nav>
        <a href="Login.aspx" class="dash-logout">
    ↪ &nbsp; Logout
</a>
    </aside>



    <!-- =====================================================
         MAIN AREA
    ====================================================== -->

    <main class="profile-main">


        <!-- TOP BAR -->

        <header class="profile-topbar">

            <div>

                <h1>
                    My Profile
                </h1>

                <p>
                    Manage your personal credentials, fleet stats, and performance verification.
                </p>

            </div>


            <div class="profile-user">

                <div class="user-avatar">
                    👤
                </div>

                <div>

                    <div class="user-name">
                        Nandan Nasit
                    </div>

                    <div class="user-role">
                        Standard Customer
                    </div>

                </div>

            </div>

        </header>



        <!-- =====================================================
             CONTENT
        ====================================================== -->

        <section class="profile-content">


            <!-- TABS -->

            <div class="profile-tabs">

                <a href="EditProfile.aspx"
                   class="profile-tab active">

                    Personal Information

                </a>

                <a href="#"
                   class="profile-tab">

                    Change Password

                </a>

               

            </div>



            <!-- =================================================
                 PROFILE CARD
            ================================================== -->

            <div class="edit-profile-card">


                <!-- PHOTO -->

                <div class="photo-section">

                    <div class="profile-photo">

                        <asp:Image
                            ID="imgProfile"
                            runat="server"
                            ImageUrl="~/Images/profile.jpg"
                            AlternateText="Profile Photo" />

                    </div>


                    <asp:FileUpload
                        ID="fuProfilePhoto"
                        runat="server"
                        CssClass="photo-upload" />


                    <asp:Button
                        ID="btnChangePhoto"
                        runat="server"
                        Text="Change Photo"
                        CssClass="change-photo-button"
                        OnClick="btnChangePhoto_Click" />


                    <div class="photo-help">
                        Allowed JPG, GIF or PNG. Max size of 800KB
                    </div>

                </div>



                <!-- FORM -->

                <div class="profile-form">


                    <!-- ROW 1 -->

                    <div class="form-row">

                        <div class="form-group">

                            <label>
                                Full Name
                            </label>

                            <asp:TextBox
                                ID="txtFullName"
                                runat="server"
                                CssClass="profile-input"
                                Text="Nandan Nasit">
                            </asp:TextBox>

                        </div>


                        <div class="form-group">

                            <label>
                                Email
                            </label>

                            <asp:TextBox
                                ID="txtEmail"
                                runat="server"
                                CssClass="profile-input"
                                Text="jnandannasit@gmail.com">
                            </asp:TextBox>

                        </div>

                    </div>



                    <!-- ROW 2 -->

                    <div class="form-row">

                        <div class="form-group">

                            <label>
                                Phone
                            </label>

                            <asp:TextBox
                                ID="txtPhone"
                                runat="server"
                                CssClass="profile-input"
                                Text="98765-43210">
                            </asp:TextBox>

                        </div>


                        <div class="form-group">

                            <label>
                                Date of Birth
                            </label>

                            <asp:TextBox
                                ID="txtDateOfBirth"
                                runat="server"
                                CssClass="profile-input"
                                Text="12 Mar 1990">
                            </asp:TextBox>

                        </div>

                    </div>



                    <!-- ADDRESS -->

                    <div class="form-group full-width">

                        <label>
                            Address
                        </label>

                        <asp:TextBox
                            ID="txtAddress"
                            runat="server"
                            CssClass="profile-input"
                            Text="Gandhinagar, Gujarat 360002">
                        </asp:TextBox>

                    </div>



                    <!-- MESSAGE -->

                    <asp:Label
                        ID="lblMessage"
                        runat="server"
                        CssClass="profile-message">
                    </asp:Label>



                    <!-- BUTTONS -->

                    <div class="profile-actions">

                        <asp:Button
                            ID="btnSave"
                            runat="server"
                            Text="Save Changes"
                            CssClass="save-button"
                            OnClick="btnSave_Click" />


                        <asp:Button
                            ID="btnCancel"
                            runat="server"
                            Text="Cancel"
                            CssClass="cancel-button"
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