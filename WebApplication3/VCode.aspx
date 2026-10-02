<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="VerifyCode.aspx.cs"
    Inherits="WebApplication.VerifyCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Verify Code</title>

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

        .verify-container {
            width: 700px;
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


        /* ================= LOGO ================= */

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


        .verify-box {
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

            margin-bottom: 18px;
        }


        /* ================= OTP ================= */

        .otp-container {
            display: flex;

            justify-content: center;

            gap: 7px;

            margin-bottom: 12px;
        }


        .otp-box {
            width: 31px;
            height: 31px;

            border: 1px solid #dfe4eb;

            border-radius: 5px;

            background: white;

            text-align: center;

            font-size: 13px;

            color: #172033;

            outline: none;
        }


        .otp-box:focus {
            border-color: #1454bb;

            box-shadow: 0 0 0 1px
                rgba(20,84,187,0.1);
        }


        /* ================= BUTTON ================= */

        .verify-button {
            width: 100%;

            height: 25px;

            border: none;

            border-radius: 5px;

            background: #1454bb;

            color: white;

            font-size: 7.5px;

            font-weight: 600;

            cursor: pointer;
        }


        .verify-button:hover {
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


        /* ================= RESEND ================= */

        .resend-text {
            text-align: center;

            margin-top: 14px;

            color: #8792a5;

            font-size: 7.5px;
        }


        .resend-link {
            color: #0754bd;

            text-decoration: none;

            font-weight: 600;

            cursor: pointer;
        }


        .resend-link:hover {
            text-decoration: underline;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 650px) {

            body {
                background: #f8f9fb;
            }

            .verify-container {
                width: 100%;
                height: 100vh;
            }

            .left-section {
                display: none;
            }

            .right-section {
                width: 100%;
            }

            .verify-box {
                width: 280px;
            }

            .otp-box {
                width: 45px;
                height: 45px;

                font-size: 17px;
            }

        }

    </style>

</head>


<body>

<form id="form1" runat="server">

    <div class="verify-container">


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

            <div class="verify-box">


                <!-- BRAND -->

                <div class="brand">

                    <div class="brand-icon">
                        🚚
                    </div>

                    <span>Transpo</span>

                </div>


                <!-- HEADING -->

                <h1 class="heading">
                    Verify Code
                </h1>


                <p class="description">
                    We've transmitted a 4-digit security code to your registered
                    coordinates.
                </p>


                <!-- OTP -->

                <div class="otp-container">

                    <asp:TextBox
                        ID="txtOtp1"
                        runat="server"
                        CssClass="otp-box"
                        MaxLength="1">
                    </asp:TextBox>

                    <asp:TextBox
                        ID="txtOtp2"
                        runat="server"
                        CssClass="otp-box"
                        MaxLength="1">
                    </asp:TextBox>

                    <asp:TextBox
                        ID="txtOtp3"
                        runat="server"
                        CssClass="otp-box"
                        MaxLength="1">
                    </asp:TextBox>

                    <asp:TextBox
                        ID="txtOtp4"
                        runat="server"
                        CssClass="otp-box"
                        MaxLength="1">
                    </asp:TextBox>

                </div>


                <!-- VERIFY -->

                <asp:Button
                    ID="btnVerify"
                    runat="server"
                    Text="Verify & Continue"
                    CssClass="verify-button"
                    OnClick="btnVerify_Click" />


                <!-- MESSAGE -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>


                <!-- RESEND -->

                <div class="resend-text">

                    Didn't receive the credentials?

                    <asp:LinkButton
                        ID="btnResend"
                        runat="server"
                        CssClass="resend-link"
                        OnClick="btnResend_Click">

                        Resend

                    </asp:LinkButton>

                </div>


            </div>

        </div>

    </div>

</form>


<script>

// Automatically move to next OTP box

const otpBoxes =
    document.querySelectorAll(".otp-box");

otpBoxes.forEach((box, index) => {

    box.addEventListener("input", function() {

        if (this.value.length === 1 &&
            index < otpBoxes.length - 1) {

            otpBoxes[index + 1].focus();

        }

    });


    // Backspace moves to previous box

    box.addEventListener("keydown", function(event) {

        if (event.key === "Backspace" &&
            this.value === "" &&
            index > 0) {

            otpBoxes[index - 1].focus();

        }

    });

});

</script>

</body>

</html>