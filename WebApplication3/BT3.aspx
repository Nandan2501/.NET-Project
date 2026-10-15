<%@ Page Title="Review & Confirm - Book Transportation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="BT3.aspx.cs"
    Inherits="WebApplication3.BT3" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    - Review &amp; Confirm
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    Book Transportation
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
        <section class="rc-content">


            <!-- PROGRESS -->

            <div class="rc-progress">


                <div class="rc-step completed">

                    <span class="rc-step-number">
                        ✓
                    </span>

                    <span>Route Details</span>

                </div>


                <span class="rc-arrow">→</span>


                <div class="rc-step completed">

                    <span class="rc-step-number">
                        ✓
                    </span>

                    <span>Load Details</span>

                </div>


                <span class="rc-arrow">→</span>


                <div class="rc-step active">

                    <span class="rc-step-number">
                        3
                    </span>

                    <span>Review &amp; Confirm</span>

                </div>


            </div>



            <!-- MAIN CARD -->

            <div class="rc-card">

                <h2>Review &amp; Confirm</h2>


                <!-- ROUTE + LOAD -->

                <div class="rc-two-column">


                    <!-- ROUTE DETAILS -->

                    <div class="rc-info-card">

                        <h3>
                            <span class="rc-blue-icon">⌖</span>
                            Route Details
                        </h3>


                        <div class="rc-detail">

                            <span class="rc-label">
                                FROM
                            </span>

                            <strong id="lblFrom"
                                    runat="server">
                                Rajkot, Gujarat
                            </strong>

                        </div>


                        <div class="rc-detail">

                            <span class="rc-label">
                                TO
                            </span>

                            <strong id="lblTo"
                                    runat="server">
                                Baroda, Gujarat
                            </strong>

                        </div>


                        <div class="rc-detail">

                            <span class="rc-label">
                                VEHICLE TYPE
                            </span>

                            <strong id="lblVehicle"
                                    runat="server">
                                Medium Truck (6-Wheeler)
                            </strong>

                        </div>


                        <div class="rc-detail">

                            <span class="rc-label">
                                PREFERRED DATE
                            </span>

                            <strong id="lblDate"
                                    runat="server">
                                Monday, 17 Aug 2026
                            </strong>

                        </div>


                        <div class="rc-detail">

                            <span class="rc-label">
                                ADDITIONAL INSTRUCTIONS
                            </span>

                            <strong id="lblInstructions"
                                    runat="server">
                                Fragile load. Needs careful stacking.
                            </strong>

                        </div>

                    </div>



                    <!-- LOAD DETAILS -->

                    <div class="rc-info-card">

                        <h3>

                            <span class="rc-blue-icon">
                                ◈
                            </span>

                            Load Details

                        </h3>


                        <div class="rc-detail">

                            <span class="rc-label">
                                LOAD TYPE
                            </span>

                            <strong id="lblLoadType"
                                    runat="server">
                                Packaged Goods
                            </strong>

                        </div>


                        <div class="rc-detail">

                            <span class="rc-label">
                                TOTAL WEIGHT
                            </span>

                            <strong id="lblWeight"
                                    runat="server">
                                850 kg
                            </strong>

                        </div>


                        <div class="rc-detail">

                            <span class="rc-label">
                                NO. OF PACKAGES
                            </span>

                            <strong id="lblPackages"
                                    runat="server">
                                12 Packages
                            </strong>

                        </div>


                        <div class="rc-detail">

                            <span class="rc-label">
                                DIMENSIONS
                            </span>

                            <strong id="lblDimensions"
                                    runat="server">
                                120 x 80 x 60 cm
                            </strong>

                        </div>


                        <div class="rc-detail">

                            <span class="rc-label">
                                SPECIAL HANDLING
                            </span>

                            <strong id="lblHandling"
                                    runat="server">
                                Temperature sensitive.
                                Keep below 25°C.
                            </strong>

                        </div>

                    </div>

                </div>



                <!-- COST -->

                <div class="rc-cost">

                    <div>

                        <h3>
                            Estimated Transportation Cost
                        </h3>

                        <p>
                            Based on distance, vehicle type,
                            and current fuel rates.
                            Toll taxes extra.
                        </p>

                    </div>


                    <strong class="rc-price">
                        ₹12,500
                    </strong>

                </div>



                <!-- PAYMENT -->

                <div class="rc-payment">

                    <h3>
                        Payment Method
                    </h3>


                    <div class="rc-payment-option">

                        <span class="rc-radio"></span>

                        <span>
                            Cash on Delivery (COD)
                        </span>

                    </div>

                </div>



                <!-- BUTTONS -->

                <div class="rc-buttons">


                    <asp:Button
                        ID="btnBack"
                        runat="server"
                        Text="Back: Load Details"
                        CssClass="rc-back-btn"
                        OnClick="btnBack_Click" />


                    <asp:Button
                        ID="btnConfirm"
                        runat="server"
                        Text="Confirm Booking"
                        CssClass="rc-confirm-btn"
                        OnClick="btnConfirm_Click" />

                </div>


            </div>

        </section>
</asp:Content>