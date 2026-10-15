<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="TripDetails.aspx.cs"
    Inherits="WebApplication3.TripDetails" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Trip Details - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Trip Details
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="td-content" style="padding: 0;">

        <!-- BOOKING HEADER -->
        <div class="td-booking-header">
            <div class="td-booking-info">
                <div class="td-booking-item">
                    <span class="td-small-label">BOOKING ID</span>
                    <strong class="td-booking-id">#TRP-1048</strong>
                </div>

                <div class="td-header-divider"></div>

                <div class="td-booking-item">
                    <span class="td-small-label">CUSTOMER</span>
                    <strong>raj patel</strong>
                </div>

                <div class="td-header-divider"></div>

                <div class="td-booking-item td-date-item">
                    <span class="td-small-label">TRIP DATE</span>
                    <strong>24 Oct 2026, 10:00 AM</strong>
                </div>
            </div>

            <span class="td-cancelled">Cancelled</span>
        </div>

        <!-- TWO COLUMN SECTION -->
        <div class="td-grid">

            <!-- LEFT CARD -->
            <div class="td-card td-crew-card">
                <h2>Asset &amp; Crew Allocation</h2>

                <!-- Vehicle -->
                <div class="td-vehicle-row">
                    <div class="td-vehicle-icon">🚚</div>
                    <div class="td-row-information">
                        <strong>Mahindra Bolero Pickup</strong>
                        <span>Reg No: GJ-01-XX-9876</span>
                    </div>
                </div>

                <div class="td-horizontal-line"></div>

                <!-- Driver -->
                <div class="td-driver-row">
                    <div class="td-driver-avatar">👨</div>
                    <div class="td-row-information">
                        <strong>abhay</strong>
                        <span>License: gj-381029482</span>
                    </div>
                </div>
            </div>

            <!-- RIGHT SIDE -->
            <div class="td-right-column">

                <!-- ROUTE -->
                <div class="td-card td-route-card">
                    <h2>Route Logistics</h2>

                    <div class="td-route-row">
                        <div class="td-route-dot pickup"></div>
                        <div>
                            <span class="td-route-label">PICKUP ADDRESS</span>
                            <strong>Sarkhej, Ahmedabad, Gujarat 380051</strong>
                        </div>
                    </div>

                    <div class="td-horizontal-line"></div>

                    <div class="td-route-row">
                        <div class="td-route-dot drop"></div>
                        <div>
                            <span class="td-route-label">DROP ADDRESS</span>
                            <strong>Adajan, Surat, Gujarat 395009</strong>
                        </div>
                    </div>
                </div>

                <!-- PAYMENT -->
                <div class="td-card td-payment-card">
                    <h2>Payment Summary</h2>

                    <div class="td-payment-row">
                        <span>Base Fare</span>
                        <strong>₹8000</strong>
                    </div>

                    <div class="td-payment-row">
                        <span>Tolls &amp; Taxes</span>
                        <strong>₹500</strong>
                    </div>

                    <div class="td-horizontal-line"></div>

                    <div class="td-total-row">
                        <strong>Total Amount</strong>
                        <strong>₹8,500</strong>
                    </div>
                </div>

            </div>

        </div>

        <!-- SHIPMENT MILESTONE -->
        <div class="td-milestone">
            <h2>Shipment Milestone Tracker</h2>

            <div class="td-milestone-content">
                <div class="td-location">
                    <span class="td-location-name">Ahmedabad (Origin)</span>
                    <strong>10:00 AM</strong>
                </div>

                <div class="td-arrow">⟶</div>

                <div class="td-location">
                    <span class="td-location-name">Surat (Waypoint)</span>
                    <strong>12:45 PM</strong>
                </div>
            </div>
        </div>

    </section>

</asp:Content>
