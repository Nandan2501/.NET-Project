<%@ Page Title="Add Address" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AddAddress.aspx.cs"
    Inherits="WebApplication3.AddAddress" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    - Add Address
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    Address Book
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
        <section class="aa-content">

            <!-- BREADCRUMB -->

            <div class="aa-breadcrumb">

                <a href="AddressBook.aspx">
                    Address Book
                </a>

                <span>›</span>

                <strong>
                    Add New Address
                </strong>

            </div>


            <!-- PAGE HEADING -->

            <div class="aa-page-heading">

                <h2>Add New Address</h2>

                <p>
                    Fill in the details below to add a new shipping address
                </p>

            </div>


            <!-- ================= FORM CARD ================= -->

            <div class="aa-card">

                <!-- ADDRESS LABEL -->

                <div class="aa-field aa-full">

                    <label>Address Label</label>

                    <asp:TextBox
                        ID="txtAddressLabel"
                        runat="server"
                        CssClass="aa-input"
                        placeholder="e.g. Warehouse, Office, Home">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvAddressLabel"
                        runat="server"
                        ControlToValidate="txtAddressLabel"
                        ErrorMessage="Address label is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                </div>


                <!-- FULL ADDRESS -->

                <div class="aa-field aa-full">

                    <label>Full Address</label>

                    <asp:TextBox
                        ID="txtFullAddress"
                        runat="server"
                        CssClass="aa-textarea"
                        TextMode="MultiLine"
                        placeholder="Street address, building name, floor, etc.">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvFullAddress"
                        runat="server"
                        ControlToValidate="txtFullAddress"
                        ErrorMessage="Full address is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                </div>


                <!-- CITY -->

                <div class="aa-field">

                    <label>City</label>

                    <asp:TextBox
                        ID="txtCity"
                        runat="server"
                        CssClass="aa-input"
                        placeholder="Enter city">
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


                <!-- STATE -->

                <div class="aa-field">

                    <label>State</label>

                    <asp:TextBox
                        ID="txtState"
                        runat="server"
                        CssClass="aa-input"
                        placeholder="Enter state">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvState"
                        runat="server"
                        ControlToValidate="txtState"
                        ErrorMessage="State is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                </div>


                <!-- PIN -->

                <div class="aa-field">

                    <label>PIN Code</label>

                    <asp:TextBox
                        ID="txtPinCode"
                        runat="server"
                        CssClass="aa-input"
                        placeholder="6-digit postal code"
                        MaxLength="6">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvPinCode"
                        runat="server"
                        ControlToValidate="txtPinCode"
                        ErrorMessage="PIN Code is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="revPinCode"
                        runat="server"
                        ControlToValidate="txtPinCode"
                        ValidationExpression="^[0-9]{6}$"
                        ErrorMessage="PIN Code must be 6 digits."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RegularExpressionValidator>
                </div>


                <!-- COUNTRY -->

                <div class="aa-field">

                    <label>Country</label>

                    <asp:DropDownList
                        ID="ddlCountry"
                        runat="server"
                        CssClass="aa-input">

                        <asp:ListItem Text="India" Value="India" />

                        <asp:ListItem Text="United States" Value="United States" />

                        <asp:ListItem Text="United Kingdom" Value="United Kingdom" />

                    </asp:DropDownList>

                </div>


                <!-- PHONE -->

                <div class="aa-field aa-full">

                    <label>Contact Phone</label>

                    <asp:TextBox
                        ID="txtPhone"
                        runat="server"
                        CssClass="aa-input"
                        placeholder="+91 98765 43210">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvPhone"
                        runat="server"
                        ControlToValidate="txtPhone"
                        ErrorMessage="Contact phone is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small d-block mt-1">
                    </asp:RequiredFieldValidator>
                </div>


                <!-- ADDRESS TYPE -->

                <div class="aa-field aa-full">

                    <label>Address Type</label>

                    <div class="aa-radio-group">

                        <label class="aa-radio">
                            <asp:RadioButton
                                ID="rbWarehouse"
                                runat="server"
                                GroupName="AddressType"
                                Checked="true" />
                            <span>Warehouse</span>
                        </label>

                        <label class="aa-radio">
                            <asp:RadioButton
                                ID="rbOffice"
                                runat="server"
                                GroupName="AddressType" />
                            <span>Office</span>
                        </label>

                        <label class="aa-radio">
                            <asp:RadioButton
                                ID="rbResidential"
                                runat="server"
                                GroupName="AddressType" />
                            <span>Residential</span>
                        </label>

                        <label class="aa-radio">
                            <asp:RadioButton
                                ID="rbPort"
                                runat="server"
                                GroupName="AddressType" />
                            <span>Port/Terminal</span>
                        </label>

                    </div>

                </div>


                <!-- DEFAULT ADDRESS -->

                <div class="aa-default">

                    <asp:CheckBox
                        ID="chkDefault"
                        runat="server"
                        Checked="true" />

                    <label for="chkDefault">
                        Set as Default Delivery Address
                    </label>

                </div>


                <!-- BUTTONS -->

                <div class="aa-actions">

                    <asp:Button
                        ID="btnCancel"
                        runat="server"
                        Text="Cancel"
                        CssClass="aa-btn aa-cancel"
                        CausesValidation="false"
                        OnClick="btnCancel_Click" />

                    <asp:Button
                        ID="btnSave"
                        runat="server"
                        Text="Save Address"
                        CssClass="aa-btn aa-save"
                        OnClick="btnSave_Click" />

                </div>

            </div>

        </section>
</asp:Content>