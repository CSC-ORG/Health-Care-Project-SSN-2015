<!DOCTYPE html>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="healthcare.model.DB" %>
<%@ page import="notify.email.Misc" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>CSC - Healthcare management system |Home </title>

	<!-- recaptcha google api -->
	<!-- script src="https://www.google.com/recaptcha/api.js" async defer></script-->
	
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=TimesNewRoman' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=TimesNewRoman:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=TimesNewRoman:400,100,300,700' rel='stylesheet' type='text/css'>
    <!-- Progress bar -->
    <link href="css/progressbar.css" rel="stylesheet">
	<style>	
   		ul{
    	font-weight:bold;
	        padding: 0;
        	list-style: none;
        
    	}
    	ul li{
	        width: 170px;
        	display: inline-block;
        	position: relative;
        	text-align: center;
        	line-height: 21px;
    	}
    	ul li ul{
	        display: none;
        	position: absolute;
        	z-index: 999;
        	left: 0;
    	}
    	ul li:hover ul{
	        display: block; /* display the dropdown */
	         z-index: -1;
   			width: 100%;
   			
   			background-color:#080808;
   			opacity: 0.5;
	    }
	    .mydropdown{
	    	color: white !important; 
	    	background-color: transparent !important;
	    }
		</style>   
		<script type="text/javascript" src="scripts/basic.js"></script>
</head>

<body id="page-top" class="index" onload="alertbox()">
<div id="overlay">
    <div id="progstat"></div>
    <div id="progress"></div>
  </div>

<input type="hidden" value="${param.reason }" id="pagereason" name="pagereason"/>
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">CSC project</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right" >
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="dropdown">
    					<a href="#services" class="page-scroll" data-hover="dropdown" data-delay="1000" data-close-others="false" style = "background-color: transparent !important; color: white;">Patient</a>
    					<ul class="dropdown-menu" style="background-color:#080808; opacity: 0.5;">
        					<li><a tabindex="-1" href="#services" class="mydropdown page-scroll">My Account</a></li>
        					<li><a tabindex="-1" href="#services1" class="mydropdown page-scroll">Sign Up</a></li>
    					</ul>
					</li>
               		<li class="dropdown">
    					<a href="#portfolio" class="page-scroll" data-hover="dropdown" data-delay="1000" data-close-others="false" style = "background-color: transparent !important; color: white;">Hospital</a>
    					<ul class="dropdown-menu" style="background-color:#080808; opacity: 0.5;">
        					<li><a tabindex="-1" href="#portfolio" class="mydropdown page-scroll">Login</a></li>
        					<li><a tabindex="-1" href="#portfolio1" class="mydropdown page-scroll">Register</a></li>
    					</ul>
					</li>
               		<li class="dropdown">
    					<a href="#dportfolio" class="page-scroll" data-hover="dropdown" data-delay="1000" data-close-others="false" style = "background-color: transparent !important; color: white;">Doctor</a>
    					<ul class="dropdown-menu" style="background-color:#080808; opacity: 0.5;">
        					<li><a tabindex="-1" href="#dportfolio" class="mydropdown page-scroll">Login</a></li>   
    					</ul>
					</li>
					<li>
                        <a class="page-scroll" href="#contact">Feedback</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">Welcome to Healthcare Management System</div>
                <div class="intro-lead-in">Book an Appointmet with our doctors</div>
                <a href="#services" class="page-scroll btn btn-xl">Book Appointment</a>
                
            </div>
        </div>
    </header>
    
<section  id="message" class="bg-light-gray">
   <div class="container" id="msgcontainer">
   <h2>Message</h2>
  	<div class="jumbotron" id="mymessage" ></div>	
  	<a id="mymessagelogin" ></a>
  </div>
</section>
  
    <!-- Services Section -->
    <section id="services" class="bg-light-gray">
        <div class="container">
  <h2>Login </h2>
  <div class="jumbotron">
  <form role="form" action="LoginController" method="POST" onsubmit="sendurl()" name="login">
  <input type="hidden" name="reason" value="patient"/>
    <div class="form-group">
      <label for="email">*Email:</label>
      <input type="email" class="form-control" id="lemail" name="lemail" placeholder="Enter email" required>
    </div>
    <div class="form-group">
      <label for="pwd">*Password:</label>
      <input type="password" class="form-control" id="lpwd" name="lpwd" placeholder="Enter password" required>
    </div>
    <input type="submit" class="btn btn-success" value="Login"/>
    <a href="#services1" class="page-scroll btn btn-danger">Sign Up</a>
    <a href="#forgotpwd" onclick = "setemail(login.lemail,'pforgotpwd')">Forgot password?</a>
  </form>
  </div>
</div>
    </section>
 
    
<section id="forgotpwd" class="bg-light-gray">
  <div class="container">
  <h2>Forgot Password </h2>
  <div class="jumbotron">
  <form role="form" action="EmailSendingServlet" method="POST" onsubmit="sendurl()" name="forgotpwd">
     <input type="hidden" name="reason" id="reason"/>
     <div class="form-group">
      <label for="email">*Email:</label>
      <input type="email" class="form-control" id="femail" name="femail" placeholder="Enter email" required>
    </div>
    <button type="submit" class="btn btn-success" id="forgotpwdsubmit" >Reset Password</button>
  </form>
  </div>
</div>
</section>
    
    
    
<section id="services1" class="bg-light-gray">
        <div class="container">
  <h2>Sign up </h2>
  <div class="jumbotron">
  <form role="form" action="EmailSendingServlet" method="post" onsubmit="return validateForm(this,this.spwd,this.srepwd,'sepwd');" >
  <input type="hidden" name="reason" value="signup"/>
    <div class="form-group">
      <label for="name">*Name:</label>
      <input type="text" class="form-control" name="sname"  id="sname" placeholder="Enter name" required>
    </div>
     <div class="form-group">
      <label for="email">*Email:</label>
      <input type="email" class="form-control" id="semail" name="semail"  placeholder="Enter email" required>
    </div>
    <div class="form-group">
      <span id="sepwd"></span>
      <label for="pwd">*Password:</label>
      <input type="password" class="form-control" id="spwd" name="spwd"  placeholder="Enter password" required>
    </div>
    <div class="form-group">
      <label for="pwd">*Re-enter Password:</label>
      <input type="password" class="form-control" id="srepwd" name="srepwd"  placeholder="Enter password" required>
    </div>
    <!-- div class="g-recaptcha" data-sitekey="6LekngcTAAAAAOgxku-9pQEfofacmdu-5H431zeQ"></div-->
    <input type="submit" class="btn btn-success" value="Sign Up"/>
    <a href="#services" class="page-scroll btn btn-danger">Login</a>
  </form>
  </div>
</div>
    </section>
    
    
<section id="activate">
   <%
   Enumeration<String> param = request.getParameterNames();
   try{
	   String p1 = param.nextElement();
   if(!p1.isEmpty())
   {
		   
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DB.getDatabaseConnection(getServletContext());
   Statement stmt = con.createStatement();
   String sql="";
   int x=0;
   if(!p1.equals("reason")){
	   if(!request.getParameter("reason").equals("activate"))
	   {
			if(p1.equals("semail"))
				sql = "delete from patient where email = '"+request.getParameter("semail")+"';";
	   		else if(p1.equals("hsemail"))
				sql = "delete from hospital  where email = '"+request.getParameter("hsemail")+"';";
	   }
	   else
	   {
	   		if(p1.equals("semail"))
				sql = "update patient set status='active' where email = '"+request.getParameter("semail")+"';";
	   		else if(p1.equals("hsemail"))
				sql = "update hospital set status='active' where email = '"+request.getParameter("hsemail")+"';";
		}
   stmt.execute(sql);
   }
   }
   }
   catch(Exception e)
   {
   }
   %>
   
    </section>
        <!-- Portfolio Grid Section -->
    <section id="portfolio" class="bg-light-gray">
        <div class="container">
  <h2>Hospital Login </h2>
  <span id="mydocmessage"></span>
  <div class="jumbotron">
  <form role="form" action="LoginController" method="POST" onsubmit="sendurl()" name="hlogin">
  <input type="hidden" name="reason" value="hospital"/>
    <div class="form-group">
      <label for="email">*Email:</label>
      <input type="email" class="form-control" id="hemail" name="hemail" placeholder="Enter email" required>
    </div>
    <div class="form-group">
      <label for="pwd">*Password:</label>
      <input type="password" class="form-control" id="hpwd" name="hpwd" placeholder="Enter password" required>
    </div>
    <input type="submit" class="btn btn-success" value="Login"/>
    <a href="#portfolio1" class="page-scroll btn btn-danger">Register Hospital</a>
    <a href="#forgotpwd" onclick = "setemail(hlogin.hemail,'hforgotpwd')">Forgot password?</a>
  </form>
  </div>
</div>
    </section>



<!-- Portfolio Grid Section -->
    <section id="portfolio1" class="bg-light-gray">
            <div class="container">
  <h2>Register Hospital </h2>
  <div class="jumbotron">
  <form role="form" action="EmailSendingServlet" method="post" onsubmit="return validateForm(this,this.hspwd,this.hsrepwd,'hsepwd');" >
  <input type="hidden" name="reason" value="hsignup"/>
    <div class="form-group">
      <label for="name">*Name:</label>
      <input type="text" class="form-control" name="hsname"   id="hsname" placeholder="Enter name" required>
    </div>
     <div class="form-group">
      <label for="email">*Email:</label>
      <input type="email" class="form-control" id="hsemail" name="hsemail"  placeholder="Enter email" required>
    </div>
    <div class="form-group">
      <span id="hsepwd"></span>
      <label for="pwd">*Password:</label>
      <input type="password" class="form-control" id="hspwd" name="hspwd" placeholder="Enter password" required>
    </div>
    <div class="form-group">
      <label for="pwd">*Re-enter Password:</label>
      <input type="password" class="form-control" id="hsrepwd" name="hsrepwd" placeholder="Enter password" required>
    </div>
    <!-- div class="g-recaptcha" data-sitekey="6LekngcTAAAAAOgxku-9pQEfofacmdu-5H431zeQ"></div-->
    <input type="submit" class="btn btn-success" value="Sign Up"/>
    <a href="#portfolio" class="page-scroll btn btn-danger">Login</a>
  </form>
  </div>
</div>
    </section>

        <!-- Portfolio Grid Section -->
    <section id="dportfolio" class="bg-light-gray">
        <div class="container">
  <h2>Doctor Login </h2>
  <span id="mydocmessage"></span>
  <div class="jumbotron">
  <form role="form" action="LoginController" method="POST" onsubmit="sendurl()" name="dlogin">
  <input type="hidden" name="reason" value="doctor"/>
    <div class="form-group">
      <label for="ID">*Medical Council ID:</label>
      <input type="text" class="form-control" id="dmcid" name="dmcid" placeholder="Enter ID" required>
    </div>
    <div class="form-group">
      <label for="pwd">*Password:</label>
      <input type="password" class="form-control" id="dpwd" name="dpwd" placeholder="Enter password" required>
    </div>
    <input type="submit" class="btn btn-success" value="Login"/>
    <a href="#portfolio1" class="page-scroll btn btn-danger">Create Doctor Profile</a>
  </form>
  </div>
</div>
    </section>


    <!-- Team Section -->
    <!--section id="team" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Developed By</h2>
                 </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <div class="team-member">
                        <img src="img/team/" class="img-responsive img-circle" alt="">
                        <h4>Keerthana Koorapati</h4>
                        <p class="text-muted"></p>
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-twitter"></i></a>
                            &emsp;
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-facebook"></i></a>
                            &emsp;
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="team-member">
                        <img src="img/team/" class="img-responsive img-circle" alt="">
                        <h4>Keerthana Prabhakaran</h4>
                        <p class="text-muted"></p>
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-twitter"></i></a>
                            &emsp;
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-facebook"></i></a>
                            &emsp;
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="team-member">
                        <img src="img/team/" class="img-responsive img-circle" alt="">
                        <h4>Kiran Sudhir</h4>
                        <p class="text-muted"></p>
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-twitter"></i></a>
                            &emsp;
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-facebook"></i></a>
                            &emsp;
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="team-member">
                        <img src="img/team/" class="img-responsive img-circle" alt="">
                        <h4>Mukundram M</h4>
                        <p class="text-muted"></p>
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-twitter"></i></a>
                            &emsp;
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-facebook"></i></a>
                            &emsp;
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div><div class="col-sm-3">
                    <div class="team-member">
                        <img src="img/team/" class="img-responsive img-circle" alt="">
                        <h4>Varghese Paul C</h4>
                        <p class="text-muted"></p>
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-twitter"></i></a>
                            &emsp;
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-facebook"></i></a>
                            &emsp;
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-linkedin"></i></a>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <p class="large text-muted">We are currently doing our 3rd year of computer engineering at SSN College of Engineering . This project
                    was developed for CSC.inc as a part of our internship.</p>
                </div>
            </div>
        </div>
    </section-->

    <!-- Clients Aside -->
    <aside class="clients">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/envato.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/designmodo.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/themeforest.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/creative-market.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
            </div>
        </div>
    </aside>
    
    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Contact Us</h2>
                    <h3 class="section-subheading text-muted">Feel free to send your suggestions</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <form  role="form" action="AddFeedback" method="POST" onsubmit="sendurl()" name="sendfeedback" id="contactForm" novalidate>
                        <div class="row">
                        <input type="hidden" value="feedback" name="reason"/>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Name *" id="fename" name="fename" required data-validation-required-message="Please enter your name.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Your Email *" id="feemail" name="feemail" required data-validation-required-message="Please enter your email address.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Your Message *" id="femessage" name="femessage" required data-validation-required-message="Please enter a message."></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <button type="submit" class="btn btn-xl">Send Message</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <div class="row">
                 <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                    <li><a href="#" >Healthy You!</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-twitter"></i></a>
                            &emsp;
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-facebook"></i></a>
                            &emsp;
                            <a href="#" style="font-size: 3ex;"><i class="fa fa-linkedin"></i></a>
                    
                </div>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>
                        
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <!-- Portfolio Modals -->
    <!-- Use the modals below to showcase details about your portfolio projects! -->

    
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-hover-dropdown.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/agency.js"></script>
    
    
<script src="js/progressbar.js"></script>
    
</body>

</html>
