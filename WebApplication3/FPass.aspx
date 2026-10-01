<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ForgotPassword.aspx.cs"
    Inherits="WebApplication.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Forgot Password</title>

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

        /* ================= MAIN CONTAINER ================= */

        .forgot-container {
            width: 825px;
            height: 517px;

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
                    rgba(0, 45, 105, 0.65),
                    rgba(0, 45, 105, 0.75)
                ),
                url('Images/container-port.png');

            background-size: cover;
            background-position: center;

            padding: 40px;
        }


        /* ================= COMPANY LOGO ================= */

        .company-logo {
            display: flex;
            align-items: center;

            gap: 8px;

            color: white;

            font-size: 12px;
            font-weight: bold;

            width: fit-content;
        }

        .logo-icon {
            width: 20px;
            height: 20px;

            background: white;

            border-radius: 4px;

            display: flex;
            align-items: center;
            justify-content: center;

            color: #1454bb;

            font-size: 10px;
        }


        /* ================= RIGHT SIDE ================= */

        .right-section {
            width: 52%;

            background: #f8f9fb;

            display: flex;
            align-items: center;
            justify-content: center;
        }


        .forgot-box {
            width: 252px;
        }


        /* ================= BRAND ================= */

        .brand {
            display: flex;
            align-items: center;

            gap: 7px;

            color: #172033;

            font-size: 12px;
            font-weight: bold;

            margin-bottom: 20px;
        }

        .brand-icon {
            width: 22px;
            height: 22px;

            background: #1454bb;

            color: white;

            border-radius: 5px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 11px;
        }


        /* ================= HEADING ================= */

        .welcome {
            font-size: 19px;

            color: #172033;

            font-weight: 700;

            margin-bottom: 6px;
        }


        .description {
            font-size: 9px;

            line-height: 1.5;

            color: #77839a;

            margin-bottom: 20px;
        }


        /* ================= FORM ================= */

        .form-group {
            margin-bottom: 10px;
        }


        .form-label {
            display: block;

            font-size: 9px;

            color: #202a3b;

            font-weight: 600;

            margin-bottom: 5px;
        }


        .input-field {
            width: 100%;

            height: 30px;

            border: 1px solid #dfe4eb;

            border-radius: 6px;

            background: white;

            padding: 0 10px;

            font-size: 9px;

            color: #333;

            outline: none;
        }


        .input-field:focus {
            border-color: #1454bb;
        }


        /* ================= BUTTON ================= */

        .reset-button {
            width: 100%;

            height: 29px;

            border: none;

            border-radius: 6px;

            background: #1454bb;

            color: white;

            font-size: 9px;

            font-weight: 600;

            cursor: pointer;

            margin-top: 2px;
        }


        .reset-button:hover {
            background: #0d46a3;
        }


        /* ================= MESSAGE ================= */

        .message {
            display: block;

            text-align: center;

            font-size: 9px;

            margin-top: 8px;

            color: #d93025;
        }


        /* ================= LOGIN ================= */

        .login-text {
            text-align: center;

            margin-top: 18px;

            color: #8792a5;

            font-size: 9px;
        }


        .login-link {
            color: #0754bd;

            text-decoration: none;

            font-weight: 600;
        }


        .login-link:hover {
            text-decoration: underline;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 750px) {

            body {
                background: #f8f9fb;
            }

            .forgot-container {
                width: 100%;
                height: 100vh;
            }

            .left-section {
                display: none;
            }

            .right-section {
                width: 100%;
            }

            .forgot-box {
                width: 300px;
            }
        }

    </style>

</head>


<body>

<form id="form1" runat="server">

    <div class="forgot-container">


        <!-- ================= LEFT ================= -->

        <div class="left-section">

            <div class="company-logo">

                <div class="logo-icon">
                    🚚
                </div>

                Transpo Global

            </div>

        </div>


        <!-- ================= RIGHT ================= -->

        <div class="right-section">

            <div class="forgot-box">


                <!-- Brand -->

                <div class="brand">

                    <div class="brand-icon">
                        🚚
                    </div>

                    <span>Transpo</span>

                </div>


                <!-- Heading -->

                <h1 class="welcome">
                    Forgot Password?
                </h1>


                <p class="description">
                    Enter your email or phone number and we'll send you a link to
                    reset your password.
                </p>


                <!-- Email -->

                <div class="form-group">

                    <label class="form-label">
                        Email
                    </label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="input-field"
                        TextMode="Email"
                        placeholder="Enter email">
                    </asp:TextBox>

                </div>


                <!-- Button -->

                <asp:Button
                    ID="btnReset"
                    runat="server"
                    Text="Send Reset Code"
                    CssClass="reset-button"
                    OnClick="btnReset_Click" />


                <!-- Message -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>


                <!-- Login -->

                <div class="login-text">

                    Remember your password?

                    <a href="Login.aspx" class="login-link">
                        Login
                    </a>

                </div>


            </div>

        </div>

    </div>

</form>

</body>

</html>