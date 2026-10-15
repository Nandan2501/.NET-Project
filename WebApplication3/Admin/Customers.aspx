<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Customers.aspx.cs"
    Inherits="WebApplication3.Customers" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Active Customers - Transpo
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Customers
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="cu-content" style="padding: 0;">

        

        <!-- CUSTOMER CARD -->
        <div class="cu-card">
            <div class="cu-card-title">
                All Registered Customers
            </div>

            <!-- TABLE HEADER -->
            <div class="cu-table-head">
                <div>Customer ID</div>
                <div>Customer NAME</div>
                <div>PHONE</div>
                <div>CITY</div>
                <div>STATUS</div>
                <div>Email</div>
               
            </div>

            <!-- CUSTOMER 1 -->
            <div class="cu-table-row">
                <div class="cu-id">#cut-5501</div>
                <div>yash</div>
                <div>+91 93274 68707</div>
                <div>Rajkot</div>
                <div><span class="cu-status active">Active</span></div>
                <div>yashop78@gmail.com</div>
            </div>

            <!-- CUSTOMER 2 -->
            <div class="cu-table-row">
                <div class="cu-id">#cut-5502</div>
                <div>vijay</div>
                <div>+91 83202 46902</div>
                <div>surat</div>
                <div><span class="cu-status active">Active</span></div>
                <div>vijayop788@gmail.com</div>
                
            </div>

            <!-- CUSTOMER 3 -->
            <div class="cu-table-row">
                <div class="cu-id">#cut-5503</div>
                <div>himil</div>
                <div>+91 85964 54698</div>
                <div>aanad</div>
                <div><span class="cu-status active">Active</span></div>
                <div>himilbhaya45@gmail.com</div>
               
            </div>

            <!-- CUSTOMER 4 -->
            <div class="cu-table-row">
                <div class="cu-id">#cut-5504</div>
                <div>ramesh</div>
                <div>+91 78455 36589</div>
                <div>akleshwar</div>
                <div><span class="cu-status active">Active</span></div>
                <div>ramesh554@gmail.com</div>
                
            </div>

            <!-- CUSTOMER 5 -->
            <div class="cu-table-row">
                <div class="cu-id">#cut-5505</div>
                <div>raju</div>
                <div>+91 96589 65896</div>
                <div>baroda</div>
                <div><span class="cu-status inactive">Inactive</span></div>
                <div>rajubhau4558@gmail.com</div>
                
            </div>

            <!-- CUSTOMER 6 -->
            <div class="cu-table-row">
                <div class="cu-id">#cut-5506</div>
                <div>viram</div>
                <div>+91 96587 25698</div>
                <div>bhuj</div>
                <div><span class="cu-status active">Active</span></div>
                <div>viramviro789@gmail.com</div>
               
            </div>

        </div>

    </section>

</asp:Content>
