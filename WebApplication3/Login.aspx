<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="WebApplication.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transpo - Login</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background: #1f1f1f;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            width: 900px;
            height: 565px;
            display: flex;
            background: white;
            overflow: hidden;
        }

        /* ================= LEFT SIDE ================= */

        .left-section {
            width: 48%;
            position: relative;

            background-image:
                linear-gradient(
                    rgba(0, 55, 125, 0.55),
                    rgba(0, 45, 105, 0.65)
                ),
                url('Images/container-port.png');

            background-size: cover;
            background-position: center;

            padding: 42px;
        }

        .company-logo {
            display: flex;
            align-items: center;
            gap: 9px;

            color: white;
            font-size: 13px;
            font-weight: bold;

            border-bottom: 1px dotted rgba(255,255,255,0.5);
            padding-bottom: 3px;

            width: fit-content;
        }

        .logo-icon {
            width: 20px;
            height: 20px;
            background: white;
            border-radius: 3px;

            display: flex;
            align-items: center;
            justify-content: center;

            color: #1554b8;
            font-size: 11px;
        }

        /* ================= RIGHT SIDE ================= */

        .right-section {
            width: 52%;
            background: #f8f9fb;

            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-box {
            width: 275px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 8px;

            color: #172033;
            font-size: 13px;
            font-weight: bold;

            margin-bottom: 22px;
        }

        .brand-icon {
            width: 23px;
            height: 23px;

            background: #1454bb;
            color: white;

            border-radius: 5px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 12px;
        }

        .welcome {
            font-size: 21px;
            color: #172033;
            font-weight: 700;

            margin-bottom: 7px;
        }

        .description {
            font-size: 10px;
            line-height: 1.6;
            color: #77839a;

            margin-bottom: 28px;
        }

        /* ================= FORM ================= */

        .form-group {
            margin-bottom: 14px;
        }

        .form-label {
            display: block;

            font-size: 9px;
            color: #202a3b;
            font-weight: 600;

            margin-bottom: 6px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-field {
            width: 100%;
            height: 28px;

            border: 1px solid #dfe4eb;
            border-radius: 6px;

            background: white;

            padding: 0 10px;

            font-size: 10px;
            color: #333;

            outline: none;
        }

        .input-field:focus {
            border-color: #1454bb;
        }

        .password-input {
            padding-right: 35px;
        }

        .eye-button {
            position: absolute;

            right: 8px;
            top: 50%;

            transform: translateY(-50%);

            border: none;
            background: transparent;

            cursor: pointer;

            color: #687990;
            font-size: 13px;
        }

        /* ================= FORGOT PASSWORD ================= */

        .forgot-container {
            text-align: right;
            margin-top: 3px;
            margin-bottom: 13px;
        }

        .forgot-link {
            color: #0754bd;
            text-decoration: none;
            font-size: 9px;
        }

        .forgot-link:hover {
            text-decoration: underline;
        }

        /* ================= LOGIN BUTTON ================= */

        .login-button {
            width: 100%;
            height: 29px;

            border: none;
            border-radius: 6px;

            background: #1454bb;
            color: white;

            font-size: 10px;
            font-weight: 600;

            cursor: pointer;
        }

        .login-button:hover {
            background: #0d46a3;
        }

        /* ================= SIGN UP ================= */

        .signup-text {
            text-align: center;

            margin-top: 20px;

            color: #8792a5;
            font-size: 9px;
        }

        .signup-link {
            color: #0754bd;
            text-decoration: none;
            font-weight: 600;
        }

        .signup-link:hover {
            text-decoration: underline;
        }

        /* ================= ERROR ================= */

        .error-message {
            display: block;

            color: #d93025;

            font-size: 9px;

            margin-top: 8px;
            text-align: center;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 750px) {

            body {
                background: #f8f9fb;
            }

            .login-container {
                width: 100%;
                height: 100vh;
            }

            .left-section {
                display: none;
            }

            .right-section {
                width: 100%;
            }

            .login-box {
                width: 300px;
            }
        }

    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="login-container">

        <!-- ================= LEFT ================= -->

        <div class="left-section">

            <div class="company-logo">

                <div class="logo-icon">
                    🚢
                </div>

                Transpo Global

            </div>

        </div>


        <!-- ================= RIGHT ================= -->

        <div class="right-section">

            <div class="login-box">

                <!-- Brand -->

                <div class="brand">

                    <div class="brand-icon">
                        🚢
                    </div>

                    <span>Transpo</span>

                </div>


                <!-- Heading -->

                <h1 class="welcome">
                    Welcome back!
                </h1>

                <p class="description">
                    Log in to manage your transportations, track real-time
                    deliveries, and view details.
                </p>


                <!-- Email -->

                <div class="form-group">

                    <label class="form-label">
                        Email or Phone
                    </label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="input-field"
                        placeholder="driver@transpo.com">
                    </asp:TextBox>

                </div>


                <!-- Password -->

                <div class="form-group">

                    <label class="form-label">
                        Password
                    </label>

                    <div class="input-wrapper">

                        <asp:TextBox
                            ID="txtPassword"
                            runat="server"
                            CssClass="input-field password-input"
                            TextMode="Password"
                            placeholder="••••••••••••">
                        </asp:TextBox>

                        <button
                            type="button"
                            class="eye-button"
                            onclick="togglePassword()">

                            ●

                        </button>

                    </div>

                </div>


                <!-- Forgot Password -->

                <div class="forgot-container">

                    <a href="#" class="forgot-link">
                        Forgot Password?
                    </a>

                </div>


                <!-- Login -->

                <asp:Button
                    ID="btnLogin"
                    runat="server"
                    Text="Log In"
                    CssClass="login-button"
                    OnClick="btnLogin_Click" />


                <!-- Error -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="error-message">
                </asp:Label>


                <!-- Signup -->

                <div class="signup-text">

                    Don't have an account?

                    <a href="Register.aspx" class="signup-link">
                        Sign Up
                    </a>

                </div>

            </div>

        </div>

    </div>

</form>


<script>

    function togglePassword() {

        var password =
            document.getElementById(
                '<%= txtPassword.ClientID %>'
            );

        if (password.type === "password") {

            password.type = "text";

        } else {

            password.type = "password";

        }

    }

</script>

</body>
</html>