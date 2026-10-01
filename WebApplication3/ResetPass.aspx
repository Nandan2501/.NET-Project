<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ResetPassword.aspx.cs"
    Inherits="WebApplication.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Reset Password</title>

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

        /* ================= MAIN ================= */

        .reset-container {
            width: 695px;
            height: 435px;

            display: flex;

            background: white;

            overflow: hidden;
        }


        /* ================= LEFT ================= */

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

            padding: 32px;
        }


        /* ================= COMPANY LOGO ================= */

        .company-logo {
            display: flex;
            align-items: center;

            gap: 7px;

            color: white;

            font-size: 10px;
            font-weight: bold;

            width: fit-content;

            border-bottom: 1px dotted
                rgba(255,255,255,0.5);

            padding-bottom: 3px;
        }


        .logo-icon {
            width: 17px;
            height: 17px;

            background: white;

            border-radius: 3px;

            display: flex;
            align-items: center;
            justify-content: center;

            color: #1454bb;

            font-size: 9px;
        }


        /* ================= RIGHT ================= */

        .right-section {
            width: 52%;

            background: #f8f9fb;

            display: flex;
            align-items: center;
            justify-content: center;
        }


        .reset-box {
            width: 213px;
        }


        /* ================= BRAND ================= */

        .brand {
            display: flex;
            align-items: center;

            gap: 6px;

            color: #172033;

            font-size: 10px;
            font-weight: bold;

            margin-bottom: 18px;
        }


        .brand-icon {
            width: 19px;
            height: 19px;

            background: #1454bb;

            color: white;

            border-radius: 4px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 9px;
        }


        /* ================= HEADING ================= */

        .heading {
            font-size: 15px;

            color: #172033;

            font-weight: 700;

            margin-bottom: 5px;
        }


        .description {
            font-size: 7.5px;

            line-height: 1.5;

            color: #77839a;

            margin-bottom: 17px;
        }


        /* ================= FORM ================= */

        .form-group {
            margin-bottom: 10px;
        }


        .form-label {
            display: block;

            font-size: 8px;

            color: #202a3b;

            font-weight: 600;

            margin-bottom: 5px;
        }


        .input-field {
            width: 100%;

            height: 29px;

            border: 1px solid #dfe4eb;

            border-radius: 6px;

            background: white;

            padding: 0 10px;

            font-size: 8px;

            color: #333;

            outline: none;
        }


        .input-field:focus {
            border-color: #1454bb;
        }


        /* ================= BUTTON ================= */

        .update-button {
            width: 100%;

            height: 25px;

            border: none;

            border-radius: 5px;

            background: #1454bb;

            color: white;

            font-size: 7.5px;

            font-weight: 600;

            cursor: pointer;

            margin-top: 2px;
        }


        .update-button:hover {
            background: #0d46a3;
        }


        /* ================= MESSAGE ================= */

        .message {
            display: block;

            text-align: center;

            font-size: 7.5px;

            margin-top: 7px;

            color: #d93025;
        }


        /* ================= LOGIN ================= */

        .login-text {
            text-align: center;

            margin-top: 15px;

            color: #8792a5;

            font-size: 7.5px;
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

        @media (max-width: 650px) {

            body {
                background: #f8f9fb;
            }

            .reset-container {
                width: 100%;
                height: 100vh;
            }

            .left-section {
                display: none;
            }

            .right-section {
                width: 100%;
            }

            .reset-box {
                width: 280px;
            }

        }

    </style>

</head>


<body>

<form id="form1" runat="server">

    <div class="reset-container">


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

            <div class="reset-box">


                <!-- BRAND -->

                <div class="brand">

                    <div class="brand-icon">
                        🚚
                    </div>

                    <span>Transpo</span>

                </div>


                <!-- HEADING -->

                <h1 class="heading">
                    Reset Password
                </h1>


                <p class="description">
                    Set up your new password to regain entry to the
                    transport tracking ecosystem.
                </p>


                <!-- NEW PASSWORD -->

                <div class="form-group">

                    <label class="form-label">
                        New Password
                    </label>

                    <asp:TextBox
                        ID="txtNewPassword"
                        runat="server"
                        CssClass="input-field"
                        TextMode="Password"
                        placeholder="At least 8 characters">
                    </asp:TextBox>

                </div>


                <!-- CONFIRM PASSWORD -->

                <div class="form-group">

                    <label class="form-label">
                        Confirm New Password
                    </label>

                    <asp:TextBox
                        ID="txtConfirmPassword"
                        runat="server"
                        CssClass="input-field"
                        TextMode="Password"
                        placeholder="Repeat password exactly">
                    </asp:TextBox>

                </div>


                <!-- UPDATE -->

                <asp:Button
                    ID="btnUpdatePassword"
                    runat="server"
                    Text="Update Password"
                    CssClass="update-button"
                    OnClick="btnUpdatePassword_Click" />


                <!-- MESSAGE -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>


                <!-- LOGIN -->

                <div class="login-text">

                    Decided to stay?

                    <a href="Login.aspx" class="login-link">
                        Back to Login
                    </a>

                </div>


            </div>

        </div>

    </div>

</form>

</body>

</html>