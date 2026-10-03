<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="FPass.aspx.cs"
    Inherits="WebApplication3.FPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Forgot Password</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <link href="CSS/style.css"
          rel="stylesheet" />

    <link href="CSS/FPass.css"
          rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

    <div class="fpass-page">

        <!-- LEFT SIDE -->

        <div class="fpass-left">

            <div class="fpass-global-logo">

                <span class="fpass-global-icon">▣</span>

                <span>Transpo Global</span>

            </div>

        </div>


        <!-- RIGHT SIDE -->

        <div class="fpass-right">

            <div class="fpass-container">


                <!-- LOGO -->

                <div class="fpass-logo">

                    <div class="fpass-logo-icon">
                        ▣
                    </div>

                    <span>Transpo</span>

                </div>


                <!-- TITLE -->

                <h1>Forgot Password?</h1>

                <p class="fpass-description">
                    Enter your email or phone number and we'll send you a link to
                    reset your password.
                </p>


                <!-- EMAIL -->

                <div class="fpass-field">

                    <label for="txtEmail">
                        Email
                    </label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="fpass-input"
                        placeholder="Enter email">
                    </asp:TextBox>

                </div>


                <!-- MESSAGE -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="fpass-message">
                </asp:Label>


                <!-- BUTTON -->

                <asp:Button
                    ID="btnSendReset"
                    runat="server"
                    Text="Send Reset Code"
                    CssClass="fpass-button"
                    OnClick="btnSendReset_Click" />


                <!-- LOGIN -->

                <div class="fpass-login">

                    <span>
                        Remember your password?
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