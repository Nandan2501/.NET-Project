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
                        <img src="<%= ResolveUrl("~/Images/driver.png") %>"
                             alt="Driver Profile"
                             onerror="this.style.display='none';" />
                        <span class="driver-profile-photo-fallback">👨</span>
                    </div>

                    <div class="driver-profile-name">
                        Yashrajsinh
                    </div>

                    
                </div>

                <div class="driver-profile-divider"></div>

                <!-- Rating -->
                <div class="driver-rating">
                    <span class="driver-rating-star">☆</span>
                    <strong>4.9</strong>
                    <span class="driver-rating-count">(428 ratings)</span>
                </div>

                <div class="driver-profile-divider"></div>

                <!-- Driver Details -->
                <div class="driver-summary-details">
                    <div class="driver-summary-row">
                        <span>Operator License</span>
                        <strong>gj-451646114</strong>
                    </div>

                    <div class="driver-summary-row">
                        <span>Join Date</span>
                        <strong>12 Feb 2023</strong>
                    </div>

                    <div class="driver-summary-row">
                        <span>Assigned Vehicle</span>
                        <strong class="vehicle-number">GJ-12-AB-1234</strong>
                    </div>
                </div>

            </div>

            <!-- RIGHT SIDE -->
            <div class="driver-profile-right">

                <!-- PERSONAL INFORMATION -->
                <div class="driver-profile-card driver-information-card">
                    <h2>Personal Information</h2>

                    <div class="driver-information-grid">
                        <div class="driver-information-item">
                            <label>FULL NAME</label>
                            <span>yashraj</span>
                        </div>

                        <div class="driver-information-item">
                            <label>EMAIL ADDRESS</label>
                            <span>yashraj485@gmail.com</span>
                        </div>

                        <div class="driver-information-item">
                            <label>PHONE NUMBER</label>
                            <span>+919327468707</span>
                        </div>

                        <div class="driver-information-item">
                            <label>EMERGENCY CONTACT</label>
                            <span>+919327468707</span>
                        </div>

                        <div class="driver-information-item full-width">
                            <label>RESIDENTIAL ADDRESS</label>
                            <span>Suite 400, Ahmedabad Logistic Center, Ahmedabad, India</span>
                        </div>
                    </div>
                </div>

                <!-- PERFORMANCE -->
                <div class="driver-profile-card driver-performance-card">
                    <h2>Performance</h2>

                    <div class="driver-performance-grid">
                        <div class="driver-performance-item">
                            <div class="driver-performance-icon">♧</div>
                            <div>
                                <strong>1,842</strong>
                                <span>Trips Completed</span>
                            </div>
                        </div>

                        
                    </div>
                </div>

            </div>

        </div>

    </section>

</asp:Content>