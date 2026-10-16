<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AddVehicle.aspx.cs"
    Inherits="WebApplication3.AddVehicle" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Add Vehicle - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Add Vehicle
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="av-content" style="padding: 0;">

        <div class="av-form-card">

            <div class="av-form-grid">

                <!-- VEHICLE NAME -->
                <div class="av-form-group">
                    <label for="ddlVehicleName">Vehicle Name</label>
                    <asp:DropDownList
                        ID="ddlVehicleName"
                        runat="server"
                        CssClass="av-input">
                        <asp:ListItem Value="">Select vehicle</asp:ListItem>
                        <asp:ListItem>Mahindra Bolero</asp:ListItem>
                        <asp:ListItem>Tata Ace</asp:ListItem>
                        <asp:ListItem>Ashok Leyland</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator
                        ID="rfvVehicleName"
                        runat="server"
                        ControlToValidate="ddlVehicleName"
                        InitialValue=""
                        ErrorMessage="Please select a vehicle."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- DRIVER -->
                <div class="av-form-group">
                    <label for="ddlDriver">Driver</label>
                    <asp:DropDownList
                        ID="ddlDriver"
                        runat="server"
                        CssClass="av-input">
                        <asp:ListItem Value="">Assign driver</asp:ListItem>
                        <asp:ListItem>Abhay</asp:ListItem>
                        <asp:ListItem>Raj Patel</asp:ListItem>
                        <asp:ListItem>Nandan</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator
                        ID="rfvDriver"
                        runat="server"
                        ControlToValidate="ddlDriver"
                        InitialValue=""
                        ErrorMessage="Please assign a driver."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- VEHICLE TYPE -->
                <div class="av-form-group">
                    <label for="txtVehicleType">Vehicle type</label>
                    <asp:TextBox
                        ID="txtVehicleType"
                        runat="server"
                        CssClass="av-input"
                        placeholder="Enter vehicle type">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvVehicleType"
                        runat="server"
                        ControlToValidate="txtVehicleType"
                        ErrorMessage="Vehicle type is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- LICENSE PLATE -->
                <div class="av-form-group">
                    <label for="txtLicensePlate">LICENSE PLATE</label>
                    <asp:TextBox
                        ID="txtLicensePlate"
                        runat="server"
                        CssClass="av-input"
                        Text="GJ-01-XX-1102">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvLicensePlate"
                        runat="server"
                        ControlToValidate="txtLicensePlate"
                        ErrorMessage="License plate is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- STATUS -->
                <div class="av-form-group">
                    <label for="txtStatus">Status</label>
                    <asp:TextBox
                        ID="txtStatus"
                        runat="server"
                        CssClass="av-input"
                        Text="Active">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvStatus"
                        runat="server"
                        ControlToValidate="txtStatus"
                        ErrorMessage="Status is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- AGE -->
                <div class="av-form-group">
                    <label for="txtAge">Age</label>
                    <asp:TextBox
                        ID="txtAge"
                        runat="server"
                        CssClass="av-input"
                        placeholder="Age Enter"
                        TextMode="Number">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvAge"
                        runat="server"
                        ControlToValidate="txtAge"
                        ErrorMessage="Age is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- AADHAR CARD -->
                <div class="av-form-group">
                    <label for="txtAadhar">AAdhar card</label>
                    <asp:DropDownList
                        ID="txtAadhar"
                        runat="server"
                        CssClass="av-input">
                        <asp:ListItem Value="">Aadhar card Enter</asp:ListItem>
                        <asp:ListItem>Verified</asp:ListItem>
                        <asp:ListItem>Not Verified</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <!-- EMPTY GRID SPACE -->
                <div></div>

            </div>

            <!-- NOTES -->
            <div class="av-notes-group">
                <label for="txtNotes">Notes</label>
                <asp:TextBox
                    ID="txtNotes"
                    runat="server"
                    CssClass="av-textarea"
                    TextMode="MultiLine"
                    placeholder="Add optional booking notes or dispatch instructions...">
                </asp:TextBox>
            </div>

            <!-- BUTTONS -->
            <div class="av-actions">
                <asp:Button
                    ID="btnCancel"
                    runat="server"
                    Text="Cancel"
                    CssClass="av-btn av-btn-cancel"
                    CausesValidation="false"
                    OnClick="btnCancel_Click" />

                <asp:Button
                    ID="btnAddVehicle"
                    runat="server"
                    Text="Add Vehicle"
                    CssClass="av-btn av-btn-primary"
                    OnClick="btnAddVehicle_Click" />
            </div>

        </div>

    </section>

</asp:Content>
