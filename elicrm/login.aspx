<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link href="css/login-box.css" rel="stylesheet" />
   <%-- <link href="css/Master.css" rel="stylesheet" />--%>
</head>
<body>
    <form id="form1" runat="server">
   


<div id="login-box" style="direction:rtl">

<H2>Login Page</H2>

<br />
<br />
<div id="login-box-name1" >:User</div>
<div id="login-box-field1" ><asp:TextBox runat="server" MaxLength="10" ID="txtusername" class="form-login"></asp:TextBox></div>
    

<div id="login-box-name2" > :Password</div>
<div id="login-box-field2" ><asp:TextBox runat="server" ID="txtpassword" MaxLength="10" TextMode="Password" class="form-login"></asp:TextBox></div>
<br />
<br />
<a href="#">
    <asp:ImageButton runat="server" ID="btnlogin" ImageUrl="~/css/images/login-btn.png" style="margin-right:150px;" width="103" height="42" OnClick="btnlogin_Click"/>
</a>
<a href="#">
    <asp:Label style="display:block;color:red;font-size:14px" runat="server" ID="lblresult"></asp:Label>
</a>






</div>
    </form>
</body>
</html>
