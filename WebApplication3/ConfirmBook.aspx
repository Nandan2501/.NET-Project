<%@ Page Title="Booking Confirmed - Transpo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ConfirmBook.aspx.cs"
    Inherits="WebApplication3.BookingSuccess" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    - Booking Confirmed
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    Book Transportation
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .cb-page-container {
            width: 100%;
            min-height: calc(100vh - 65px);
            background-color: #ffffff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            padding: 40px 20px 60px 20px;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            box-sizing: border-box;
        }

        .cb-wrapper {
            width: 100%;
            max-width: 640px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Success Icon */
        .cb-success-circle {
            width: 58px;
            height: 58px;
            background-color: #d1fae5;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .cb-success-check {
            width: 22px;
            height: 12px;
            border-left: 3.5px solid #10b981;
            border-bottom: 3.5px solid #10b981;
            transform: rotate(-45deg);
            margin-top: -3px;
        }

        /* Titles */
        .cb-main-title {
            font-size: 26px;
            font-weight: 800;
            color: #0f172a;
            margin: 0 0 8px 0;
            text-align: center;
            letter-spacing: -0.3px;
        }

        .cb-sub-title {
            font-size: 14px;
            color: #64748b;
            margin: 0 0 28px 0;
            text-align: center;
        }

        /* Top 3-Column Info Card */
        .cb-info-card {
            width: 100%;
            background-color: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 18px 24px;
            margin-bottom: 22px;
            box-sizing: border-box;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02);
        }

        .cb-info-col {
            flex: 1;
            text-align: center;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .cb-info-col:not(:last-child) {
            border-right: 1px solid #e2e8f0;
        }

        .cb-info-label {
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            color: #64748b;
            letter-spacing: 0.6px;
        }

        .cb-info-value {
            font-size: 14px;
            font-weight: 700;
            color: #0f172a;
        }

        .cb-status-pill {
            display: inline-block;
            background-color: #dcfce7;
            color: #15803d;
            font-size: 11px;
            font-weight: 700;
            padding: 3px 12px;
            border-radius: 9999px;
            margin: 0 auto;
            width: fit-content;
        }

        /* Summary Details Card */
        .cb-summary-card {
            width: 100%;
            background-color: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 22px 24px 20px 24px;
            margin-bottom: 24px;
            box-sizing: border-box;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02);
        }

        .cb-summary-header {
            font-size: 15px;
            font-weight: 700;
            color: #0f172a;
            margin: 0 0 16px 0;
        }

        .cb-summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 13px 0;
            border-top: 1px solid #f1f5f9;
        }

        .cb-item-left {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #475569;
            font-size: 13.5px;
            font-weight: 500;
        }

        .cb-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 18px;
            height: 18px;
            color: #2563eb;
            font-size: 14px;
        }

        .cb-item-right {
            font-size: 13.5px;
            font-weight: 600;
            color: #0f172a;
            text-align: right;
        }

        .cb-cost-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 16px;
            margin-top: 4px;
            border-top: 1px solid #f1f5f9;
        }

        .cb-cost-label {
            font-size: 13.5px;
            font-weight: 600;
            color: #2563eb;
        }

        .cb-cost-value {
            font-size: 20px;
            font-weight: 800;
            color: #2563eb;
        }

        /* Action Buttons */
        .cb-btn-group {
            width: 100%;
            display: flex;
            gap: 14px;
        }

        .cb-btn-secondary {
            flex: 1;
            height: 44px;
            background-color: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 600;
            color: #334155;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .cb-btn-secondary:hover {
            background-color: #f8fafc;
            border-color: #cbd5e1;
        }

        .cb-btn-primary {
            flex: 1;
            height: 44px;
            background-color: #2563eb;
            border: none;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 600;
            color: #ffffff;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .cb-btn-primary:hover {
            background-color: #1d4ed8;
        }
    </style>

    <div class="cb-page-container">
        <div class="cb-wrapper">

            <!-- Success Checkmark -->
            <div class="cb-success-circle">
                <div class="cb-success-check"></div>
            </div>

            <!-- Title & Subtitle -->
            <h1 class="cb-main-title">Booking Confirmed!</h1>
            <p class="cb-sub-title">Your transportation has been successfully booked.</p>

            <!-- 3-Column Info Card -->
            <div class="cb-info-card">
                <div class="cb-info-col">
                    <span class="cb-info-label">Booking ID</span>
                    <asp:Label ID="lblBookingId" runat="server" CssClass="cb-info-value" Text="BK-2026-08174"></asp:Label>
                </div>
                <div class="cb-info-col">
                    <span class="cb-info-label">Status</span>
                    <div>
                        <span class="cb-status-pill">Confirmed</span>
                    </div>
                </div>
                <div class="cb-info-col">
                    <span class="cb-info-label">Estimated Pickup</span>
                    <asp:Label ID="lblPickupDate" runat="server" CssClass="cb-info-value" Text="Monday, 17 Aug 2026"></asp:Label>
                </div>
            </div>

            <!-- Booking Summary Details Card -->
            <div class="cb-summary-card">
                <div class="cb-summary-header">Booking Summary Details</div>

                <!-- Route -->
                <div class="cb-summary-row">
                    <div class="cb-item-left">
                        <span class="cb-icon">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                <circle cx="12" cy="10" r="3"></circle>
                            </svg>
                        </span>
                        <span>Route Path</span>
                    </div>
                    <asp:Label ID="lblRoute" runat="server" CssClass="cb-item-right" Text="Rajkot, Gujarat → Baroda, Gujarat"></asp:Label>
                </div>

                <!-- Vehicle -->
                <div class="cb-summary-row">
                    <div class="cb-item-left">
                        <span class="cb-icon">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="1" y="3" width="15" height="13"></rect>
                                <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"></polygon>
                                <circle cx="5.5" cy="18.5" r="2.5"></circle>
                                <circle cx="18.5" cy="18.5" r="2.5"></circle>
                            </svg>
                        </span>
                        <span>Vehicle Type</span>
                    </div>
                    <asp:Label ID="lblVehicle" runat="server" CssClass="cb-item-right" Text="Medium Truck (6-Wheeler)"></asp:Label>
                </div>

                <!-- Load -->
                <div class="cb-summary-row">
                    <div class="cb-item-left">
                        <span class="cb-icon">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path>
                                <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
                                <line x1="12" y1="22.08" x2="12" y2="12"></line>
                            </svg>
                        </span>
                        <span>Load Specifications</span>
                    </div>
                    <asp:Label ID="lblLoad" runat="server" CssClass="cb-item-right" Text="12 Packages (850 kg Total)"></asp:Label>
                </div>

                <!-- Cost -->
                <div class="cb-cost-row">
                    <span class="cb-cost-label">Final Estimated Cost</span>
                    <strong class="cb-cost-value">₹12,500</strong>
                </div>
            </div>

            <!-- Buttons -->
            <div class="cb-btn-group">
                <asp:Button
                    ID="btnBookAnother"
                    runat="server"
                    Text="Book Another"
                    CssClass="cb-btn-secondary"
                    OnClick="btnBookAnother_Click" />

                <asp:Button
                    ID="btnViewBookings"
                    runat="server"
                    Text="View My Bookings"
                    CssClass="cb-btn-primary"
                    OnClick="btnMyBookings_Click" />
            </div>

        </div>
    </div>
</asp:Content>