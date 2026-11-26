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

        <div class="d-flex justify-content-between align-items-center mb-3">
            <a href="Dashboard.aspx" class="btn btn-outline-secondary btn-sm">← Back to Dashboard</a>
            <asp:Label ID="lblActionMsg" runat="server" CssClass="fw-semibold" />
        </div>

        <!-- BOOKING HEADER -->
        <div class="td-booking-header">
            <div class="td-booking-info">
                <div class="td-booking-item">
                    <span class="td-small-label">BOOKING ID</span>
                    <strong class="td-booking-id">#<asp:Literal ID="litBookingNumber" runat="server" Text="TRP-0000" /></strong>
                </div>

                <div class="td-header-divider"></div>

                <div class="td-booking-item">
                    <span class="td-small-label">CUSTOMER</span>
                    <strong><asp:Literal ID="litCustomerName" runat="server" Text="-" /></strong>
                </div>

                <div class="td-header-divider"></div>

                <div class="td-booking-item td-date-item">
                    <span class="td-small-label">TRIP DATE</span>
                    <strong><asp:Literal ID="litTripDate" runat="server" Text="-" /></strong>
                </div>
            </div>

            <span id="spnBookingStatus" runat="server" class="td-cancelled">Pending</span>
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
                        <strong><asp:Literal ID="litVehicleName" runat="server" Text="Unassigned" /></strong>
                        <span>Reg No: <asp:Literal ID="litVehicleReg" runat="server" Text="-" /></span>
                    </div>
                </div>

                <div class="td-horizontal-line"></div>

                <!-- Driver -->
                <div class="td-driver-row">
                    <div class="td-driver-avatar">👨</div>
                    <div class="td-row-information">
                        <strong><asp:Literal ID="litDriverName" runat="server" Text="Unassigned" /></strong>
                        <span>License: <asp:Literal ID="litDriverLicense" runat="server" Text="-" /></span>
                    </div>
                </div>

                <div class="td-horizontal-line"></div>

                <!-- ADMIN DISPATCH CONTROLS -->
                <div class="mt-3">
                    <h3 style="font-size:14px; font-weight:700; margin-bottom:10px;">Manage Dispatch &amp; Status</h3>
                    <div class="mb-2">
                        <label class="form-label small fw-semibold mb-1">Assign Driver</label>
                        <asp:DropDownList ID="ddlAssignDriver" runat="server" CssClass="form-select form-select-sm" />
                    </div>
                    <div class="mb-2">
                        <label class="form-label small fw-semibold mb-1">Assign Vehicle</label>
                        <asp:DropDownList ID="ddlAssignVehicle" runat="server" CssClass="form-select form-select-sm" />
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label small fw-semibold mb-1">Booking Status</label>
                            <asp:DropDownList ID="ddlBookingStatus" runat="server" CssClass="form-select form-select-sm">
                                <asp:ListItem Text="Pending" Value="Pending" />
                                <asp:ListItem Text="Confirmed" Value="Confirmed" />
                                <asp:ListItem Text="Ongoing" Value="Ongoing" />
                                <asp:ListItem Text="Completed" Value="Completed" />
                                <asp:ListItem Text="Cancelled" Value="Cancelled" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-6">
                            <label class="form-label small fw-semibold mb-1">Payment Status</label>
                            <asp:DropDownList ID="ddlPaymentStatus" runat="server" CssClass="form-select form-select-sm">
                                <asp:ListItem Text="Pending" Value="Pending" />
                                <asp:ListItem Text="Paid" Value="Paid" />
                                <asp:ListItem Text="Failed" Value="Failed" />
                                <asp:ListItem Text="Refunded" Value="Refunded" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <asp:Button ID="btnUpdateTrip" runat="server" Text="Save Trip Updates" CssClass="btn btn-primary btn-sm w-100" OnClick="btnUpdateTrip_Click" />
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
                            <strong><asp:Literal ID="litPickupAddress" runat="server" Text="-" /></strong>
                        </div>
                    </div>

                    <div class="td-horizontal-line"></div>

                    <div class="td-route-row">
                        <div class="td-route-dot drop"></div>
                        <div>
                            <span class="td-route-label">DROP ADDRESS</span>
                            <strong><asp:Literal ID="litDropAddress" runat="server" Text="-" /></strong>
                        </div>
                    </div>
                </div>

                <!-- PAYMENT -->
                <div class="td-card td-payment-card">
                    <h2>Payment Summary</h2>

                    <div class="td-payment-row">
                        <span>Base Fare</span>
                        <strong><asp:Literal ID="litBaseFare" runat="server" Text="₹0" /></strong>
                    </div>

                    <div class="td-payment-row">
                        <span>Tolls &amp; Taxes</span>
                        <strong><asp:Literal ID="litTolls" runat="server" Text="₹0" /></strong>
                    </div>

                    <div class="td-horizontal-line"></div>

                    <div class="td-total-row">
                        <strong>Total Amount</strong>
                        <strong><asp:Literal ID="litTotalAmount" runat="server" Text="₹0" /></strong>
                    </div>
                </div>

            </div>

        </div>

        <!-- SHIPMENT MILESTONE -->
        <div class="td-milestone">
            <h2>Shipment Milestone Tracker</h2>

            <div class="td-milestone-content">
                <div class="td-location">
                    <span class="td-location-name"><asp:Literal ID="litOriginCity" runat="server" Text="Origin" /> (<asp:Literal ID="litPickupMilestoneStatus" runat="server" Text="Pending" />)</span>
                    <strong><asp:Literal ID="litOriginTime" runat="server" Text="-" /></strong>
                </div>

                <div class="td-arrow">⟶</div>

                <div class="td-location">
                    <span class="td-location-name"><asp:Literal ID="litDropCity" runat="server" Text="Destination" /> (<asp:Literal ID="litDropMilestoneStatus" runat="server" Text="Pending" />)</span>
                    <strong><asp:Literal ID="litDropTime" runat="server" Text="-" /></strong>
                </div>
            </div>
        </div>

    </section>

</asp:Content>
