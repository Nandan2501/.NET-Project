<%@ Page Title="Book Transportation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="BookTransportation.aspx.cs"
    Inherits="WebApplication3.BookTransportation" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    - Book Transportation
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    Book Transportation
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
        <section class="bt-content">

            <!-- PROGRESS -->

            <div class="bt-progress">

                <div class="bt-step active">

                    <span class="bt-step-number">1</span>

                    <span class="bt-step-text">
                        Route Details
                    </span>

                </div>

                <span class="bt-arrow">→</span>

                <div class="bt-step">

                    <span class="bt-step-number">2</span>

                    <span class="bt-step-text">
                        Load Details
                    </span>

                </div>

                <span class="bt-arrow">→</span>

                <div class="bt-step">

                    <span class="bt-step-number">3</span>

                    <span class="bt-step-text">
                        Review &amp; Confirm
                    </span>

                </div>

            </div>


            <!-- ================= FORM CARD ================= -->

            <div class="bt-card">

                <h2>Enter Route Details</h2>


                <!-- FROM -->

                <div class="bt-field">

                    <label for="txtFrom">
                        From Location
                    </label>

                    <asp:TextBox
                        ID="txtFrom"
                        runat="server"
                        CssClass="bt-input"
                        Text="Rajkot, gujarat">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvFrom"
                        runat="server"
                        ControlToValidate="txtFrom"
                        ErrorMessage="Pickup location is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                </div>


                <!-- TO -->

                <div class="bt-field">

                    <label for="txtTo">
                        To Location
                    </label>

                    <asp:TextBox
                        ID="txtTo"
                        runat="server"
                        CssClass="bt-input"
                        Text="baroda,gujarat">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvTo"
                        runat="server"
                        ControlToValidate="txtTo"
                        ErrorMessage="Dropoff location is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                </div>


                <!-- VEHICLE + DATE -->

                <div class="bt-two-column">

                    <div class="bt-field">

                        <label for="ddlVehicle">
                            Vehicle Type
                        </label>

                        <asp:DropDownList
                            ID="ddlVehicle"
                            runat="server"
                            CssClass="bt-input">

                            <asp:ListItem>
                                Medium Truck (6-Wheeler)
                            </asp:ListItem>

                            <asp:ListItem>
                                Small Truck
                            </asp:ListItem>

                            <asp:ListItem>
                                Large Truck
                            </asp:ListItem>

                            <asp:ListItem>
                                Pickup Truck
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>


                    <div class="bt-field">

                        <label for="txtDate">
                            Preferred Date
                        </label>

                        <asp:TextBox
                            ID="txtDate"
                            runat="server"
                            TextMode="Date"
                            CssClass="bt-input">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfvDate"
                            runat="server"
                            ControlToValidate="txtDate"
                            ErrorMessage="Preferred date is required."
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="text-danger small validator-msg mt-1">
                        </asp:RequiredFieldValidator>
                    </div>

                </div>


                <!-- INSTRUCTIONS -->

                <div class="bt-field">

                    <label for="txtInstructions">
                        Additional Instructions
                    </label>

                    <asp:TextBox
                        ID="txtInstructions"
                        runat="server"
                        TextMode="MultiLine"
                        CssClass="bt-textarea"
                        Text="Fragile load. Needs careful stacking.">
                    </asp:TextBox>

                </div>


                <!-- NEXT BUTTON -->

                <asp:Button
                    ID="btnNext"
                    runat="server"
                    Text="Next: Load Details"
                    CssClass="bt-next-btn"
                    OnClick="btnNext_Click" />

            </div>

        </section>
</asp:Content>