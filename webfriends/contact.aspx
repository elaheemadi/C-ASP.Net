<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="webfriends.contact2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head><title>

      </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" /> 
    <link rel="stylesheet" type="text/css" href="css/contact2.css" />   
</head>

    <body>
<div class="container">
	<div class="map">
		<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d13249.247068040606!2d-79.376439762674117!3d43.672112491114!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1spt-BR!2sbr!4v1468899355787" width="100%" height="650px" frameborder="0" style="border:0" allowfullscreen></iframe>
	</div>
	<div class="contact-form">
		<h1 class="title">Contact Us</h1>
		<h2 class="subtitle">We are here assist you.</h2>
		<form runat="server">




		  <asp:TextBox ID="contactName" runat="server" placeholder="Your Name"></asp:TextBox>
          <asp:TextBox ID="contactEmail" runat="server" placeholder="Your Email"></asp:TextBox>
          <asp:TextBox ID="contactSubject" runat="server" placeholder="Your Subject"></asp:TextBox>
          <asp:TextBox ID="contactMessage" runat="server" placeholder="Your Message" TextMode="MultiLine" Rows="5"></asp:TextBox>

          <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="~/images/send.jpg" OnClick="ImageButton1_Click" style="margin-right:150px;" width="103" height="42" />
            
		  
		</form>
          
	</div>
</div>
     </body>
</html>
