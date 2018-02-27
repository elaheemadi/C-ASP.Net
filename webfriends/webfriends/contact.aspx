﻿
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="webfriends.contact" %>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap Contact Form Template</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="contact/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="contact/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="contact/css/form-elements.css">
        <link rel="stylesheet" href="contact/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="contact/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="contact/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="contact/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="contact/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="contact/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>

		<!-- Top menu -->
		<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
					
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
                    
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="top-navbar-1">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<span class="li-text">
								
							</span> 
							<a href="default.aspx"><strong>Back Home</strong></a> 
							<span class="li-text">
								
							</span> 
							<span class="li-social">
								<a href="#"><i class="fa fa-facebook"></i></a> 
								<a href="#"><i class="fa fa-twitter"></i></a> 
								<a href="#"><i class="fa fa-envelope"></i></a> 
								<a href="#"><i class="fa fa-skype"></i></a>
							</span>
						</li>
					</ul>
				</div>
			</div>
		</nav>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong></strong> Contact Form</h1>
                            <div class="description">
                            	<p>

                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Contact us</h3>
                            		<p>Fill in the form below to send us a message:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-envelope"></i>
                        		</div>
                            </div>
                            <div class="form-bottom contact-form">
			                    <form role="form" action="contact/contact.aspx" runat="server">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="contact-email">Email</label>
			                        	<input type="text" name="email" placeholder="Email..." class="contact-email form-control" id="contact-email">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="contact-subject">Subject</label>
			                        	<input type="text" name="subject" placeholder="Subject..." class="contact-subject form-control" id="contact-subject">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="contact-message">Message</label>
			                        	<textarea name="message" placeholder="Message..." class="contact-message form-control" id="contact-message"></textarea>
			                        </div>
			                        <asp:Button onclick="send" BackColor="MediumBlue" cssClass="btn" Text="Send message" runat="server"></asp:Button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="contact/js/jquery-1.11.1.min.js"></script>
        <script src="contact/bootstrap/js/bootstrap.min.js"></script>
        <script src="contact/js/jquery.backstretch.min.js"></script>
        <script src="contact/js/retina-1.1.0.min.js"></script>
        <script src="contact/js/scripts.js"></script>
        
        

    </body>

</html>