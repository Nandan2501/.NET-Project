<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Vehicle.aspx.cs"
    Inherits="WebApplication3.AdminVehicles" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Fleet Vehicles - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Fleet Vehicles
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="admin-content vehicles-page-content" style="padding: 0;">

        <!-- PAGE HEADING -->
        <div class="vehicles-heading-row">
            

            <asp:Button
                ID="btnAddVehicle"
                runat="server"
                Text="+ Add Vehicle"
                CssClass="add-vehicle-button"
                OnClick="btnAddVehicle_Click" />
        </div>

        <!-- VEHICLES CARD -->
        <div class="vehicles-card">
            <div class="vehicles-card-title">
                <span>All Vehicles (32)</span>
            </div>

            <div class="vehicles-table-wrapper">
                <asp:GridView
                    ID="gvVehicles"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="vehicles-table"
                    GridLines="None"
                    OnRowCommand="gvVehicles_RowCommand">
                    <Columns>
                        <asp:BoundField
                            DataField="VehicleId"
                            HeaderText="VEHICLE ID" />

                        <asp:BoundField
                            DataField="VehicleName"
                            HeaderText="VEHICLE NAME" />

                        <asp:BoundField
                            DataField="Type"
                            HeaderText="TYPE" />

                        <asp:BoundField
                            DataField="LicensePlate"
                            HeaderText="LICENSE PLATE" />

                        <asp:TemplateField
                            HeaderText="STATUS">
                            <ItemTemplate>
                                <span class='<%# GetVehicleStatusClass(Eval("Status").ToString()) %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField
                            DataField="Driver"
                            HeaderText="DRIVER ASSIGNED" />

                       
                         
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="vehicle-message">
        </asp:Label>

    </section>

</asp:Content>
