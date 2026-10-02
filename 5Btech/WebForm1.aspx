<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="_5Btech.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            yashrajsinh jadeja
            <asp:Button ID="print_btn" runat="server" Text="yash" BackColor="#CCFFFF" BorderColor="Red" BorderStyle="Solid" Font-Bold="True" ForeColor="#33CCFF" OnClick="print_btn_Click" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="num1"></asp:Label>
            <asp:TextBox ID="num1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="num2"></asp:Label>
            <asp:TextBox ID="num2" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="sum" runat="server" OnClick="sum_Click" Text="sum" />
&nbsp;<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        </p>
    </form>
</body>
</html>
