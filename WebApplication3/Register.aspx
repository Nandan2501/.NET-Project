<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs"
    Inherits="WebApplication.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transpo - Create Account</title>

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

        .register-container {
            width: 950px;
            min-height: 595px;
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
                    rgba(0, 55, 125, 0.45),
                    rgba(0, 45, 105, 0.55)
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

            padding: 35px;
        }

        .register-box {
            width: 290px;
        }

        /* ================= BRAND ================= */

        .brand {
            display: flex;
            align-items: center;
            gap: 8px;

            color: #172033;
            font-size: 13px;
            font-weight: bold;

            margin-bottom: 20px;
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

        /* ================= HEADING ================= */

        .welcome {
            font-size: 21px;
            color: #172033;
            font-weight: 700;

            margin-bottom: 6px;
        }

        .description {
            font-size: 10px;
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

            font-size: 10px;
            color: #333;

            outline: none;
        }

        .input-field:focus {
            border-color: #1454bb;
        }

        .password-wrapper {
            position: relative;
        }

        .password-field {
            padding-right: 35px;
        }

        .eye-button {
    position: absolute;
    right: 8px;
    top: 50%;
    transform: translateY(-50%);

    width: 24px;
    height: 24px;

    border: none;
    background: transparent;

    color: #687990;
    cursor: pointer;

    display: flex;
    align-items: center;
    justify-content: center;

    padding: 0;
}

.eye-button:hover {
    color: #1454bb;
}

.eye-icon {
    width: 16px;
    height: 16px;
}

        /* ================= SIGN UP ================= */

        .signup-button {
            width: 100%;
            height: 31px;

            border: none;
            border-radius: 6px;

            background: #1454bb;
            color: white;

            font-size: 10px;
            font-weight: 600;

            cursor: pointer;

            margin-top: 5px;
        }

        .signup-button:hover {
            background: #0d46a3;
        }

        /* ================= MESSAGE ================= */

        .error-message {
            display: block;

            color: #d93025;

            font-size: 9px;

            margin-top: 8px;
            text-align: center;
        }

        .success-message {
            display: block;

            color: #16803c;

            font-size: 9px;

            margin-top: 8px;
            text-align: center;
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

            .register-container {
                width: 100%;
                min-height: 100vh;
            }

            .left-section {
                display: none;
            }

            .right-section {
                width: 100%;
            }

            .register-box {
                width: 300px;
            }
        }

    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="register-container">

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

            <div class="register-box">

                <!-- Brand -->

                <div class="brand">

                    <div class="brand-icon">
                        🚚
                    </div>

                    <span>Transpo</span>

                </div>


                <!-- Heading -->

                <h1 class="welcome">
                    Create Account
                </h1>

                <p class="description">
                    Join Transpo to unlock fast, transparent, and reliable
                    freight solutions.
                </p>


                <!-- Full Name -->

                <div class="form-group">

                    <label class="form-label">
                        Full Name
                    </label>

                    <asp:TextBox
                        ID="txtFullName"
                        runat="server"
                        CssClass="input-field"
                        placeholder="Enter your full name">
                    </asp:TextBox>

                </div>


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
                        placeholder="Enter your email">
                    </asp:TextBox>

                </div>


                <!-- Phone -->

                <div class="form-group">

                    <label class="form-label">
                        Phone Number
                    </label>

                    <asp:TextBox
                        ID="txtPhone"
                        runat="server"
                        CssClass="input-field"
                        TextMode="Phone"
                        placeholder="Enter your phone number">
                    </asp:TextBox>

                </div>

<div class="form-group">

    <label class="form-label">
        Password
    </label>

    <asp:TextBox
        ID="txtPassword"
        runat="server"
        CssClass="input-field"
        TextMode="Password"
        placeholder="Create  password">
    </asp:TextBox>

</div>

<div class="form-group">

    <label class="form-label">
        Confirm Password
    </label>

    <asp:TextBox
        ID="txtConfirmPassword"
        runat="server"
        CssClass="input-field"
        TextMode="Password"
        placeholder="Confirm your password">
    </asp:TextBox>

</div>


                <!-- Sign Up -->

                <asp:Button
                    ID="btnSignUp"
                    runat="server"
                    Text="Sign Up"
                    CssClass="signup-button"
                    OnClick="btnSignUp_Click" />


                <!-- Error -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="error-message">
                </asp:Label>


                <!-- Login -->

                <div class="login-text">

                    Already have an account?

                    <a href="Login.aspx" class="login-link">
                        Login
                    </a>

                </div>

            </div>

        </div>

    </div>

</form>


<script>

    function togglePassword(type) {

        var password;
        
        if (type === "password") {

            password =
                document.getElementById(
                    '<%= txtPassword.ClientID %>'
                );

        }
        else {

            password =
                document.getElementById(
                    '<%= txtConfirmPassword.ClientID %>'
                );

    }

    if (password.type === "password") {

        password.type = "text";

    }
    else {

        password.type = "password";

    }

}

</script>

</body>
</html>