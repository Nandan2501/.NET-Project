<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="EditProfile.aspx.cs"
    Inherits="WebApplication3.EditProfile" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    - Edit Profile
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href='<%= ResolveUrl("~/CSS/editprofile.css") %>' rel="stylesheet" />
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    Profile
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
    <section class="profile-content">

        <!-- TABS -->
        <div class="profile-tabs">
            <a href="Profile.aspx" class="profile-tab">
                View Profile
            </a>
            <a href="EditProfile.aspx" class="profile-tab active">
                Personal Information
            </a>
            
        </div>

        <!-- PROFILE CARD -->
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

                <div class="photo-help" style="font-size: 16px;">
                    Allowed JPG, PNG. Max size of 800KB
                </div>
            </div>

            <!-- FORM -->
            <div class="profile-form">

                <!-- ROW 1 -->
                <div class="form-row">
                    <div class="form-group">
                        <label>Full Name</label>
                        <asp:TextBox
                            ID="txtFullName"
                            runat="server"
                            CssClass="profile-input"
                            Text="Nandan Nasit">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfvFullName"
                            runat="server"
                            ControlToValidate="txtFullName"
                            ErrorMessage="Full name is required."
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="text-danger small d-block mt-1">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"
                            CssClass="profile-input"
                            Text="jnandannasit@gmail.com">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfvEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Email is required."
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="text-danger small d-block mt-1">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="revEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ErrorMessage="Please enter a valid email address."
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="text-danger small d-block mt-1">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>

                <!-- ROW 2 -->
                <div class="form-row">
                    <div class="form-group">
                        <label>Phone</label>
                        <asp:TextBox
                            ID="txtPhone"
                            runat="server"
                            CssClass="profile-input"
                            Text="98765-43210">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfvPhone"
                            runat="server"
                            ControlToValidate="txtPhone"
                            ErrorMessage="Phone number is required."
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="text-danger small d-block mt-1">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>Date of Birth</label>
                        <asp:TextBox
                            ID="txtDateOfBirth"
                            runat="server"
                            CssClass="profile-input"
                            Text="12 Mar 1990">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfvDateOfBirth"
                            runat="server"
                            ControlToValidate="txtDateOfBirth"
                            ErrorMessage="Date of birth is required."
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="text-danger small d-block mt-1">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <!-- ADDRESS -->
                <div class="form-group full-width">
                    <label>Address</label>
                    <asp:TextBox
                        ID="txtAddress"
                        runat="server"
                        CssClass="profile-input"
                        Text="Gandhinagar, Gujarat 360002">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvAddress"
                        runat="server"
                        ControlToValidate="txtAddress"
                        ErrorMessage="Address is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
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
                        CausesValidation="false"
                        OnClick="btnCancel_Click" />
                </div>

            </div>

        </div>

    </section>
</asp:Content>