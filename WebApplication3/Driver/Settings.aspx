<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Settings.aspx.cs"
    Inherits="WebApplication3.Driver.Settings" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Website Settings - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Settings
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="driver-settings-content" style="padding: 0;">

        <div class="driver-settings-grid">

            <!-- LEFT COLUMN -->
            <div class="driver-settings-left">

                <!-- ACCOUNT PREFERENCES -->
                <div class="driver-settings-card preferences-card">
                    <h2>Account Preferences</h2>

                    <div class="driver-settings-field">
                        <label>SYSTEM LANGUAGE</label>
                        <select class="driver-settings-input">
                            <option>English (United States)</option>
                            <option>English (India)</option>
                            <option>Hindi</option>
                            <option>Gujarati</option>
                        </select>
                    </div>

                    <div class="driver-settings-field">
                        <label>TIME ZONE</label>
                        <select class="driver-settings-input">
                            <option>GMT+5:30 (India Standard Time)</option>
                            <option>GMT+0:00 (UTC)</option>
                            <option>GMT-5:00 (Eastern Time)</option>
                        </select>
                    </div>
                </div>

                <!-- SECURITY -->
                <div class="driver-settings-card security-card">
                    <h2>Security &amp; Password</h2>

                    <div class="driver-settings-field">
                        <label>CURRENT PASSWORD</label>
                        <asp:TextBox
                            ID="txtCurrentPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="driver-settings-input"
                            placeholder="Enter current password">
                        </asp:TextBox>
                    </div>

                    <div class="driver-settings-field">
                        <label>NEW PASSWORD</label>
                        <asp:TextBox
                            ID="txtNewPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="driver-settings-input"
                            placeholder="Enter new strong password">
                        </asp:TextBox>
                    </div>

                    <div class="driver-settings-field">
                        <label>RE-ENTER NEW PASSWORD</label>
                        <asp:TextBox
                            ID="txtConfirmPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="driver-settings-input"
                            placeholder="Re-Enter new strong password">
                        </asp:TextBox>
                    </div>

                    <asp:Button
                        ID="btnUpdatePassword"
                        runat="server"
                        Text="Update Password"
                        CssClass="driver-settings-update-btn"
                        OnClick="btnUpdatePassword_Click" />
                </div>

            </div>

            <!-- RIGHT COLUMN -->
            <div class="driver-settings-right">
            </div>

        </div>

    </section>

</asp:Content>