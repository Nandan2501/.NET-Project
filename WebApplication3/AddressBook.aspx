<%@ Page Title="Address Book" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AddressBook.aspx.cs"
    Inherits="WebApplication3.AddressBook" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    - Address Book
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    Address Book
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
        <section class="ab-content">

            <!-- HEADER CARD -->

            <div class="ab-header-card">

                <div class="ab-header-text">

                    <h2>Manage Shipping Addresses</h2>

                    <p>
                        Save your warehouses, offices, and ports for streamlined bookings.
                    </p>

                </div>

                <asp:Button
                    ID="btnAddAddress"
                    runat="server"
                    Text="+  Add New Address"
                    CssClass="ab-add-btn"
                    OnClick="btnAddAddress_Click" />

            </div>


            <!-- ================= ADDRESS 1 ================= -->

            <div class="ab-address-card default-address">

                <div class="ab-address-left">

                    <div class="ab-address-icon location-icon">
                        ♧
                    </div>

                    <div class="ab-address-info">

                        <div class="ab-address-title">

                            <strong>Rajkot main office</strong>

                            <span class="ab-default-badge">
                                Default Delivery
                            </span>

                        </div>

                        <p>
                            spara,rajkot,gujarat 360002
                        </p>

                        <span class="ab-phone">
                            ☎ &nbsp;+91 98765 43210
                        </span>

                    </div>

                </div>

                <div class="ab-actions">

                    <asp:Button
                        ID="btnEdit1"
                        runat="server"
                        Text="✎"
                        CommandArgument="1"
                        CssClass="ab-icon-btn edit-btn"
                        OnClick="btnEdit_Click" />

                  

                </div>

            </div>


            <!-- ================= ADDRESS 2 ================= -->

            <div class="ab-address-card">

                <div class="ab-address-left">

                    <div class="ab-address-icon home-icon">
                        ♙
                    </div>

                    <div class="ab-address-info">

                        <div class="ab-address-title">
                            <strong>Private Residence (Home)</strong>
                        </div>

                        <p>
                            Apartment 402, Royal Residency, CG Road, Navrangpura, Ahmedabad, Gujarat, 380009
                        </p>

                        <span class="ab-phone">
                            ☎ &nbsp;+91 91234 56789
                        </span>

                    </div>

                </div>

                <div class="ab-actions">

                    <asp:Button
                        ID="btnEdit2"
                        runat="server"
                        Text="✎"
                        CommandArgument="2"
                        CssClass="ab-icon-btn edit-btn"
                        OnClick="btnEdit_Click" />

                   

                </div>

            </div>


            <!-- ================= ADDRESS 3 ================= -->

            <div class="ab-address-card">

                <div class="ab-address-left">

                    <div class="ab-address-icon industrial-icon">
                        ∿
                    </div>

                    <div class="ab-address-info">

                        <div class="ab-address-title">
                            <strong>Industrial Construction Hub (Site Location)</strong>
                        </div>

                        <p>
                            Plot 14-B, Surat Special Economic Zone (SEZ), Sachin, Surat, Gujarat, 394230
                        </p>

                        <span class="ab-phone">
                            ☎ &nbsp;+91 94567 12304
                        </span>

                    </div>

                </div>

                <div class="ab-actions">

                    <asp:Button
                        ID="btnEdit3"
                        runat="server"
                        Text="✎"
                        CommandArgument="3"
                        CssClass="ab-icon-btn edit-btn"
                        OnClick="btnEdit_Click" />

                   

                </div>

            </div>


            <!-- ================= ADDRESS 4 ================= -->

            <div class="ab-address-card">

                <div class="ab-address-left">

                    <div class="ab-address-icon port-icon">
                        ⚓
                    </div>

                    <div class="ab-address-info">

                        <div class="ab-address-title">
                            <strong>Kandla Port Terminal (Port Address)</strong>
                        </div>

                        <p>
                            Berth No. 8, Cargo Terminal East, Kandla Port, Gandhidham, Gujarat, 370210
                        </p>

                        <span class="ab-phone">
                            ☎ &nbsp;+91 93210 98765
                        </span>

                    </div>

                </div>

                <div class="ab-actions">

                    <asp:Button
                        ID="btnEdit4"
                        runat="server"
                        Text="✎"
                        CommandArgument="4"
                        CssClass="ab-icon-btn edit-btn"
                        OnClick="btnEdit_Click" />

                   

                </div>

            </div>

        </section>
</asp:Content>