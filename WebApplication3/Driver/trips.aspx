<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="trips.aspx.cs"
    Inherits="WebApplication3.Driver.trips" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    My Trips - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    My Trips
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="driver-trips-content" style="padding: 0;">

        <!-- FILTER -->
        <div class="driver-trips-filter">
            <button type="button" class="driver-trips-filter-active">
                All Trips
            </button>
        </div>

        <!-- TRIPS TABLE -->
        <div class="driver-trips-table-card">
            <div class="driver-trips-table-wrapper">
                <table class="driver-trips-table">
                    <thead>
                        <tr>
                            <th>Trip ID</th>
                            <th>Route</th>
                            <th>Departure Time</th>
                            <th>Status</th>
                            <th>Distance</th>
                            <th>Earnings</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="trip-id">TRP123456789</td>
                            <td class="trip-route">Ahmedabad → Surat</td>
                            <td>21 May 2024, 10:00 AM</td>
                            <td>
                                <span class="trip-status in-transit">In Transit</span>
                            </td>
                            <td>263 km</td>
                            <td class="trip-earnings">₹2000</td>
                        </tr>
                        <tr>
                            <td class="trip-id">TRP987654321</td>
                            <td class="trip-route">Vadodara → Mumbai</td>
                            <td>18 May 2024, 08:30 AM</td>
                            <td>
                                <span class="trip-status delivered">Delivered</span>
                            </td>
                            <td>410 km</td>
                            <td class="trip-earnings">₹3500</td>
                        </tr>
                        <tr>
                            <td class="trip-id">TRP456789123</td>
                            <td class="trip-route">Mumbai → Ahmedabad</td>
                            <td>15 May 2024, 02:15 PM</td>
                            <td>
                                <span class="trip-status cancelled">Cancelled</span>
                            </td>
                            <td>656 km</td>
                            <td class="trip-earnings">₹4500</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

</asp:Content>