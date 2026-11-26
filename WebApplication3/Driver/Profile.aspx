<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs"
    Inherits="WebApplication3.Driver.Profile" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    My Profile - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    My Profile
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="driver-profile-content" style="padding: 0;">

        <div class="driver-profile-grid">

            <!-- LEFT PROFILE CARD -->
            <div class="driver-profile-card driver-profile-summary">

                <div class="driver-profile-photo-area">
                    <div class="driver-profile-photo">
                        <asp:Image ID="imgDriverPhoto" runat="server" Visible="false" style="width:100%;height:100%;object-fit:cover;border-radius:50%;" />
                        <span id="spnPhotoFallback" runat="server" class="driver-profile-photo-fallback">👨</span>
                    </div>

                    <div class="driver-profile-name">
                        <asp:Literal ID="litSummaryName" runat="server" Text="Driver" />
                    </div>
                </div>

                <div class="driver-profile-divider"></div>

                <!-- Rating -->
                <div class="driver-rating">
                    <span class="driver-rating-star">☆</span>
                    <strong><asp:Literal ID="litRating" runat="server" Text="5.0" /></strong>
                    <span class="driver-rating-count">(<asp:Literal ID="litTotalTrips" runat="server" Text="0" /> trips)</span>
                </div>

                <div class="driver-profile-divider"></div>

                <!-- Driver Details -->
                <div class="driver-summary-details">
                    <div class="driver-summary-row">
                        <span>Operator License</span>
                        <strong><asp:Literal ID="litLicenseNo" runat="server" Text="-" /></strong>
                    </div>

                    <div class="driver-summary-row">
                        <span>Join Date</span>
                        <strong><asp:Literal ID="litJoinDate" runat="server" Text="-" /></strong>
                    </div>

                    <div class="driver-summary-row">
                        <span>Assigned Vehicle</span>
                        <strong class="vehicle-number"><asp:Literal ID="litAssignedVehicle" runat="server" Text="Unassigned" /></strong>
                    </div>
                </div>

            </div>

            <!-- RIGHT SIDE -->
            <div class="driver-profile-right">

                <!-- PERSONAL INFORMATION -->
                <div class="driver-profile-card driver-information-card">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <h2 class="mb-0">Personal Information</h2>
                        <asp:Button ID="btnEditToggle" runat="server" Text="Edit Contact" CssClass="btn btn-outline-primary btn-sm" CausesValidation="false" OnClick="btnEditToggle_Click" />
                    </div>

                    <asp:Panel ID="pnlViewInfo" runat="server" CssClass="driver-information-grid">
                        <div class="driver-information-item">
                            <label>FULL NAME</label>
                            <span><asp:Literal ID="litFullName" runat="server" Text="-" /></span>
                        </div>

                        <div class="driver-information-item">
                            <label>EMAIL ADDRESS</label>
                            <span><asp:Literal ID="litEmail" runat="server" Text="-" /></span>
                        </div>

                        <div class="driver-information-item">
                            <label>PHONE NUMBER</label>
                            <span><asp:Literal ID="litPhone" runat="server" Text="-" /></span>
                        </div>

                        <div class="driver-information-item">
                            <label>EMERGENCY CONTACT</label>
                            <span><asp:Literal ID="litEmergencyContact" runat="server" Text="-" /></span>
                        </div>

                        <div class="driver-information-item full-width">
                            <label>RESIDENTIAL ADDRESS</label>
                            <span><asp:Literal ID="litAddress" runat="server" Text="-" /></span>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnlEditInfo" runat="server" Visible="false" CssClass="mt-3">
                        <div class="row g-2">
                            <div class="col-md-6">
                                <label class="form-label small fw-semibold">Full Name</label>
                                <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control form-control-sm" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-semibold">Phone Number</label>
                                <asp:TextBox ID="txtEditPhone" runat="server" CssClass="form-control form-control-sm" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-semibold">Emergency Contact</label>
                                <asp:TextBox ID="txtEditEmergency" runat="server" CssClass="form-control form-control-sm" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-semibold">Profile Photo</label>
                                <asp:FileUpload ID="fuDriverPhoto" runat="server" CssClass="form-control form-control-sm" />
                            </div>
                            <div class="col-12">
                                <label class="form-label small fw-semibold">Residential Address</label>
                                <asp:TextBox ID="txtEditAddress" runat="server" CssClass="form-control form-control-sm" />
                            </div>
                        </div>
                        <div class="mt-3 d-flex gap-2">
                            <asp:Button ID="btnSaveProfile" runat="server" Text="Save Changes" CssClass="btn btn-primary btn-sm" CausesValidation="false" OnClick="btnSaveProfile_Click" />
                            <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn btn-outline-secondary btn-sm" CausesValidation="false" OnClick="btnCancelEdit_Click" />
                        </div>
                    </asp:Panel>
                    <asp:Label ID="lblProfileMsg" runat="server" ForeColor="Green" CssClass="d-block mt-2 fw-semibold" />
                </div>

                <!-- PERFORMANCE -->
                <div class="driver-profile-card driver-performance-card">
                    <h2>Performance</h2>

                    <div class="driver-performance-grid">
                        <div class="driver-performance-item">
                            <div class="driver-performance-icon">♧</div>
                            <div>
                                <strong><asp:Literal ID="litCompletedTrips" runat="server" Text="0" /></strong>
                                <span>Trips Completed</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </section>

</asp:Content>
