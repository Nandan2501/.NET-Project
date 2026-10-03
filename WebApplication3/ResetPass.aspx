<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ResetPass.aspx.cs"
    Inherits="WebApplication3.ResetPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Reset Password</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <link href="CSS/style.css"
          rel="stylesheet" />

    <link href="CSS/ResetPass.css"
          rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

    <div class="reset-page">

        <!-- LEFT SIDE -->

        <div class="reset-left">

            <div class="reset-global-logo">

                <div class="reset-global-icon">
                    ▣
                </div>

                <span>Transpo Global</span>

            </div>

        </div>


        <!-- RIGHT SIDE -->

        <div class="reset-right">

            <div class="reset-container">


                <!-- LOGO -->

                <div class="reset-logo">

                    <div class="reset-logo-icon">
                        ▣
                    </div>

                    <span>Transpo</span>

                </div>


                <!-- TITLE -->

                <h1>
                    Reset Password
                </h1>


                <p class="reset-description">
                    Set up your new password to regain entry to the transport
                    tracking ecosystem.
                </p>


                <!-- NEW PASSWORD -->

                <div class="reset-field">

                    <label for="txtPassword">
                        New Password
                    </label>

                    <div class="reset-password-wrapper">

                        <asp:TextBox
                            ID="txtPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="reset-input"
                            placeholder="At least 8 characters">
                        </asp:TextBox>

                        <button
                            type="button"
                            class="reset-eye"
                            onclick="togglePassword('password', this)"
                            aria-label="Show password">
                            ●
                        </button>

                    </div>

                </div>


                <!-- CONFIRM PASSWORD -->

                <div class="reset-field">

                    <label for="txtConfirmPassword">
                        Confirm New Password
                    </label>

                    <div class="reset-password-wrapper">

                        <asp:TextBox
                            ID="txtConfirmPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="reset-input"
                            placeholder="Repeat password exactly">
                        </asp:TextBox>

                        <button
                            type="button"
                            class="reset-eye"
                            onclick="togglePassword('confirm', this)"
                            aria-label="Show password">
                            ●
                        </button>

                    </div>

                </div>


                <!-- MESSAGE -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="reset-message">
                </asp:Label>


                <!-- BUTTON -->

                <asp:Button
                    ID="btnUpdatePassword"
                    runat="server"
                    Text="Update Password"
                    CssClass="reset-button"
                    OnClick="btnUpdatePassword_Click" />


                <!-- LOGIN -->

                <div class="reset-login">

                    <span>
                        Decided to stay?
                    </span>

                    <a href="Login.aspx">
                        Back to Login
                    </a>

                </div>

            </div>

        </div>

    </div>


    <script>

        function togglePassword(type, button) {

            var input;

            if (type === "password") {

                input = document.getElementById(
                    '<%= txtPassword.ClientID %>'
                );

            } else {

                input = document.getElementById(
                    '<%= txtConfirmPassword.ClientID %>'
                );

    }

    if (input.type === "password") {

        input.type = "text";

        button.classList.add("active");

    } else {

        input.type = "password";

        button.classList.remove("active");

    }
}

</script>

</form>

</body>

</html>