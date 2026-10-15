<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs"
    Inherits="WebApplication3.Profile" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    - My Profile
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    Profile
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
        <section class="profile-content">


            <!-- TABS -->

            <div class="profile-tabs">

                <a href="EditProfile.aspx"
                   class="profile-tab active">

                    Personal Information

                </a>

                <a href="ChangePassword.aspx"
                   class="profile-tab">

                    Change Password

                </a>

                

            </div>



            <!-- =================================================
                 PROFILE CARD
            ================================================== -->

            <div class="edit-profile-card">


                <!-- PHOTO -->

                <div class="photo-upload-section">
    <asp:Image ID="imgProfile" runat="server"
        CssClass="profile-photo"
        ImageUrl="~/Images/profile.jpg"
        AlternateText="Profile Photo" />

   
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
                                ID="txtDOB"
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

                     <div class="profile-edit-area">

                        <asp:Button
                            ID="btnEditProfile"
                            runat="server"
                            Text="Edit Profile"
                            CssClass="profile-edit-btn"
                            PostBackUrl="EditProfile.aspx" />

                    </div>

                </div>

            </div>

        </section>
</asp:Content>