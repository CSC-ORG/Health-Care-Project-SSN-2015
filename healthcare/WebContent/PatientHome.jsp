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
    <title>CSC - Healthcare Management System |Patient Home </title>

	<!-- recaptcha google api -->
	<!-- script src="https://www.google.com/recaptcha/api.js" async defer></script-->
	
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

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
				<script>
		function alertbox(){
    		var r = 0 ;
    		var p1 = document.getElementById("pagereason").value;
    		var message = document.getElementById("mymessage");
    		if(p1 == "appts"){
    			r=1;
    			message.innerHTML="Your appointment was Booked successfully. You will receive a mail once the hospital approves your request.";
    		}
    		if(r==1){
    			message.style.display='block';
    			document.getElementById("msgcontainer").style.display='block';
    			document.getElementById("message").style.display='block';
    			document.getElementById("mymessagelogin").style.display='block';
    			var w=window.open("#message","_self");
    		}
    		else{
    			message.style.display='none';
    			document.getElementById("msgcontainer").style.display='none';
    			document.getElementById("message").style.display='none';
    			document.getElementById("mymessagelogin").style.display='none';
    		}
    	}
		</script>
		<script type="text/javascript" src="scripts/basic.js"></script>
		
		<script type="text/javascript" src="scripts/doc.js"></script>
<script type="text/javascript" src="scripts/BookAppntScript.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  

		
		<script>
  function setname(e1)
  {
	var e=document.getElementById("iframe");
	e.src=e1;
  }
  </script>
</head>

<body id="page-top" class="index" onload="alertbox();hideAlldiv()">

<!-- div id="overlay">
    <div id="progstat"></div>
    <div id="progress"></div>
  </div-->
<%
	HttpSession session1=request.getSession(false);
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
if(null==request.getSession().getAttribute("patientatt"))
{
	RequestDispatcher rd = request.getRequestDispatcher("index.jsp?reason=logout");
	rd.forward(request,response);
}
%>
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
    					<a href="#services1" class="page-scroll" data-hover="dropdown" data-delay="1000" data-close-others="false" style = "background-color: transparent !important; color: white;">Book Appoinments</a>
    					<ul class="dropdown-menu" style="background-color:#080808; opacity: 0.5;">
        					<li><a tabindex="-1" href="#services1" class="mydropdown">Book Appointment</a></li>
    					</ul>
					</li>
               		<li class="dropdown">
    					<a href="#services2" class="page-scroll" data-hover="dropdown" data-delay="1000" data-close-others="false" style = "background-color: transparent !important; color: white;">Medical History</a>
					</li>
					<li class="dropdown">
    					<a href="Logout.jsp" class="page-scroll" data-hover="dropdown" data-delay="1000" data-close-others="false" style = "background-color: transparent !important; color: white;">Logout</a>
					</li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">Welcome ${sessionScope['patientatt'].name}</div>
                <div class="intro-lead-in">Book an Appointmet with our doctors</div>
                <a href="#services1" class="page-scroll btn btn-xl">Book Appointment</a>
                
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


<section  id="services1" class="bg-light-gray">
          <div class="container">
  <h2>Book Appointment </h2>
<form role="form" name="myform" action="BookAppointmentController" method="post" onsubmit="return validateBookAppnt()" >
<div class="form-group">
      <label for="country">*Select Country:</label>
      <SELECT NAME="country" onclick="createRequestObject0()" class="form-control">
<sql:setDataSource var="requests" url="jdbc:mysql://${initParam['MySQLHost']}/${initParam['MySQLDBName']}" driver="com.mysql.jdbc.Driver" user="${initParam['MySQLUsername']}" password="${initParam['MySQLPassword']}"/>
<sql:query dataSource="${requests}" var="result" >	
		select distinct country from hprofile where country is not null; 
</sql:query>
<c:forEach var="row" items="${result.rows}">
 <option value="${row.country}">${row.country}</option>
</c:forEach>
</SELECT>
</div>
<div class="form-group">
<div id="zero_dropdown_code"></div>
</div>
<div class="form-group">
<div id="second_dropdown_code"></div>
</div>
<div class="form-group">
<div id="third_dropdown_code"></div>
</div>
<div class="form-group">
<div id="fourth_dropdown_code"></div>
</div>
<div class="form-group">
<div id="fifth_dropdown_code"></div>
</div>
<div class="form-group">
<div id="sixth_dropdown_code"></div>
</div>
<div class="form-group">
<table id="utbl" class="table table-hover table-condensed">
			<caption>(Select one schedule of doctor to view available dates)</caption>
			<tr id="udayHeader"><th>Session</th><th>Enter Morning Timing</th><th>Enter Evening Timing</th><th>Choose Day and Time</th></tr>
			<tr id="uSun">
				<td   colspan="3" style="font-weight: bold;">Sunday</td>
			</tr>
			<tr id="uSunm" >
				<td>Morning</td>
				<td><div id="uSunmftime"></div></td>
				<td><div id="uSunmttime"></div></td>
				<td><div id="uSunmt"><input type="radio" name="schedule" id="rsunm" value="Sun m"></div></td>
				
			</tr>
			
			<tr id="uSuna">
				<td>Afternoon</td>
				<td><div id="uSunaftime"></div></td>
				<td><div id="uSunattime"></div></td>
				<td><div id="uSunat"><input type="radio" name="schedule" id="rsuna" value="Sun a"></div></td>
			</tr>
			<tr id="uMon">
				<td  colspan="3" style="font-weight: bold;">Monday</td>
				 
			</tr>
			<tr id="uMonm">
				<td>Morning</td>
				<td><div id="uMonmftime"></div></td>
				<td><div id="uMonmttime"></div></td>
				<td><div id="uMonmt"><input type="radio" name="schedule" id="rmonm" value="Mon m"></div></td>
			</tr>
			<tr id="uMona">	
				<td>Afternoon</td>
				<td><div id="uMonaftime"></div></td>
				<td><div id="uMonattime"></div></td>
				<td><div id="uMonmt"><input type="radio" name="schedule" id="rmona" value="Mon a"></div></td>
			</tr>
			<tr id="uTue">
				<td  colspan="3" style="font-weight: bold;">Tuesday</td>
				 
			</tr>
			<tr id="uTuem">
				<td>Morning</td>
				<td><div id="uTuemftime"></div></td>
				<td><div id="uTuemttime"></div></td>
				<td><div id="uTuemt"><input type="radio" name="schedule" id="rtuem" value="Tue m"></div></td>
			</tr>
			<tr id="uTuea">
				<td>Afternoon</td>
				<td><div id="uTueaftime"></div></td>
				<td><div id="uTueattime"></div></td>
				<td><div id="uTuemt"><input type="radio" name="schedule" id="rtuea" value="Tue a"></div></td>
			</tr>
			<tr id="uWed">
				<td  colspan="3" style="font-weight: bold;">Wednesday</td>
			</tr>
			<tr id="uWedm">
				<td>Morning</td>	
				<td><div id="uWedmftime"></div></td>
				<td><div id="uWedmttime"></div></td>
				<td><div id="uWedmt"><input type="radio" name="schedule" id="rwedm" value="Wed m"></div></td>
			</tr>
			<tr id="uWeda">
				<td>Afternoon</td>
				<td><div id="uWedaftime"></div></td>
				<td><div id="uWedattime"></div></td>
				<td><div id="uWedmt"><input type="radio" name="schedule" id="rweda" value="Wed a"></div></td>
			</tr>
			<tr id="uThu">
				<td  colspan="3" style="font-weight: bold;">Thursday</td>
				 
			</tr>
			<tr id="uThum">
				 <td>Morning</td>
				<td><div id="uThumftime"></div></td>
				<td><div id="uThumttime"></div></td>
				<td><div id="uThumt"><input type="radio" name="schedule" id="rthum" value="Thu m"></div></td>
			</tr>
			<tr id="uThua">
				 <td>Afternoon</td>
				<td><div id="uThuaftime"></div></td>
				<td><div id="uThuattime"></div></td>
				<td><div id="uThumt"><input type="radio" name="schedule" id="rthua" value="Thu a"></div></td>
			</tr>
			<tr id="uFri">
				<td  colspan="3" style="font-weight: bold;">Friday</td>
				 
			</tr>	
			<tr id="uFrim">
				 <td>Morning</td>
				<td><div id="uFrimftime"></div></td>
				<td><div id="uFrimttime"></div></td>
				<td><div id="uFirmt"><input type="radio" name="schedule" id="rfrim" value="Fri m"></div></td>
			</tr>
			<tr id="uFria">
				 <td>Afternoon</td>
				<td><div id="uFriaftime"></div></td>
				<td><div id="uFriattime"></div></td>
				<td><div id="uFrimt"><input type="radio" name="schedule" id="rfria" value="Fri m"></div></td>
			</tr>
			<tr id="uSat">
				<td  colspan="3" style="font-weight: bold;">Saturday</td>
				 
			</tr>
			<tr id="uSatm">
				 <td>Morning</td>
				<td><div id="uSatmftime"></div></td>
				<td><div id="uSatmttime"></div></td>
				<td><div id="uSatmt"><input type="radio" name="schedule" id="rsatm" value="Sat m"></div></td>
			</tr>
			<tr id="uSata">
				 <td>Afternoon</td>
				<td><div id="uSataftime"></div></td>
				<td><div id="uSatattime"></div></td>
				<td><div id="uSatmt"><input type="radio" name="schedule" id="rsata" value="Sat a"></div></td>
			</tr>
		</table>
		<div id="viewdatesdiv"><br><br><br><br><br><br><br><br><br><br></div>
		<div id="TwoDates"><br><br><br></div>
		
		</div>
</form></div>
</section>



    <section id="services2" class="bg-light-gray">
        <div class="container">
  <h2>View Medical History</h2>
  <div class="jumbotron">
  	<form role="form" name="hist1">
  		<div class="form-group">
	  		
	  		<sql:setDataSource var="requests" url="jdbc:mysql://${initParam['MySQLHost']}/${initParam['MySQLDBName']}" driver="com.mysql.jdbc.Driver" user="${initParam['MySQLUsername']}" password="${initParam['MySQLPassword']}"/>
<sql:query dataSource="${requests}" var="result" >	
		select p.name name,p.email email,h.summary summary,h.filename filename from patient p join hist h on p.id=h.pid where p.id = ?;
		<sql:param value="${sessionScope['patientatt'].id}"/> 
</sql:query>
		<table class='table table-hover table-condensed'><tr><th>Name</th><th>Email</th><th>Test Prescribed</th><th>Attachment</th></tr>
	
<c:forEach var="row" items="${result.rows}">
		<tr>
		<td>${row.name }</td>
		<td>${row.email }</td>
		<td>${row.summary }</td>
		<td><button type='button' class='btn btn-info btn-lg' onclick="setname('http://localhost:8080/healthcare/${row.filename }')" data-toggle='modal' data-target='#myModal'>${row.filename }</button></td>
		</tr>
</c:forEach>

		</table>
    
  		</div>

  	</form>
  </div>
</div>
    </section>

<form name="modalform">
  <input type="hidden" id="yesorno" />
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
            <!-- 4:3 aspect ratio -->
<div class="embed-responsive embed-responsive-4by3">
  <iframe class="embed-responsive-item" name='iframe' id='iframe'></iframe>
</div>
        </div>
        <div class="modal-footer">
          <input type="submit" class="btn btn-default" value="Cancel" data-dismiss="modal">
        </div>
      </div>
      
    </div>
  </div>
  </form>
    

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
    
</body></html>
