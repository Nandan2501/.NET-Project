<%@ Page Title="Booking Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="BookDetails.aspx.cs"
    Inherits="WebApplication3.BookingDetails" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    - Booking Details
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    My Bookings
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
        <section class="bd-content">

            <!-- BOOKING TITLE -->

            <div class="bd-booking-heading">

                <h2>
                    Booking
                    <span id="lblBookingTitle" runat="server">#TRP-1004</span>
                </h2>

                <span id="lblStatus"
                      runat="server"
                      class="bd-status ongoing">
                    Ongoing
                </span>

            </div>


            <!-- ================= BOOKING INFORMATION ================= -->

            <div class="bd-card">

                <h3>Booking Information</h3>

                <div class="bd-info-list">

                    <div class="bd-info-row">
                        <span class="bd-label">Booking Date</span>

                        <strong id="lblBookingDate" runat="server">
                            17 Aug 2026, 10:00 AM
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Payment Status</span>

                        <strong id="lblPaymentStatus" runat="server">
                            Paid
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Payment Method</span>

                        <strong id="lblPaymentMethod" runat="server">
                            Online
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Total Amount</span>

                        <strong id="lblTotalAmount" runat="server">
                            ₹250.00
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Pickup Address</span>
                        <strong id="lblPickupAddress" runat="server">-</strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Drop Address</span>
                        <strong id="lblDropAddress" runat="server">-</strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Assigned Driver</span>
                        <strong id="lblDriverInfo" runat="server">-</strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Instructions</span>
                        <strong id="lblInstructions" runat="server">-</strong>
                    </div>

                </div>

                <div class="mt-3 p-3 rounded border bg-light">
                    <div class="fw-bold mb-1">Trip Verification &amp; Driver Payout Status</div>
                    <div class="small text-secondary mb-2">
                        <asp:Literal ID="litWorkflowStatus" runat="server" Text="Checking trip status..." />
                    </div>
                    <div class="d-flex flex-wrap align-items-center gap-2">
                        <asp:Button ID="btnConfirmArrived" runat="server" Text="Confirm Driver Arrived (Release 1st Half 50%)" CssClass="btn btn-success btn-sm" Visible="false" OnClick="btnConfirmArrived_Click" />
                        <asp:Button ID="btnConfirmCompleted" runat="server" Text="Confirm Trip Completed (Release 2nd Half 50%)" CssClass="btn btn-success btn-sm" Visible="false" OnClick="btnConfirmCompleted_Click" />
                        <asp:Button ID="btnPayNow" runat="server" Text="Pay Now (Online)" CssClass="btn btn-primary btn-sm" Visible="false" OnClick="btnPayNow_Click" />
                        <a href="Bookings.aspx" class="btn btn-outline-secondary btn-sm">Back to Bookings</a>
                    </div>
                    <asp:Label ID="lblDetailMsg" runat="server" ForeColor="Green" CssClass="d-block mt-2 fw-semibold" />
                </div>

            </div>


            <!-- ================= LOAD DETAILS ================= -->

            <div class="bd-card">

                <h3>Load Details</h3>

                <div class="bd-info-list">

                    <div class="bd-info-row">
                        <span class="bd-label">Vehicle Type</span>

                        <strong id="lblVehicle" runat="server">
                            Medium Truck (6-Wheeler)
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Load Type</span>

                        <strong id="lblLoadType" runat="server">
                            Industrial Raw Material
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Total Weight</span>

                        <strong id="lblWeight" runat="server">
                            4.5 Tons
                        </strong>
                    </div>

                </div>

            </div>


            <!-- ================= CUSTOMER DETAILS ================= -->

            <div class="bd-card">

                <h3>Customer Details</h3>

                <div class="bd-info-list">

                    <div class="bd-info-row">
                        <span class="bd-label">Company Name</span>

                        <strong id="lblCompany" runat="server">
                            Lumen Enterprises
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Contact Person</span>

                        <strong id="lblContactPerson" runat="server">
                            Vraj Akbari
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Email</span>

                        <strong id="lblEmail" runat="server">
                            vraj55652@gmail.com
                        </strong>
                    </div>

                    <div class="bd-info-row">
                        <span class="bd-label">Phone</span>

                        <strong id="lblPhone" runat="server">
                            +919865745215
                        </strong>
                    </div>

                </div>

            </div>

        </section>
</asp:Content>