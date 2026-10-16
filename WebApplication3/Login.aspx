<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="WebApplication3.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transpo - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />
    <link href="CSS/style.css" rel="stylesheet" />
    <link href="CSS/Login.css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server" novalidate="novalidate">

    <div class="login-page">

        <!-- LEFT: FULL-HEIGHT PHOTO -->
        <div class="login-left">
            

            <div class="login-global-logo">
                <span class="login-global-icon">▣</span>
                <span>Transpo Global</span>
            </div>
        </div>

        <!-- RIGHT: LOGIN FORM -->
        <div class="login-right">
            <div class="login-container">

                <div class="login-logo">
                    <div class="login-logo-icon">▣</div>
                    <span>Transpo</span>
                </div>

                <h1>Welcome back!</h1>

                <p class="login-description">
                    Log in to manage your transportations, track real-time
                    deliveries, and view details.
                </p>

                <div class="login-field">
                    <label for="txtEmail">Email or Phone</label>
                    <asp:TextBox ID="txtEmail"
                        runat="server"
                        CssClass="login-input"
                        placeholder="Enter email or phone">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfvEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email or phone number is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        CssClass="text-danger small validator-msg mt-1">
                    </asp:RequiredFieldValidator>
                </div>

                <div class="login-field">
                    <label for="txtPassword">Password</label>

                    <div class="password-wrapper">
                        <asp:TextBox ID="txtPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="login-input password-input"
                            placeholder="Enter password">
                        </asp:TextBox>

                        <button type="button"
                            class="password-eye"
                            onclick="togglePassword(event); return false;"
                            aria-label="Show or hide password">●</button>
                    </div>
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

                <div class="forgot-link-container">
                    <a href="FPass.aspx">Forgot Password?</a>
                </div>

                <asp:Label ID="lblMessage"
                    runat="server"
                    CssClass="login-message">
                </asp:Label>

                <asp:Button ID="btnLogin"
                    runat="server"
                    Text="Log In"
                    CssClass="login-button"
                    OnClick="btnLogin_Click" />

                <div class="signup-link">
                    <span>Don't have an account?</span>
                    <a href="Register.aspx">Sign Up</a>
                </div>

            </div>
        </div>

    </div>

    <script>
        function togglePassword(e) {
            if (e) {
                e.preventDefault();
                e.stopPropagation();
            }
            var password = document.getElementById(
                '<%= txtPassword.ClientID %>');
            var eye = document.querySelector('.password-eye');

            if (password.type === "password") {
                password.type = "text";
                eye.classList.add("active");
            } else {
                password.type = "password";
                eye.classList.remove("active");
            }
            return false;
        }
    </script>

</form>
</body>
</html>
