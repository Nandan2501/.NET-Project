<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs"
    Inherits="WebApplication3.ChangePassword" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    - Change Password
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    Profile
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
    <section class="cp-content">

        <!-- TABS -->
        <div class="cp-tabs">
            <a href="Profile.aspx" class="cp-tab">
                Personal Information
            </a>
            <a href="ChangePassword.aspx" class="cp-tab active">
                Change Password
            </a>
        </div>

        <!-- PASSWORD CARD -->
        

            <!-- RIGHT FORM -->
            <div class="cp-form">

                <!-- CURRENT PASSWORD -->
                <div class="cp-field">
                    <label>Current Password</label>
                    <div class="cp-password-box">
                        <asp:TextBox
                            ID="txtCurrentPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="cp-input"
                            placeholder="••••••••">
                        </asp:TextBox>
                        <span class="cp-eye">◉</span>
                    </div>
                    <asp:RequiredFieldValidator
                        ID="rfvCurrentPassword"
                        runat="server"
                        ControlToValidate="txtCurrentPassword"
                        ErrorMessage="Current password is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- NEW PASSWORD -->
                <div class="cp-field">
                    <label>New Password</label>
                    <div class="cp-password-box">
                        <asp:TextBox
                            ID="txtNewPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="cp-input"
                            placeholder="Enter new password">
                        </asp:TextBox>
                        <span class="cp-eye">◉</span>
                    </div>
                    <asp:RequiredFieldValidator
                        ID="rfvNewPassword"
                        runat="server"
                        ControlToValidate="txtNewPassword"
                        ErrorMessage="New password is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                    <small>
                        Minimum 8 characters with at least one number and special character.
                    </small>
                </div>

                <!-- CONFIRM PASSWORD -->
                <div class="cp-field">
                    <label>Confirm New Password</label>
                    <div class="cp-password-box">
                        <asp:TextBox
                            ID="txtConfirmPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="cp-input"
                            placeholder="Confirm new password">
                        </asp:TextBox>
                        <span class="cp-eye">◉</span>
                    </div>
                    <asp:RequiredFieldValidator
                        ID="rfvConfirmPassword"
                        runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ErrorMessage="Please confirm your new password."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator
                        ID="cvConfirmPassword"
                        runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ControlToCompare="txtNewPassword"
                        ErrorMessage="New passwords do not match."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:CompareValidator>
                </div>

                <!-- BUTTON -->
                <div class="cp-button-area">
                    <asp:Button
                        ID="btnUpdatePassword"
                        runat="server"
                        Text="Update Password"
                        CssClass="cp-update-btn"
                        OnClick="btnUpdatePassword_Click" />
                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="cp-message">
                </asp:Label>

            </div>

        </div>

    </section>
</asp:Content>