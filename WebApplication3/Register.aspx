<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs"
    Inherits="WebApplication3.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Create Account</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <link href="CSS/style.css"
          rel="stylesheet" />

    <link href="CSS/Register.css"
          rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server" novalidate="novalidate">

    <div class="register-page">


        <!-- =====================================================
             LEFT SIDE
        ====================================================== -->

        <div class="register-left">

            <div class="register-global-logo">

                <div class="register-global-icon">
                    ▣
                </div>

                <span>Transpo Global</span>

            </div>

        </div>


        <!-- =====================================================
             RIGHT SIDE
        ====================================================== -->

        <div class="register-right">

            <div class="register-container">


                <!-- LOGO -->

                <div class="register-logo">

                    <div class="register-logo-icon">
                        ▣
                    </div>

                    <span>Transpo</span>

                </div>


                <!-- TITLE -->

                <h1>
                    Create Account
                </h1>


                <p class="register-description">
                    Join Transpo to unlock fast, transparent, and reliable
                    freight solutions.
                </p>


                <!-- FULL NAME -->

                <div class="register-field">
                    <label for="txtFullName">
                        Full Name
                    </label>
                    <asp:TextBox
                        ID="txtFullName"
                        runat="server"
                        CssClass="register-input"
                        placeholder="Enter your full name">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvFullName"
                        runat="server"
                        ControlToValidate="txtFullName"
                        ErrorMessage="Full name is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- EMAIL -->
                <div class="register-field">
                    <label for="txtEmail">
                        Email
                    </label>
                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="register-input"
                        TextMode="Email"
                        placeholder="Enter your email">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="revEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ErrorMessage="Please enter a valid email address."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RegularExpressionValidator>
                </div>

                <!-- PHONE -->
                <div class="register-field">
                    <label for="txtPhone">
                        Phone Number
                    </label>
                    <asp:TextBox
                        ID="txtPhone"
                        runat="server"
                        CssClass="register-input"
                        placeholder="Enter your phone number">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvPhone"
                        runat="server"
                        ControlToValidate="txtPhone"
                        ErrorMessage="Phone number is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="revPhone"
                        runat="server"
                        ControlToValidate="txtPhone"
                        ValidationExpression="^[0-9]{10}$"
                        ErrorMessage="Please enter a valid 10-digit phone number."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RegularExpressionValidator>
                </div>

                <!-- PASSWORD -->
                <div class="register-field">
                    <label for="txtPassword">
                        Password
                    </label>
                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="register-input"
                        placeholder="Create password">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvPassword"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- CONFIRM PASSWORD -->
                <div class="register-field">
                    <label for="txtConfirmPassword">
                        Confirm Password
                    </label>
                    <asp:TextBox
                        ID="txtConfirmPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="register-input"
                        placeholder="Confirm your password">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvConfirmPassword"
                        runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ErrorMessage="Please confirm your password."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator
                        ID="cvConfirmPassword"
                        runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ControlToCompare="txtPassword"
                        ErrorMessage="Passwords do not match."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:CompareValidator>
                </div>


                <!-- MESSAGE -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="register-message">
                </asp:Label>


                <!-- SIGN UP -->

                <asp:Button
                    ID="btnSignUp"
                    runat="server"
                    Text="Sign Up"
                    CssClass="register-button"
                    OnClick="btnSignUp_Click" />


                <!-- LOGIN -->

                <div class="register-login">

                    <span>
                        Already have an account?
                    </span>

                    <a href="Login.aspx">
                        Login
                    </a>

                </div>

            </div>

        </div>

    </div>

</form>

</body>

</html>