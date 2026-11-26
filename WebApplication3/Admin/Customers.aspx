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

        <div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-3">
            <div class="d-flex gap-2 align-items-center">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control form-control-sm" placeholder="Search name, email, phone..." style="width:240px;" />
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-primary btn-sm" CausesValidation="false" OnClick="btnSearch_Click" />
                <asp:Button ID="btnClearSearch" runat="server" Text="Reset" CssClass="btn btn-outline-secondary btn-sm" CausesValidation="false" OnClick="btnClearSearch_Click" />
            </div>
            <asp:Button ID="btnToggleAddForm" runat="server" Text="+ Add Customer" CssClass="btn btn-primary btn-sm" CausesValidation="false" OnClick="btnToggleAddForm_Click" />
        </div>

        <asp:Label ID="lblCustomerMessage" runat="server" CssClass="d-block mb-2 fw-semibold" />

        <!-- ADD CUSTOMER PANEL -->
        <asp:Panel ID="pnlAddCustomer" runat="server" Visible="false" CssClass="cu-card mb-3">
            <div class="cu-card-title">Add New Customer</div>
            <div class="row g-3 mt-1">
                <div class="col-md-4">
                    <label class="form-label small fw-semibold">Full Name</label>
                    <asp:TextBox ID="txtNewName" runat="server" CssClass="form-control form-control-sm" placeholder="Enter full name" />
                </div>
                <div class="col-md-4">
                    <label class="form-label small fw-semibold">Email</label>
                    <asp:TextBox ID="txtNewEmail" runat="server" CssClass="form-control form-control-sm" TextMode="Email" placeholder="customer@example.com" />
                </div>
                <div class="col-md-4">
                    <label class="form-label small fw-semibold">Phone</label>
                    <asp:TextBox ID="txtNewPhone" runat="server" CssClass="form-control form-control-sm" placeholder="+91 98765 43210" />
                </div>
                <div class="col-md-4">
                    <label class="form-label small fw-semibold">City</label>
                    <asp:TextBox ID="txtNewCity" runat="server" CssClass="form-control form-control-sm" placeholder="e.g. Rajkot" />
                </div>
                <div class="col-md-4">
                    <label class="form-label small fw-semibold">Address</label>
                    <asp:TextBox ID="txtNewAddress" runat="server" CssClass="form-control form-control-sm" placeholder="Street / office address" />
                </div>
                <div class="col-md-4">
                    <label class="form-label small fw-semibold">Default Password</label>
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control form-control-sm" Text="123456" />
                </div>
            </div>
            <div class="mt-3 d-flex gap-2">
                <asp:Button ID="btnSaveCustomer" runat="server" Text="Save Customer" CssClass="btn btn-primary btn-sm" CausesValidation="false" OnClick="btnSaveCustomer_Click" />
                <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel" CssClass="btn btn-outline-secondary btn-sm" CausesValidation="false" OnClick="btnCancelAdd_Click" />
            </div>
        </asp:Panel>

        <!-- CUSTOMER CARD -->
        <div class="cu-card">
            <div class="cu-card-title">
                <asp:Literal ID="litCustomerCount" runat="server" Text="All Registered Customers" />
            </div>

            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0" style="min-width: 760px;">
                    <thead class="table-light">
                        <tr>
                            <th>Customer ID</th>
                            <th>Customer Name</th>
                            <th>Phone</th>
                            <th>City</th>
                            <th>Status</th>
                            <th>Email</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptCustomers" runat="server" OnItemCommand="rptCustomers_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td class="cu-id fw-semibold">#CUST-<%# Eval("UserId") %></td>
                                    <td><%# Server.HtmlEncode(Eval("FullName").ToString()) %></td>
                                    <td><%# Server.HtmlEncode(Eval("Phone").ToString()) %></td>
                                    <td><%# Server.HtmlEncode(Eval("City").ToString()) %></td>
                                    <td>
                                        <span class='cu-status <%# Eval("AccountStatus").ToString().Equals("Active", StringComparison.OrdinalIgnoreCase) ? "active" : "inactive" %>'>
                                            <%# Eval("AccountStatus") %>
                                        </span>
                                    </td>
                                    <td><%# Server.HtmlEncode(Eval("Email").ToString()) %></td>
                                    <td>
                                        <asp:LinkButton ID="btnToggleStatus" runat="server"
                                            CommandName="ToggleStatus"
                                            CommandArgument='<%# Eval("UserId") + "|" + Eval("AccountStatus") %>'
                                            Text='<%# Eval("AccountStatus").ToString().Equals("Active", StringComparison.OrdinalIgnoreCase) ? "Deactivate" : "Activate" %>'
                                            CssClass="btn btn-outline-secondary btn-sm" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

        </div>

    </section>

</asp:Content>
