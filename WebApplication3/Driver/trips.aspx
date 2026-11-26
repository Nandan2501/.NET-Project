<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="trips.aspx.cs"
    Inherits="WebApplication3.Driver.trips" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Trips &amp; Load Board - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Trips &amp; Available Loads
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="driver-trips-content" style="padding: 0;">

        <asp:Label ID="lblTripsMessage" runat="server" ForeColor="Green" CssClass="d-block mb-3 fw-semibold" />

        <!-- AVAILABLE OPEN TRIPS BOARD -->
        <div class="driver-trips-table-card mb-4">
            <div class="d-flex justify-content-between align-items-center p-3 border-bottom">
                <h2 class="mb-0" style="font-size:16px; font-weight:700;">Available Trips (Paid by Customer — Ready to Confirm)</h2>
                <span class="badge bg-primary"><asp:Literal ID="litOpenCount" runat="server" Text="0" /> Open</span>
            </div>
            <div class="driver-trips-table-wrapper">
                <table class="driver-trips-table">
                    <thead>
                        <tr>
                            <th>Trip ID</th>
                            <th>Pickup City → Drop City</th>
                            <th>Load Details</th>
                            <th>Pickup Date</th>
                            <th>Driver Payout (50% + 50%)</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptAvailableTrips" runat="server" OnItemCommand="rptTrips_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td class="trip-id"><%# Eval("BookingNumber") %></td>
                                    <td class="trip-route">
                                        <strong><%# Server.HtmlEncode(Eval("CitiesRoute").ToString()) %></strong>
                                        <div class="small text-muted fw-normal">From: <%# Server.HtmlEncode(Eval("PickupAddress").ToString()) %></div>
                                        <div class="small text-muted fw-normal">To: <%# Server.HtmlEncode(Eval("DropAddress").ToString()) %></div>
                                    </td>
                                    <td>
                                        <div><strong><%# Server.HtmlEncode(Eval("LoadType").ToString()) %></strong> (<%# Eval("WeightKg") %> kg, <%# Eval("PackageCount") %> pkgs)</div>
                                        <div class="small text-muted">Size: <%# Eval("Dimensions") %> • Vehicle: <%# Server.HtmlEncode(Eval("VehicleType").ToString()) %></div>
                                        <div class="small text-muted">Handling: <%# Server.HtmlEncode(Eval("SpecialHandling").ToString()) %></div>
                                    </td>
                                    <td><%# Eval("DepartureTime") %></td>
                                    <td class="trip-earnings">
                                        <%# Eval("TotalPayout") %>
                                        <div class="small text-muted fw-normal"><%# Eval("HalfPayout") %> arrival + <%# Eval("HalfPayout") %> delivery</div>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnConfirmTrip" runat="server"
                                            CommandName="AcceptTrip"
                                            CommandArgument='<%# Eval("BookingId") %>'
                                            Text="Confirm Trip"
                                            OnClientClick="return confirm('Confirm and accept this trip?');"
                                            CssClass="btn btn-primary btn-sm" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <asp:Literal ID="litNoOpen" runat="server" Visible="false" Text="<div class='p-3 text-muted small'>No open trips available right now.</div>" />
            </div>
        </div>

        <!-- FILTER -->
        <div class="driver-trips-filter d-flex flex-wrap gap-2 mb-3">
            <asp:Button ID="btnFilterAll" runat="server" Text="All My Trips" CssClass="driver-trips-filter-active" CommandArgument="ALL" OnClick="FilterTrips_Click" />
            <asp:Button ID="btnFilterConfirmed" runat="server" Text="Confirmed (Go to Pickup)" CssClass="btn btn-outline-secondary btn-sm" CommandArgument="Confirmed" OnClick="FilterTrips_Click" />
            <asp:Button ID="btnFilterOngoing" runat="server" Text="Ongoing (In Transit)" CssClass="btn btn-outline-secondary btn-sm" CommandArgument="Ongoing" OnClick="FilterTrips_Click" />
            <asp:Button ID="btnFilterCompleted" runat="server" Text="Completed" CssClass="btn btn-outline-secondary btn-sm" CommandArgument="Completed" OnClick="FilterTrips_Click" />
            <asp:Button ID="btnFilterCancelled" runat="server" Text="Cancelled" CssClass="btn btn-outline-secondary btn-sm" CommandArgument="Cancelled" OnClick="FilterTrips_Click" />
        </div>

        <!-- MY TRIPS TABLE -->
        <div class="driver-trips-table-card">
            <div class="p-3 border-bottom">
                <h2 class="mb-0" style="font-size:16px; font-weight:700;">My Confirmed &amp; Past Trips</h2>
            </div>
            <div class="driver-trips-table-wrapper">
                <table class="driver-trips-table">
                    <thead>
                        <tr>
                            <th>Trip ID</th>
                            <th>Cities (From → To)</th>
                            <th>Load Details</th>
                            <th>Status</th>
                            <th>Credited / Payout</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptTrips" runat="server" OnItemCommand="rptTrips_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td class="trip-id"><%# Eval("BookingNumber") %></td>
                                    <td class="trip-route">
                                        <strong><%# Server.HtmlEncode(Eval("Route").ToString()) %></strong>
                                        <div class="small text-muted fw-normal"><%# Eval("DepartureTime") %></div>
                                    </td>
                                    <td><%# Server.HtmlEncode(Eval("LoadSummary").ToString()) %></td>
                                    <td>
                                        <span class='<%# GetTripStatusClass(Eval("BookingStatus").ToString()) %>'>
                                            <%# Eval("BookingStatus") %>
                                        </span>
                                        <div class="small text-muted mt-1"><%# Eval("MilestoneNote") %></div>
                                    </td>
                                    <td class="trip-earnings">
                                        <%# Eval("CreditedLabel") %>
                                        <div class="small text-muted fw-normal">of <%# Eval("TotalShareLabel") %></div>
                                    </td>
                                    <td>
                                        <a href='ActiveTrip.aspx?id=<%# Eval("BookingNumber") %>' class="btn btn-outline-primary btn-sm mb-1">Track</a>
                                        <asp:LinkButton ID="btnArrived" runat="server"
                                            CommandName="MarkArrived"
                                            CommandArgument='<%# Eval("BookingId") %>'
                                            Text="Arrived at Pickup"
                                            Visible='<%# Eval("CanMarkArrived") %>'
                                            CssClass="btn btn-warning btn-sm ms-1 mb-1" />
                                        <asp:LinkButton ID="btnDelivered" runat="server"
                                            CommandName="MarkDelivered"
                                            CommandArgument='<%# Eval("BookingId") %>'
                                            Text="Mark Delivered"
                                            Visible='<%# Eval("CanMarkDelivered") %>'
                                            CssClass="btn btn-success btn-sm ms-1 mb-1" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

</asp:Content>
