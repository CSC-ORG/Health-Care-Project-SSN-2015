<!DOCTYPE html>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="healthcare.model.DB" %>
<%@ page import="healthcare.bean.User" %>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CSC - Healthcare Management System |Hospital |Doctor Home </title>
    
    	
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

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
    
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
	    <link rel="Stylesheet" href="styles/cleanslate.css" />
	    <link rel="Stylesheet" href="styles/jquery.weekLine.css" />	    
	    <script src="scripts/jquery.weekLine.min.js"></script>
		<style>
			.time{
				width: 100px;
			}
		</style>
		<script  src="scripts/doc.js"></script>
		
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link href="./css/prettify-1.0.css" rel="stylesheet">
        <link href="./css/base.css" rel="stylesheet">
        <link href="css/bootstrap-datetimepicker.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
		<script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/d004434a5ff76e7b97c8b07c01f34ca69e635d97/src/js/bootstrap-datetimepicker.js"></script>
	
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

<body id="page-top" class="index" onload="hideAll('u');hideAll('');myfn3(${sessionScope['hospitalatt'].id});myfn4(${sessionScope['hospitalatt'].id})">
<%
if(null==request.getSession().getAttribute("hospitalatt")||null==request.getSession().getAttribute("doctoratt"))
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
    					<a href="#services" class="page-scroll" data-hover="dropdown" data-delay="1000" data-close-others="false" style = "background-color: transparent !important; color: white;"> Appointments</a>
    					<ul class="dropdown-menu" style="background-color:#080808; opacity: 0.5;">
        					<li><a tabindex="-1" href="#services" class="mydropdown page-scroll">View</a></li>
    					</ul>
					</li>
               		<li class="dropdown">
    					<a href="#portfolio0" class="page-scroll" data-hover="dropdown" data-delay="1000" data-close-others="false" style = "background-color: transparent !important; color: white;">Profile</a>
    					<ul class="dropdown-menu" style="background-color:#080808; opacity: 0.5;">
        					<li><a tabindex="-1" href="#portfolio0" class="mydropdown page-scroll">View</a></li>
        				</ul>
        			</li>
        			<li>
        				<a href="#portfolio0" class="page-scroll" data-hover="dropdown" data-delay="1000" data-close-others="false" style = "background-color: transparent !important; color: white;">Schedule</a>
        				<ul class="dropdown-menu" style="background-color:#080808; opacity: 0.5;">
        					<li><a tabindex="-1" href="#portfolio" class="mydropdown page-scroll">View</a></li>
        					<li><a tabindex="-1" href="#portfolio" class="mydropdown page-scroll">Update</a></li>
        					<li><a tabindex="-1" href="#portfolio1" class="mydropdown page-scroll">Add</a></li>
    					</ul>
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
				<div class="intro-lead-in">Welcome ${sessionScope['doctoratt'].name}!</div>
                <div><a href="#portfolio0" class="page-scroll btn btn-xl">Update Profile</a></div><br>
                <div><a href="#services" class="page-scroll btn btn-xl">View Requests</a></div>            </div> 
        </div>
    </header>
    
<section  id="message">
   <div class="container" id="msgcontainer">
   <h2>Error Message</h2>
  	<div class="jumbotron" id="mymessage" ></div>	
  	<a id="mymessagelogin"></a>
  </div>
</section>
  
    <!-- Services Section -->
 
 
 <section id="services" class="bg-light-gray">
<div class="container">
<h2>View Appointment List </h2>
<div class="jumbotron">
<form role="form">
<div class="form-group">
<label for="docname">*Select Doctor name to view appointments:</label>
						<sql:setDataSource var="requests" url="jdbc:mysql://${initParam['MySQLHost']}/${initParam['MySQLDBName']}" driver="com.mysql.jdbc.Driver" user="${initParam['MySQLUsername']}" password="${initParam['MySQLPassword']}" />
      					<sql:query dataSource="${requests}" var="result" >	
	         				select p3.hname,p3.dname,a.aid,date,session,day from (select p1.hname hname,p1.haid aid ,p2.dname from (select h.name as hname,a.aid as haid from appointments a join hospital h on a.id=h.id) p1 join (select d.name as dname,a1.aid as daid from appointments a1 join doctor d on a1.mcid=d.mcid) p2 on p1.haid=p2.daid) p3,appointments a where p3.aid=a.aid and a.id=? and a.mcid=? and a.status is not null
         				<sql:param value="${sessionScope['hospitalatt'].id}"/>
         				<sql:param value="${sessionScope['doctoratt'].id}"/>
      					</sql:query>
      						
      						
      						<table class='table table-hover'><tr><th>Date</th><th>Session</th><th>Day</th></tr>
      						<c:forEach var="res1" items="${result.rows}">
      								<tr><td>${res1.date}</td><td>${res1.session}</td><td>${res1.day}</td></tr>
      						</c:forEach>  						
      					</table>
</div>
<div id="appt"></div>
</form>
</div></div></section>
 
    
     <section id="portfolio0" class="bg-light-gray" style="padding-top: 4em;">
          <div class="container">
  <h2>Update Profile </h2>
  <%
   try{		   
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DB.getDatabaseConnection(getServletContext());
   Statement stmt = con.createStatement();
   HttpSession hs = request.getSession(true);
	User u =(User)hs.getAttribute("doctoratt");
	String sql = "select d.name,dp.specialisation from doctor d join docprofile dp on d.mcid=dp.mcid where d.mcid="+u.id;
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
%>
  <div class="jumbotron">
  <strong>You don't have the privilege to update doctor profile. Kindly Logout as hospital and Login as Doctor.</strong>
  <form role="form">
  <input type="hidden" name="reason" value="hospital"/>
    <div class="form-group">
      <label for="name">Name</label>
      <span class="form-control"><%=rs.getString("name") %></span>
       <label for="address">Specialisation:</label>
      <span class="form-control"><%=rs.getString("specialisation") %></span>
    </div>
  </form>
  </div>
   <%
	}
	stmt.execute(sql);
   }
   catch(Exception e)
   {
   }
   %>
   </div>
    </section>
 
 
 
        <!-- Portfolio Grid Section -->
    <section id="portfolio" class="bg-light-gray">
        <div class="container">
  <h2>View and Update Schedule </h2>
  
  <div class="jumbotron">

	<form action="UpdateDoctorSchedule" method="post" name="schedule" onsubmit="sendurl()">
	<input type="hidden" name="reason" value="hdoctor"/>
	<div style="display: none;">
		<input type="text" name="mcid" id="mcid" value="${sessionScope['doctoratt'].id}"/>
		<input type="text" name="hid" id="hid" value="${sessionScope['hospitalatt'].id}"/>
		<input type="text" name="temp" id="temp" />
	</div>
						<input type="hidden" id="hospitalnames" name="hname" value="${sessionScope['hospitalatt'].name}">
			<table id="utbl" class="table table-hover table-condensed">
			<caption>(leave the field empty is not applicable)</caption>
			<tr id="udayHeader"><th>Session</th><th>Enter Morning Timing</th><th>Enter Evening Timing</th></tr>
			<tr id="uSun">
				<td   colspan="3" style="font-weight: bold;">Sunday</td>
			</tr>
			<tr id="uSunm" >
				<td>Morning</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uSunmftime" id="uSunmftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uSunmttime" id="uSunmttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			
			<tr id="uSuna">
				<td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uSunaftime" id="uSunaftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uSunattime" id="uSunattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="uMon">
				<td  colspan="3" style="font-weight: bold;">Monday</td>
				 
			</tr>
			<tr id="uMonm">
				<td>Morning</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uMonmftime" id="uMonmftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uMonmttime" id="uMonmttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="uMona">	
				<td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uMonaftime" id="uMonaftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uMonattime" id="uMonattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="uTue">
				<td  colspan="3" style="font-weight: bold;">Tuesday</td>
				 
			</tr>
			<tr id="uTuem">
				<td>Morning</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uTuemftime" id="uTuemftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uTuemttime" id="uTuemttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="uTuea">
				<td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uTueaftime" id="uTueaftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uTueattime" id="uTueattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="uWed">
				<td  colspan="3" style="font-weight: bold;">Wednesday</td>
			</tr>
			<tr id="uWedm">
				<td>Morning</td>	
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uWedmftime" id="uWedmftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uWedmttime" id="uWedmttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="uWeda">
				<td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uWedaftime" id="uWedaftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uWedattime" id="uWedattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="uThu">
				<td  colspan="3" style="font-weight: bold;">Thursday</td>
				 
			</tr>
			<tr id="uThum">
				 <td>Morning</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uThumftime" id="uThumftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uThumttime" id="uThumttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="uThua">
				 <td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uThuaftime" id="uThuaftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uThuattime" id="uThuattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="uFri">
				<td  colspan="3" style="font-weight: bold;">Friday</td>
				 
			</tr>	
			<tr id="uFrim">
				 <td>Morning</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uFrimftime" id="uFrimftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uFrimttime" id="uFrimttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="uFria">
				 <td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uFriaftime" id="uFriaftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uFriattime" id="uFriattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="uSat">
				<td  colspan="3" style="font-weight: bold;">Saturday</td>
				 
			</tr>
			<tr id="uSatm">
				 <td>Morning</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uSatmftime" id="uSatmftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uSatmttime" id="uSatmttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="uSata">
				 <td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uSataftime" id="uSataftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="uSatattime" id="uSatattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
		</table>  						
			<input type="submit" value="Update Schedule" class="page-scroll btn btn-success"/>
			<a href="doctHome.jsp#portfolio" class="page-scroll">Discard Changes</a>
  </form>
  </div>
</div>
    </section>



<!-- Portfolio Grid Section -->
    <section id="portfolio1" class="bg-light-gray">
            <div class="container">
  <h2>Add Schedule </h2>
  <div class="jumbotron">

	<form action="DoctorSchedule" method="post" name="detailsaddform" onsubmit="sendurl()">
	<input type="hidden" name="reason" value="hdoctor">
	<div style="display: none;">
  		<span id="selectedDays" ></span>
  		<input type="hidden" name="sdays" id="sdays"/>
  		<input type="hidden" name="hid" id="hid" placeholder="" required/>
  	</div>
<div>
		<input type="hidden" id="hospitalnames" name="hname" value="${sessionScope['hospitalatt'].name}">
		<label for="name">*Select Days of Week</label>
				
				<span id="weekCal2" onclick="newfields()"></span>
				</div>
			<div>
			<table border='1' id="tbl" class="table table-hover table-condensed">
			<caption>(leave the field empty is not applicable)</caption>
			<tr id="dayHeader"><th>Session</th><th>Enter Morning Timing</th><th>Enter Evening Timing</th></tr>
			<tr id="Sun">
				<td   colspan="3" style="font-weight: bold;">Sunday</td>
			</tr>
			<tr id="Sunm" >
				<td>Morning</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Sunmftime" id="Sunmftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Sunmttime" id="Sunmttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="Suna">
				<td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Sunaftime" id="Sunaftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Sunattime" id="Sunattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="Mon">
				<td  colspan="3"  style="font-weight: bold;">Monday</td>
				 
			</tr>
			<tr id="Monm">
				<td>Morning</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Monmftime" id="Monmftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Monmttime" id="Monmttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="Mona">	
				<td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Monaftime" id="Monaftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Monattime" id="Monattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="Tue">
				<td  colspan="3"  style="font-weight: bold;">Tuesday</td>
				 
			</tr>
			<tr id="Tuem">
				<td>Morning</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Tuemftime" id="Tuemftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Tuemttime" id="Tuemttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="Tuea">
				<td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Tueaftime" id="Tueaftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Tueattime" id="Tueattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="Wed">
				<td  colspan="3"  style="font-weight: bold;">Wednesday</td>
			</tr>
			<tr id="Wedm">
				<td>Morning</td>	
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Wedmftime" id="Wedmftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Wedmttime" id="Wedmttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="Weda">
				<td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Wedaftime" id="Wedaftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Wedattime" id="Wedattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="Thu">
				<td  colspan="3"  style="font-weight: bold;">Thursday</td>
				 
			</tr>
			<tr id="Thum">
				 <td>Morning</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Thumftime" id="Thumftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Thumttime" id="Thumttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="Thua">
				 <td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Thuaftime" id="Thuaftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Thuattime" id="Thuattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="Fri">
				<td  colspan="3"  style="font-weight: bold;">Friday</td>
				 
			</tr>	
			<tr id="Frim">
				 <td>Morning</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Frimftime" id="Frimftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Frimttime" id="Frimttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="Fria">
				 <td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Friaftime" id="Friaftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Friattime" id="Friattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="Sat">
				<td  colspan="3"  style="font-weight: bold;">Saturday</td>
				 
			</tr>
			<tr id="Satm">
				 <td>Morning</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Satmftime" id="Satmftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Satmttime" id="Satmttime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
			<tr id="Sata">
				 <td>Afternoon</td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Sataftime" id="Sataftime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
				<td><div class='input-group date' id='datetimepicker3' ><input type="text" name="Satattime" id="Satattime"  class="form-control" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span></div></td>
			</tr>
		</table>  						
     </div>
     <br>
     <input type="submit" value="Add Schedule" class="page-scroll btn btn-success" name="detailsadd" id="detailsadd"/>
		</form>
  
    </div>
</div>
    </section>



    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; CSC Inc </span>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
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
     
      <script>
      $(function () {
          $('.date').datetimepicker({
              format: 'LT'
          });
      });
		     // Return selected days as labels
     		$("#weekCal2").weekLine({
	            mousedownSel: false,
            	onChange: function () {
                    $("#selectedDays").html(
                            $(this).weekLine('getSelected')
                    );
            	}
     		});
    
     </script>
     
</body>

</html>
