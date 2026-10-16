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
                        CausesValidation="false"
                        CssClass="btn-upload-logo" />

                    <asp:Button
                        ID="btnRemoveLogo"
                        runat="server"
                        Text="Remove"
                        CausesValidation="false"
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
                    <asp:RequiredFieldValidator
                        ID="rfvCompanyName"
                        runat="server"
                        ControlToValidate="txtCompanyName"
                        ErrorMessage="Company name is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label>State / Province</label>
                    <asp:TextBox
                        ID="txtState"
                        runat="server"
                        CssClass="settings-input"
                        Text="Gujarat">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvState"
                        runat="server"
                        ControlToValidate="txtState"
                        ErrorMessage="State / Province is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator
                        ID="rfvStreetAddress"
                        runat="server"
                        ControlToValidate="txtStreetAddress"
                        ErrorMessage="Street address is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label>pincode</label>
                    <asp:TextBox
                        ID="txtPincode"
                        runat="server"
                        CssClass="settings-input"
                        Text="380051">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvPincode"
                        runat="server"
                        ControlToValidate="txtPincode"
                        ErrorMessage="Pincode is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="revPincode"
                        runat="server"
                        ControlToValidate="txtPincode"
                        ValidationExpression="^\d{6}$"
                        ErrorMessage="Enter a valid 6-digit pincode."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RegularExpressionValidator>
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
                    <asp:RequiredFieldValidator
                        ID="rfvCity"
                        runat="server"
                        ControlToValidate="txtCity"
                        ErrorMessage="City is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator
                        ID="rfvBillingEmail"
                        runat="server"
                        ControlToValidate="txtBillingEmail"
                        ErrorMessage="Billing email is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="revBillingEmail"
                        runat="server"
                        ControlToValidate="txtBillingEmail"
                        ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
                        ErrorMessage="Enter a valid email address."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RegularExpressionValidator>
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
