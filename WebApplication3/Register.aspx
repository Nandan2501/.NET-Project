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

<form id="form1" runat="server">

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