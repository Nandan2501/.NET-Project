<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="VCode.aspx.cs"
    Inherits="WebApplication3.VCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Transpo - Verify Code</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <link href="CSS/style.css"
          rel="stylesheet" />

    <link href="CSS/VCode.css"
          rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

    <div class="vcode-page">


        <!-- =====================================================
             LEFT SIDE
        ====================================================== -->

        <div class="vcode-left">

            <div class="vcode-global-logo">

                <div class="vcode-global-icon">
                    ▣
                </div>

                <span>Transpo Global</span>

            </div>

        </div>


        <!-- =====================================================
             RIGHT SIDE
        ====================================================== -->

        <div class="vcode-right">

            <div class="vcode-container">


                <!-- LOGO -->

                <div class="vcode-logo">

                    <div class="vcode-logo-icon">
                        ▣
                    </div>

                    <span>Transpo</span>

                </div>


                <!-- TITLE -->

                <h1>
                    Verify Code
                </h1>


                <p class="vcode-description">
                    We've sent a 4-digit OTP  to your registered
                    email.
                </p>


                <!-- =================================================
                     OTP INPUTS
                ================================================== -->

                <div class="otp-container">

                    <asp:TextBox
                        ID="txtCode1"
                        runat="server"
                        CssClass="otp-input"
                        MaxLength="1"
                        TextMode="SingleLine"
                        autocomplete="off">
                    </asp:TextBox>

                    <asp:TextBox
                        ID="txtCode2"
                        runat="server"
                        CssClass="otp-input"
                        MaxLength="1"
                        TextMode="SingleLine"
                        autocomplete="off">
                    </asp:TextBox>

                    <asp:TextBox
                        ID="txtCode3"
                        runat="server"
                        CssClass="otp-input"
                        MaxLength="1"
                        TextMode="SingleLine"
                        autocomplete="off">
                    </asp:TextBox>

                    <asp:TextBox
                        ID="txtCode4"
                        runat="server"
                        CssClass="otp-input"
                        MaxLength="1"
                        TextMode="SingleLine"
                        autocomplete="off">
                    </asp:TextBox>

                </div>


                <!-- MESSAGE -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="vcode-message">
                </asp:Label>


                <!-- VERIFY BUTTON -->

                <asp:Button
                    ID="btnVerify"
                    runat="server"
                    Text="Verify &amp; Continue"
                    CssClass="vcode-button"
                    OnClick="btnVerify_Click" />


                <!-- RESEND -->

                <div class="vcode-resend">

                    <span>
                        Didn't receive OTP?
                    </span>

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


    <!-- =========================================================
         OTP JAVASCRIPT
    ========================================================== -->

    <script>

        document.addEventListener("DOMContentLoaded", function () {

            const inputs = document.querySelectorAll(".otp-input");

            inputs.forEach(function (input, index) {

                input.addEventListener("input", function () {

                    this.value = this.value.replace(/[^0-9]/g, "");

                    if (this.value.length === 1 && index < inputs.length - 1) {
                        inputs[index + 1].focus();
                    }

                });


                input.addEventListener("keydown", function (event) {

                    if (
                        event.key === "Backspace" &&
                        this.value === "" &&
                        index > 0
                    ) {
                        inputs[index - 1].focus();
                    }

                });


                input.addEventListener("paste", function (event) {

                    event.preventDefault();

                    const pastedData =
                        event.clipboardData
                            .getData("text")
                            .replace(/[^0-9]/g, "")
                            .substring(0, 4);

                    for (let i = 0; i < pastedData.length; i++) {

                        if (inputs[i]) {
                            inputs[i].value = pastedData[i];
                        }

                    }

                    if (pastedData.length > 0) {

                        const focusIndex =
                            Math.min(
                                pastedData.length,
                                inputs.length - 1
                            );

                        inputs[focusIndex].focus();

                    }

                });

            });

        });

    </script>

</form>

</body>

</html>