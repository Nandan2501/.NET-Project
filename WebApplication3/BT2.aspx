<%@ Page Title="Load Details - Book Transportation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="BT2.aspx.cs"
    Inherits="WebApplication3.BT2" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContent" runat="server">
    - Load Details
</asp:Content>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PageTitle" runat="server">
    Book Transportation
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
        <section class="ld-content">

            <!-- PROGRESS -->
            <div class="ld-progress">

                <div class="ld-step completed">
                    <span class="ld-step-number">✓</span>
                    <span>Route Details</span>
                </div>

                <span class="ld-arrow">→</span>

                <div class="ld-step active">
                    <span class="ld-step-number">2</span>
                    <span>Load Details</span>
                </div>

                <span class="ld-arrow">→</span>

                <div class="ld-step">
                    <span class="ld-step-number">3</span>
                    <span>Review &amp; Confirm</span>
                </div>

            </div>


            <!-- FORM CARD -->
            <div class="ld-card">

                <h2>Enter Load Details</h2>


                <!-- LOAD TYPE + WEIGHT -->
                <div class="ld-two-column">

                    <div class="ld-field">

                        <label for="ddlLoadType">
                            Load Type
                        </label>

                        <asp:DropDownList
                            ID="ddlLoadType"
                            runat="server"
                            CssClass="ld-input">

                            <asp:ListItem>
                                Packaged Goods
                            </asp:ListItem>

                            <asp:ListItem>
                                Industrial Raw Material
                            </asp:ListItem>

                            <asp:ListItem>
                                Fragile Goods
                            </asp:ListItem>

                            <asp:ListItem>
                                Agricultural Products
                            </asp:ListItem>

                            <asp:ListItem>
                                Other
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>


                    <div class="ld-field">

                        <label for="txtWeight">
                            Weight (in kg)
                        </label>

                        <asp:TextBox
                            ID="txtWeight"
                            runat="server"
                            CssClass="ld-input"
                            Text="850">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfvWeight"
                            runat="server"
                            ControlToValidate="txtWeight"
                            ErrorMessage="Weight is required."
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="text-danger small d-block mt-1">
                        </asp:RequiredFieldValidator>
                    </div>

                </div>


                <!-- PACKAGES + DIMENSIONS -->
                <div class="ld-two-column">

                    <div class="ld-field">

                        <label for="txtPackages">
                            Number of Packages
                        </label>

                        <asp:TextBox
                            ID="txtPackages"
                            runat="server"
                            CssClass="ld-input"
                            Text="12">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfvPackages"
                            runat="server"
                            ControlToValidate="txtPackages"
                            ErrorMessage="Number of packages is required."
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="text-danger small d-block mt-1">
                        </asp:RequiredFieldValidator>
                    </div>


                    <div class="ld-field">

                        <label>
                            Package Dimensions (L x W x H in cm)
                        </label>

                        <div class="ld-dimensions">

                            <asp:TextBox
                                ID="txtLength"
                                runat="server"
                                CssClass="ld-dimension-input"
                                Text="L: 120">
                            </asp:TextBox>

                            <asp:TextBox
                                ID="txtWidth"
                                runat="server"
                                CssClass="ld-dimension-input"
                                Text="W: 80">
                            </asp:TextBox>

                            <asp:TextBox
                                ID="txtHeight"
                                runat="server"
                                CssClass="ld-dimension-input"
                                Text="H: 60">
                            </asp:TextBox>

                        </div>
                        <asp:RequiredFieldValidator
                            ID="rfvLength"
                            runat="server"
                            ControlToValidate="txtLength"
                            ErrorMessage="Length is required."
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="text-danger small d-block mt-1">
                        </asp:RequiredFieldValidator>
                    </div>

                </div>


                <!-- SPECIAL HANDLING -->
                <div class="ld-field">

                    <label for="txtHandling">
                        Special Handling Requirements
                    </label>

                    <asp:TextBox
                        ID="txtHandling"
                        runat="server"
                        TextMode="MultiLine"
                        CssClass="ld-textarea"
                        Text="Temperature sensitive. Keep below 25°C.">
                    </asp:TextBox>

                </div>


                <!-- BUTTONS -->
                <div class="ld-buttons">

                    <asp:Button
                        ID="btnBack"
                        runat="server"
                        Text="Back: Route Details"
                        CssClass="ld-back-btn"
                        CausesValidation="false"
                        OnClick="btnBack_Click" />

                    <asp:Button
                        ID="btnNext"
                        runat="server"
                        Text="Next: Review &amp; Confirm"
                        CssClass="ld-next-btn"
                        OnClick="btnNext_Click" />

                </div>

            </div>

        </section>
</asp:Content>