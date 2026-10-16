<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AddDriver.aspx.cs"
    Inherits="WebApplication3.AddDriver" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Add New Driver - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Add New Driver
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="ad-content" style="padding: 0;">

        <div class="ad-page-heading">
            <h2>Add New Driver</h2>
            <p>Fill in the details below to register a new driver to your fleet.</p>
        </div>

        <!-- FORM CARD -->
        <div class="ad-form-card">

            <div class="ad-card-title">
                Driver Information
            </div>

            <div class="ad-form-body">

                <!-- DRIVER NAME -->
                <div class="ad-form-group">
                    <label for="txtDriverName">DRIVER NAME</label>
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
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- PHONE -->
                <div class="ad-form-group">
                    <label for="txtPhone">PHONE NUMBER</label>
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
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- LICENSE -->
                <div class="ad-form-group">
                    <label for="txtLicense">LICENSE NUMBER</label>
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
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- DATE OF BIRTH -->
                <div class="ad-form-group">
                    <label for="txtDOB">DATE OF BIRTH</label>
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
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- ADDRESS -->
                <div class="ad-form-group ad-full-width">
                    <label for="txtAddress">FULL ADDRESS</label>
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
                        ErrorMessage="Full address is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- LICENSE PHOTO -->
                <div class="ad-form-group ad-full-width">
                    <label>DRIVER'S LICENSE PHOTO</label>
                    <div class="ad-upload-box">
                        <div class="ad-upload-icon">☁</div>
                        <div class="ad-upload-title">Click to upload or drag and drop</div>
                        <div class="ad-upload-info">SVG, PNG, JPG or PDF (max. 5MB)</div>
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

</asp:Content>