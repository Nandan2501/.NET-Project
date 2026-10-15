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