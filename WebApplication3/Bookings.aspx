<%@ Page Title="My Bookings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Bookings.aspx.cs"
    Inherits="WebApplication3.MyBookings" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    - My Bookings
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    My Bookings
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
        <section class="mb-content">

            <div class="mb-table-card">

                <asp:GridView
                    ID="gvBookings"
                    runat="server"
                    AutoGenerateColumns="false"
                    CssClass="mb-table"
                    GridLines="None"
                    OnRowCommand="gvBookings_RowCommand">

                    <Columns>

                        <asp:BoundField
                            DataField="BookingID"
                            HeaderText="Booking ID" />

                        <asp:BoundField
                            DataField="Route"
                            HeaderText="Route" />

                        <asp:BoundField
                            DataField="Date"
                            HeaderText="Date" />

                        <asp:TemplateField HeaderText="Status">

                            <ItemTemplate>

                                <span class='<%# GetStatusClass(Eval("Status").ToString()) %>'>
                                    <%# Eval("Status") %>
                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:BoundField
                            DataField="Amount"
                            HeaderText="Amount" />

                        <asp:TemplateField HeaderText="Action">

                            <ItemTemplate>

                                <asp:LinkButton
                                    ID="btnView"
                                    runat="server"
                                    Text="View Details"
                                    CommandName="ViewBooking"
                                    CommandArgument='<%# Eval("BookingID") %>'
                                    CssClass="mb-view-btn">
                                </asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

        </section>
</asp:Content>