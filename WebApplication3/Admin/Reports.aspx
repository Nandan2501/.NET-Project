<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Reports.aspx.cs"
    Inherits="WebApplication3.Reports" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Reports &amp; Analytics - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Reports
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="rp-content" style="padding: 0;">

        <!-- STATISTICS -->
        <div class="rp-stat-grid">

            <!-- TOTAL BOOKINGS -->
            <div class="rp-stat-card">
                <div class="rp-stat-top">
                    <span>Total Bookings</span>
                    <div class="rp-stat-icon">▣</div>
                </div>
                <strong class="rp-stat-value">1,248</strong>
            </div>

            <!-- TOTAL REVENUE -->
            <div class="rp-stat-card">
                <div class="rp-stat-top">
                    <span>Total Revenue</span>
                    <div class="rp-stat-icon">₹</div>
                </div>
                <strong class="rp-stat-value">₹50,48,450</strong>
            </div>

            <!-- AVERAGE TRIP -->
            <div class="rp-stat-card">
                <div class="rp-stat-top">
                    <span>Average Trip Value</span>
                    <div class="rp-stat-icon">↗</div>
                </div>
                <strong class="rp-stat-value">₹10,450</strong>
            </div>

            <!-- ACTIVE VEHICLES -->
            <div class="rp-stat-card">
                <div class="rp-stat-top">
                    <span>Active Vehicles</span>
                    <div class="rp-stat-icon">▣</div>
                </div>
                <strong class="rp-stat-value">482</strong>
            </div>

            <!-- TOTAL DRIVERS -->
            <div class="rp-stat-card">
                <div class="rp-stat-top">
                    <span>Total Drivers</span>
                    <div class="rp-stat-icon">♙</div>
                </div>
                <strong class="rp-stat-value">1,150</strong>
            </div>

            <!-- CUSTOMER SATISFACTION -->
            <div class="rp-stat-card">
                <div class="rp-stat-top">
                    <span>Customer Satisfaction</span>
                    <div class="rp-stat-icon">★</div>
                </div>
                <strong class="rp-stat-value">4.8/5</strong>
            </div>

        </div>

        <!-- LOWER SECTION -->
        <div class="rp-bottom-grid">

            <!-- TOP PERFORMING DRIVERS -->
            <div class="rp-panel">
                <div class="rp-panel-header">
                    <h2>Top Performing Drivers</h2>
                    <a href="Drivers.aspx">View All</a>
                </div>

                <div class="rp-driver-row">
                    <div class="rp-driver-avatar">RK</div>
                    <div class="rp-driver-info">
                        <strong>Rajesh Kumar</strong>
                        <span>ID: DRV-4421</span>
                    </div>
                    <div class="rp-driver-result">
                        <strong>142 Trips</strong>
                        <span>★ 4.9</span>
                    </div>
                </div>

                <div class="rp-driver-row">
                    <div class="rp-driver-avatar">AS</div>
                    <div class="rp-driver-info">
                        <strong>Ankit Sharma</strong>
                        <span>ID: DRV-4458</span>
                    </div>
                    <div class="rp-driver-result">
                        <strong>138 Trips</strong>
                        <span>★ 4.8</span>
                    </div>
                </div>

                <div class="rp-driver-row">
                    <div class="rp-driver-avatar">SV</div>
                    <div class="rp-driver-info">
                        <strong>Sunil Verma</strong>
                        <span>ID: DRV-4490</span>
                    </div>
                    <div class="rp-driver-result">
                        <strong>125 Trips</strong>
                        <span>★ 4.7</span>
                    </div>
                </div>

                <div class="rp-driver-row">
                    <div class="rp-driver-avatar">VS</div>
                    <div class="rp-driver-info">
                        <strong>Vikram Singh</strong>
                        <span>ID: DRV-4501</span>
                    </div>
                    <div class="rp-driver-result">
                        <strong>118 Trips</strong>
                        <span>★ 4.8</span>
                    </div>
                </div>
            </div>

            <!-- RECENT REPORTS -->
            <div class="rp-panel">
                <div class="rp-panel-header">
                    <h2>Recent Reports</h2>
                    <a href="#">Refresh</a>
                </div>

                <div class="rp-report-head">
                    <span>REPORT NAME</span>
                    <span>DATE</span>
                    <span>STATUS</span>
                    <span>ACTION</span>
                </div>

                <div class="rp-report-row">
                    <div class="rp-report-name">
                        <strong>Monthly_Revenue_Oct</strong>
                        <span>Excel Format</span>
                    </div>
                    <div class="rp-report-date">
                        Nov 01,<br />2023
                    </div>
                    <div>
                        <span class="rp-status completed">COMPLETED</span>
                    </div>
                    <div class="rp-download">☁</div>
                </div>

                <div class="rp-report-row">
                    <div class="rp-report-name">
                        <strong>Driver_Payouts_W44</strong>
                        <span>PDF Format</span>
                    </div>
                    <div class="rp-report-date">
                        Oct 30,<br />2023
                    </div>
                    <div>
                        <span class="rp-status completed">COMPLETED</span>
                    </div>
                    <div class="rp-download">☁</div>
                </div>

                <div class="rp-report-row">
                    <div class="rp-report-name">
                        <strong>Customer_Retention_Q3</strong>
                        <span>CSV Format</span>
                    </div>
                    <div class="rp-report-date">
                        Oct 28,<br />2023
                    </div>
                    <div>
                        <span class="rp-status processing">PROCESSING</span>
                    </div>
                    <div class="rp-download">◌</div>
                </div>

                <div class="rp-report-row">
                    <div class="rp-report-name">
                        <strong>Fleet_Utilization_Report</strong>
                        <span>Excel Format</span>
                    </div>
                    <div class="rp-report-date">
                        Oct 25,<br />2023
                    </div>
                    <div>
                        <span class="rp-status completed">COMPLETED</span>
                    </div>
                    <div class="rp-download">☁</div>
                </div>
            </div>

        </div>

    </section>

</asp:Content>
