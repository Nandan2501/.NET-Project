<%@ Page Title="Address Book" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AddressBook.aspx.cs"
    Inherits="WebApplication3.AddressBook" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    - Address Book
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    Address Book
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
        <section class="ab-content">

            <!-- HEADER CARD -->
            <div class="ab-header-card">
                <div class="ab-header-text">
                    <h2>Manage Shipping Addresses</h2>
                    <p>Save your warehouses, offices, and ports for streamlined bookings.</p>
                </div>

                <asp:Button
                    ID="btnAddAddress"
                    runat="server"
                    Text="+  Add New Address"
                    CssClass="ab-add-btn"
                    OnClick="btnAddAddress_Click" />
            </div>

            <!-- DYNAMIC ADDRESS CARDS -->
            <asp:Repeater ID="rptAddresses" runat="server">
                <ItemTemplate>
                    <div class='ab-address-card <%# Convert.ToBoolean(Eval("IsDefault")) ? "default-address" : "" %>'>
                        <div class="ab-address-left">
                            <div class="ab-address-icon location-icon">♧</div>
                            <div class="ab-address-info">
                                <div class="ab-address-title">
                                    <strong><%# Eval("AddressTitle") %></strong>
                                    <%# Convert.ToBoolean(Eval("IsDefault")) ? "<span class=\"ab-default-badge\">Default Delivery</span>" : "" %>
                                </div>
                                <p><%# Eval("FullAddress") %>, <%# Eval("City") %>, <%# Eval("State") %> <%# Eval("PostalCode") %></p>
                                <span class="ab-phone">☎ &nbsp;<%# Eval("Phone") %></span>
                            </div>
                        </div>
                        <div class="ab-actions">
                            <asp:Button
                                ID="btnEdit"
                                runat="server"
                                Text="✎"
                                CommandArgument='<%# Eval("AddressId") %>'
                                CssClass="ab-icon-btn edit-btn"
                                OnClick="btnEdit_Click" />
                            <asp:Button
                                ID="btnDelete"
                                runat="server"
                                Text="✕"
                                CommandArgument='<%# Eval("AddressId") %>'
                                CssClass="ab-icon-btn delete-btn"
                                OnClick="btnDelete_Click" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </section>
</asp:Content>
