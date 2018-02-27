<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="webfriends.WebForm1" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html class="csstransforms no-csstransforms3d csstransitions"><head runat="server">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title> Video Page</title>
   
    <link rel="stylesheet" type="text/css" href="css/default.css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="css/menu.css">
    <script type="text/javascript" src="Scipts/default.js"></script>
	<script type="text/javascript" src="Scipts/jquery=1.8.3.js"></script>
	<script type="text/javascript" src="js/function.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>

    <style type="text/css">
        .auto-style1 {
            width: 56px;
            height: 62px;
        }
        .auto-style2 {
            height: 209px;
        }
    </style>
      
</head>
<body >
<div style="background:#808080; font-size:26px; text-align:center; color:white; font-weight:bold; height:100px; padding-top:50px;">THis page is personal enjoy books and videos</div>
<div id="wrap">
	<header>
		<div class="inner relative">
			<a class="logo" ><img src="images/logo2.png" class="auto-style1" ></a>
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
				<ul id="main-menu">
					<li class="current-menu-item"><a href="default.aspx">Home</a></li>
					<li class="parent">
						<a href="#">Projects</a>
						<ul class="sub-menu">
							<li><a href="http://crm-app.azurewebsites.net/"><i class="icon-wrench"></i> Crm</a></li>
							<li><a href="#"><i class="icon-credit-card"></i> Other projects</a></li>
							
							<li>
								<a class="parent" href="#"><i class="icon-file-alt"></i> Books</a>
								<ul class="sub-menu">
										<li><a href="books.aspx">Asp.net</a></li>
									<li><a href="#">C#</a></li>
									<li><a href="#">Other books</a></li>
									
								</ul>
							</li>
						</ul>
					</li>
					<li><a href="#">Videos</a></li>
					<li><a href="#">Audios</a></li>
                    <li><a href="#">About</a></li>
					<li><a href="contact.aspx">Contact</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
    <div style="background-image:url(images/image7)" class="auto-style2">
        <div id="container">
            <video id="media" controls="controls">
                <source src="" type='"video/webm";codecs="vorbis,ab8"' />
                <source src="" type='"video/mp4";codecs="vorbis,ab8"' />
                <source src="" type='"video/ogg";codecs="vorbis,ab8"' />
            </video>
        </div>
    </div>
  
</div>    
</body></html>
