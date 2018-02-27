<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="webfriends._default" %>

<!DOCTYPE html>
<html class="csstransforms no-csstransforms3d csstransitions"><head runat="server">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title></title>
   	<link rel="stylesheet" type="text/css" href="css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="css/menu.css">
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/function.js"></script>                 
</head>
<body >
   
<div class="img">
    THis page is personal enjoy books and videos
</div>
<div id="wrap">
	<header>
		<div class="inner relative">
			<a><img src="images/logo2.png" class="logo" ></a>
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
				<ul id="main-menu">
					<li class="current-menu-item"><a href="default.aspx">Home</a></li>
					<li class="parent">
						<a href="#">Projects</a>
						<ul class="sub-menu">
							<li><a href="http://crm-app.azurewebsites.net/"><i class="icon-wrench"></i> Crm</a></li>
							
							
							<li>
								<a class="parent" href="#"><i class="icon-file-alt"></i> Books</a>
								<ul class="sub-menu">
										<li><a href="books.aspx">All Books</a></li>
									<li><a href="#">C#</a></li>
									<li><a href="#">Asp.net</a></li>
									
								</ul>
							</li>
                            <li><a href="#"><i class="icon-credit-card"></i> Other projects</a></li>
						</ul>
					</li>
					<li><a href="Videos.aspx">Videos</a></li>
                    <li><a href="#">About</a></li>
					<li><a href="contact.aspx">Contact</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
    <div style="background-image:url(images/image7)" class="auto-style2" >
    </div>
  
</div>    
</body></html>

