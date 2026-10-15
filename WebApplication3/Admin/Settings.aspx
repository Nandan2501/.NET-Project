<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Settings.aspx.cs"
    Inherits="WebApplication3.AdminSettings" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Settings - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Settings
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/CSS/admin-settings.css") %>" />
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="settings-content" style="padding: 0;">

        <div class="settings-card">

            <!-- HEADER -->
            <div class="settings-header">
                <h2>Company Profile</h2>
                <p>Manage your organization details, registration info, and billing address.</p>
            </div>

            <div class="settings-divider"></div>

            <!-- LOGO SECTION -->
            <div class="company-logo-section">
                <div class="company-logo">🚚</div>

                <div class="logo-actions">
                    <asp:Button
                        ID="btnUploadLogo"
                        runat="server"
                        Text="Upload New Logo"
                        CssClass="btn-upload-logo" />

                    <asp:Button
                        ID="btnRemoveLogo"
                        runat="server"
                        Text="Remove"
                        CssClass="btn-remove-logo" />
                </div>
            </div>

            <!-- FORM -->
            <div class="company-form">

                <!-- ROW 1 -->
                <div class="form-group">
                    <label>Company Name</label>
                    <asp:TextBox
                        ID="txtCompanyName"
                        runat="server"
                        CssClass="settings-input"
                        Text="tata">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label>State / Province</label>
                    <asp:TextBox
                        ID="txtState"
                        runat="server"
                        CssClass="settings-input"
                        Text="Gujarat">
                    </asp:TextBox>
                </div>

                <!-- ROW 2 -->
                <div class="form-group">
                    <label>Street Address</label>
                    <asp:TextBox
                        ID="txtStreetAddress"
                        runat="server"
                        CssClass="settings-input"
                        Text="401-404, Dev Prime, Corporate Road">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label>pincode</label>
                    <asp:TextBox
                        ID="txtPincode"
                        runat="server"
                        CssClass="settings-input"
                        Text="380051">
                    </asp:TextBox>
                </div>

                <!-- ROW 3 -->
                <div class="form-group">
                    <label>City</label>
                    <asp:TextBox
                        ID="txtCity"
                        runat="server"
                        CssClass="settings-input"
                        Text="Ahmedabad">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Country</label>
                    <asp:DropDownList
                        ID="ddlCountry"
                        runat="server"
                        CssClass="settings-input">
                        <asp:ListItem Text="India" Value="India" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="United States" Value="United States"></asp:ListItem>
                        <asp:ListItem Text="United Kingdom" Value="United Kingdom"></asp:ListItem>
                        <asp:ListItem Text="Canada" Value="Canada"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <!-- ROW 4 -->
                <div class="form-group empty-form-group">
                </div>

                <div class="form-group">
                    <label>Billing Contact Email</label>
                    <asp:TextBox
                        ID="txtBillingEmail"
                        runat="server"
                        CssClass="settings-input"
                        Text="accounts@transpo.com">
                    </asp:TextBox>
                </div>

            </div>

            <!-- BOTTOM -->
            <div class="settings-bottom">
                <asp:Button
                    ID="btnUpdateProfile"
                    runat="server"
                    Text="Update Profile"
                    CssClass="btn-update-profile"
                    OnClick="btnUpdateProfile_Click" />
            </div>

            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="settings-message">
            </asp:Label>

        </div>

    </section>

</asp:Content>
