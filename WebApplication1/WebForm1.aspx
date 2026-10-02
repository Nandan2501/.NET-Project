<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calendar Example</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <!-- Calendar -->
            <asp:Calendar ID="Calendar1" runat="server"
                OnSelectionChanged="Calendar1_SelectionChanged">
            </asp:Calendar>

            <br />

            <asp:Label ID="Label1" runat="server" Font-Bold="true"></asp:Label>

            <hr />

          
    </form>
</body>
</html>