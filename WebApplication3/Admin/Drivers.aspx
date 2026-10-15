<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Drivers.aspx.cs"
    Inherits="WebApplication3.AdminDrivers" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Active Drivers - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Active Drivers
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="admin-content drivers-page-content" style="padding: 0;">

        <!-- HEADING -->
        <div class="drivers-heading-row">
            

            <asp:Button
                ID="btnAddDriver"
                runat="server"
                Text="+ Add Driver"
                CssClass="add-driver-button"
                OnClick="btnAddDriver_Click" />
        </div>

        <!-- DRIVER TABLE CARD -->
        <div class="drivers-card">
            <div class="drivers-card-title">
                <span>All Registered Drivers (35)</span>
            </div>

            <div class="drivers-table-wrapper">
                <asp:GridView
                    ID="gvDrivers"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="drivers-table"
                    GridLines="None"
                    OnRowCommand="gvDrivers_RowCommand">
                    <Columns>
                        <asp:BoundField
                            DataField="DriverId"
                            HeaderText="DRIVER ID" />

                        <asp:BoundField
                            DataField="DriverName"
                            HeaderText="DRIVER NAME" />

                        <asp:BoundField
                            DataField="Phone"
                            HeaderText="PHONE" />

                        <asp:BoundField
                            DataField="LicenseNo"
                            HeaderText="LICENSE NO." />

                        <asp:TemplateField
                            HeaderText="STATUS">
                            <ItemTemplate>
                                <span class='<%# GetDriverStatusClass(Eval("Status").ToString()) %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField
                            DataField="Vehicle"
                            HeaderText="ASSIGNED VEHICLE" />

                       
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="driver-message">
        </asp:Label>

    </section>

</asp:Content>
