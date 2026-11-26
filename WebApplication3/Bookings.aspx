<%@ Page Title="Transpo - My Bookings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Bookings.aspx.cs"
    Inherits="WebApplication3.MyBookings" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Transpo - My Bookings
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    My Bookings
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
        <section class="mb-content">

            <div class="d-flex justify-content-between align-items-center mb-3">
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold text-secondary mb-0">Filter by Status:</label>
                    <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="form-select form-select-sm" style="width:160px;" AutoPostBack="true" OnSelectedIndexChanged="ddlStatusFilter_SelectedIndexChanged">
                        <asp:ListItem Text="All Bookings" Value="ALL" Selected="True" />
                        <asp:ListItem Text="Confirmed" Value="Confirmed" />
                        <asp:ListItem Text="Ongoing" Value="Ongoing" />
                        <asp:ListItem Text="Pending" Value="Pending" />
                        <asp:ListItem Text="Completed" Value="Completed" />
                        <asp:ListItem Text="Cancelled" Value="Cancelled" />
                    </asp:DropDownList>
                </div>
                <a href="BookTransportation.aspx" class="btn btn-primary btn-sm">+ New Booking</a>
            </div>

            <asp:Label ID="lblBookingMessage" runat="server" CssClass="d-block mb-2 fw-semibold" />

            <div class="mb-table-card" style="overflow-x: auto;">

                <asp:GridView
                    ID="gvBookings"
                    runat="server"
                    AutoGenerateColumns="false"
                    CssClass="mb-table w-100"
                    GridLines="None"
                    EmptyDataText="No bookings found."
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
                                <div class="small text-muted mt-1"><%# Eval("ProgressHint") %></div>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:BoundField
                            DataField="Amount"
                            HeaderText="Amount" />

                        <asp:TemplateField HeaderText="Action">

                            <ItemTemplate>

                                <asp:LinkButton
                                    ID="btnConfirmArrived"
                                    runat="server"
                                    Text="Confirm Driver Arrived"
                                    CommandName="ConfirmArrived"
                                    CommandArgument='<%# Eval("RawBookingId") %>'
                                    Visible='<%# Eval("Status").ToString().Equals("Confirmed", StringComparison.OrdinalIgnoreCase) %>'
                                    OnClientClick="return confirm('Confirm driver has arrived at pickup? This releases 50% (first half) to the driver.');"
                                    CssClass="btn btn-success btn-sm me-1 mb-1">
                                </asp:LinkButton>

                                <asp:LinkButton
                                    ID="btnConfirmCompleted"
                                    runat="server"
                                    Text="Confirm Trip Completed"
                                    CommandName="ConfirmCompleted"
                                    CommandArgument='<%# Eval("RawBookingId") %>'
                                    Visible='<%# Eval("Status").ToString().Equals("Ongoing", StringComparison.OrdinalIgnoreCase) %>'
                                    OnClientClick="return confirm('Confirm trip is completed? This releases the remaining 50% (second half) to the driver.');"
                                    CssClass="btn btn-success btn-sm me-1 mb-1">
                                </asp:LinkButton>

                                <asp:LinkButton
                                    ID="btnView"
                                    runat="server"
                                    Text="View Details"
                                    CommandName="ViewBooking"
                                    CommandArgument='<%# Eval("BookingID") %>'
                                    CssClass="mb-view-btn mb-1">
                                </asp:LinkButton>

                                <asp:LinkButton
                                    ID="btnCancel"
                                    runat="server"
                                    Text="Cancel"
                                    CommandName="CancelBooking"
                                    CommandArgument='<%# Eval("BookingID") %>'
                                    Visible='<%# CanCancel(Eval("Status").ToString()) %>'
                                    OnClientClick="return confirm('Cancel this booking?');"
                                    CssClass="btn btn-outline-danger btn-sm ms-1 mb-1">
                                </asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

        </section>
</asp:Content>