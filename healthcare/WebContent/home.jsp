<!DOCTYPE html>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="healthcare.model.DB" %>
<%@ page import="healthcare.bean.User" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CSC - Healthcare management system |Hospital Home</title>

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
				<script src="scripts/approveAppt.js"></script>
				<script>
				var request;  

				function getlistofDoc()  
				{ 
					var w = document.viewappt.dname.value;
					var url="FetchDocFromHospital.jsp?id=" + w;
				  
				if(window.XMLHttpRequest){  
				request=new XMLHttpRequest();  
				}  
				else if(window.ActiveXObject){  
				request=new ActiveXObject("Microsoft.XMLHTTP");  
				}  

				try  
				{  
				request.onreadystatechange=getInfoDoc;  
				request.open("GET",url,true);  
				request.send();  
				}  
				catch(e)  
				{  
				alert("Unable to connect to server");  
				}  
				}



				function getInfoDoc(){  
				if(request.readyState==4){  
				var val=request.responseText;  
				document.getElementById("appt").innerHTML = val;  
				}  
				}
				</script>

</head>

<body id="page-top" class="index" onload="alertbox();hidewarningdiv();">
<%
	HttpSession session1=request.getSession(false);
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
if(null==request.getSession().getAttribute("hospitalatt"))
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
                <a class="navbar-brand page-scroll" href="#page-top">csc project</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right" >
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="dropdown">
    					<a href="#services" class="page-scroll" data-hover="dropdown" data-delay="1000" data-close-others="false" style = "background-color: transparent !important; color: white;">Appointments</a>
    					<ul class="dropdown-menu" style="background-color:#080808; opacity: 0.5;">
        					<li><a tabindex="-1" href="#services" class="mydropdown page-scroll">Requests</a></li>
        					<li><a tabindex="-1" href="#services1" class="mydropdown page-scroll">View</a></li>
    					</ul>
					</li>
               		<li class="dropdown">
    					<a href="#services2" class="page-scroll" data-hover="dropdown" data-delay="1000" data-close-others="false" style = "background-color: transparent !important; color: white;">Update</a>
    					<ul class="dropdown-menu" style="background-color:#080808; opacity: 0.5;">
        					<li><a tabindex="-1" href="#services2" class="mydropdown page-scroll">Profile</a></li>
    					</ul>
					</li>
               		<li class="dropdown">
    					<a href="#dportfolio" class="page-scroll" data-hover="dropdown" data-delay="1000" data-close-others="false" style = "background-color: transparent !important; color: white;">Doctor</a>
    					<ul class="dropdown-menu" style="background-color:#080808; opacity: 0.5;">
        					<li><a tabindex="-1" href="#dportfolio" class="mydropdown page-scroll">Login</a></li>   
        					<li><a tabindex="-1" href="#dportfolio1" class="mydropdown page-scroll">Create</a></li>   
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
                <div class="intro-lead-in">Welcome ${sessionScope['hospitalatt'].name}! </div>
                <div><a href="#services2" class="page-scroll btn btn-xl">Update Profile</a></div><br>
                <div><a href="#services" class="page-scroll btn btn-xl">View Requests</a></div>
            </div>
        </div>
    </header>
    
<section  id="message">
   <div class="container" id="msgcontainer">
   <h2>Message</h2>
  	<div class="jumbotron" id="mymessage" ></div>
  	<a id="mymessagelogin"></a>	
  </div>
</section>
  
    <section id="services" class="bg-light-gray">
	    <input type="hidden" name="reason" id="reason" value="${param.reason1 }"/>
        <div class="container">
  <h2>Approve Appointments </h2>
  
    <div class="alert alert-info">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
     The selected Appointments will be approved and a notification mail will be sent to the patient.
  </div>
  
  <div class="alert alert-info" id="infoalert">
    <a href="#" class="close" data-dismiss="alert" aria-label="close" id="infolink">&times;</a>
     <div id="infotext"></div>
  </div>
  
    <div class="alert alert-warning" id="warningalert">
    <a href="#" class="close" data-dismiss="alert" aria-label="close" id="warninglink">&times;</a>
     <strong>Warning!</strong>Choose at least one Appointment to Approve.
  </div>
  
  <div class="jumbotron">
	<form role="form" name="ApproveAppointmentForm" action="ApproveAppointmentController" method="post" onsubmit="sendurl()">		
			<sql:setDataSource var="requests" url="jdbc:mysql://${initParam['MySQLHost']}/${initParam['MySQLDBName']}" driver="com.mysql.jdbc.Driver" user="${initParam['MySQLUsername']}" password="${initParam['MySQLPassword']}" />
			<sql:query dataSource="${requests}" var="result2" >	
				select count(*) as count from appointments where status is null;
			</sql:query>
			<c:forEach var="res2" items="${result2.rows}">
				<c:set value="${res2.count }" var="maxcount"/>
			</c:forEach>
			
			<sql:query dataSource="${requests}" var="result" >	
				select p3.hname,p3.dname,a.aid,date,session,day from (select p1.hname hname,p1.haid aid ,p2.dname from (select h.name as hname,a.aid as haid from appointments a join hospital h on a.id=h.id) p1 join (select d.name as dname,a1.aid as daid from appointments a1 join doctor d on a1.mcid=d.mcid) p2 on p1.haid=p2.daid) p3,appointments a where p3.aid=a.aid and a.id=? and a.status is null limit ${param.from},5;
				<sql:param value="${sessionScope['hospitalatt'].id}"/> 
			</sql:query>
			<c:choose>
			<c:when test="${maxcount eq 0}">
			There is no pending Appointment requests.
			</c:when>
			<c:otherwise>
			<table id="feedbacktbl" class="table table-hover">
			<tr><th>Doctor's Name</th>
			<th>Hospital's Name</th>
			<th>Session</th>
			<th>Date</th>
			<th>Day</th>
			<th>Approve/Reject</th>
			</tr>
				<c:forEach var="res1" items="${result.rows}">
					<tr>
						<td>${res1.dname }</td>
						<td>${res1.hname }</td>
						<td>${res1.session }</td>
						<td>${res1.date }</td>
						<td>${res1.day }</td>
						<td><input type="checkbox" name="chkbox" value="${res1.aid }"/></td>
					</tr>
				</c:forEach>  						
		</table>
		</c:otherwise>
		</c:choose>
		
		<nav>
  					<ul class="pagination">
    					<c:choose>
      						<c:when test="${param.from-5 lt 0}">
      						<li class="disabled">
							<a href="home.jsp?from=${0}#services" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
      						</a></li>
							</c:when>
							<c:otherwise>
							<li>
							<a href="home.jsp?from=${param.from-5}#services" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
      						</a></li>
							</c:otherwise>
							</c:choose>
		<c:set value="0" var="forPage"/>
		<c:set value="1" var="i"/>
			<c:forEach begin="${forPage }" end="${maxcount }" step="5" var="j">
					<c:choose>
					<c:when test="${i*5 eq param.from+5 }">
					<li class=active><a href="home.jsp?from=${j}#services">${i}</a></li>
					</c:when>
					<c:otherwise>
					<li><a href="home.jsp?from=${j}#services">${i}</a></li>
					</c:otherwise>
					</c:choose>
    					
    					<c:set value="${i+1}" var="i"/>
			</c:forEach>
							<c:choose>
							<c:when test="${param.from+5 gt maxcount}">
							<li class="disabled">
							<a href="home.jsp?from=${param.from}#services" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
      						</a></li>
							</c:when>
							<c:otherwise>
							<li>
							<a href="home.jsp?from=${param.from+5}#services" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
      						</a></li>
							</c:otherwise>
							</c:choose>
  					</ul>
				</nav>
				<input type="hidden" id="approvedAppointment" name="approvedAppointment">

  <input type="submit" class="btn btn-info btn-lg" value="Approve Selected Appointment Requests" onclick="onsubmitaction();"><br>
  <input type="submit" class="btn btn-info btn-lg" value="Reject Selected Appointment Requests" onclick="onsubmitaction1();">
  	</form></div></div></section>
<section id="services1">
<div class="container">
<h2>View Appointment List for Doctors </h2>
<div class="jumbotron">
<form name="viewappt" role="form">
<div class="form-group">
<label for="docname">*Select Doctor name to view appointments:</label>
<select id="doctornames" name="dname"  onchange="getlistofDoc()" class=" form-control" required>
						<sql:setDataSource var="requests" url="jdbc:mysql://${initParam['MySQLHost']}/${initParam['MySQLDBName']}" driver="com.mysql.jdbc.Driver" user="${initParam['MySQLUsername']}" password="${initParam['MySQLPassword']}" />
      					<sql:query dataSource="${requests}" var="result" >	
	         				select name,mcid from doctor where mcid in (select distinct mcid from doctime where id=?);
         				<sql:param value="${sessionScope['hospitalatt'].id}"/>
      					</sql:query>
	   					      					<option></option>
      						<c:forEach var="res1" items="${result.rows}">
      								<option value="${ res1.mcid}" class="form-control" >${ res1.name}</option>
      						</c:forEach>  						
      					</select>
</div>
<div id="appt"></div>
</form>
</div></div></section>
<!-- Services Section -->
    <section id="services2" class="bg-light-gray" style="padding-top: 4em;">
          <div class="container">
  <h2>Update Profile </h2>
  <%
   try{		   
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DB.getDatabaseConnection(getServletContext());
   Statement stmt = con.createStatement();
   HttpSession hs = request.getSession(true);
	User u =(User)hs.getAttribute("hospitalatt");
	String sql = "select * from hospital h join hprofile hp on h.id=hp.id where h.id="+u.id;
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
%>
  <div class="jumbotron">
  <form role="form" action="UpdateHospitalProfile" method="post" onsubmit="return validateForm(this,this.pwd,this.rpwd,'pwdspan')" name="updateprofile">
  <input type="hidden" name="reason" value="hospital"/>
    <div class="form-group">
      <label for="name">*Name</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name" value=<%=rs.getString("name") %> required>
          <span id="pwdspan"></span>
      <label for="pwd">*Password:</label>
      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password" required>
      <label for="pwd">*Re-enter Password:</label>
      <input type="password" class="form-control" id="rpwd" name="rpwd" placeholder="Enter password" required>
    </div>
    <div class="form-group">
      <label for="country">*Country:</label>
      <input type="text" class="form-control" id="country" name="country" placeholder="Enter Country" value="<%=rs.getString("country") %>" required>
      <label for="state">*State:</label>
      <input type="text" class="form-control" id="state" name="state" placeholder="Enter State" value="<%=rs.getString("state") %>" required>
      <label for="city">*City:</label>
      <input type="text" class="form-control" id="city" name="city" placeholder="Enter City" value="<%=rs.getString("city") %>" required>

      <label for="area">*Area:</label>
      <input type="text" class="form-control" id="area" name="area" placeholder="Enter Area" value="<%=rs.getString("area") %>" required>
      <label for="address">*Address:</label>
      <input type="text" class="form-control" id="add" name="add" placeholder="Enter Address" value="<%=rs.getString("address") %>" required>
    </div>
    <input type="submit" class="btn btn-success" value="Update Changes"/>
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
 
 
 
 
 
    <section id="dportfolio" class="bg-light-gray">
        <div class="container">
  <h2>Doctor Login </h2>
  <span id="mydocmessage"></span>
  <div class="jumbotron">
  <form role="form" action="LoginController" method="POST" onsubmit="sendurl()" name="dlogin">
  <input type="hidden" name="reason" value="hdoctor"/>
    <div class="form-group">
      <label for="ID">*Medical Council ID:</label>
      <input type="text" class="form-control" id="dmcid" name="dmcid" placeholder="Enter ID" required>
    </div>
    <div class="form-group">
      <label for="pwd">*Password:</label>
      <input type="password" class="form-control" id="dpwd" name="dpwd" placeholder="Enter password" required>
    </div>
    <input type="submit" class="btn btn-success" value="Login"/>
    <a href="#dportfolio1" class="page-scroll btn btn-danger">Create Doctor Profile</a>
  </form>
  </div>
</div>
    </section>


<!-- Portfolio Grid Section -->
    <section id="dportfolio1" class="bg-light-gray">
            <div class="container">
  <h2>Create Doctor Profile </h2>
  <div class="jumbotron">
  <form role="form" action="createDoctor.jsp" method="post" onsubmit="return validateForm(this,this.dspwd,this.dsrepwd,'dsepwd');" name="dsignup" >
  <input type="hidden" name="reason" value="dsignup"/>
  <span>Enter Doctor's Details:</span>
    <div class="form-group">
      <label for="name">*Name:</label>
      <input type="text" class="form-control" name="dsname"   id="dsname" placeholder="Enter name" required>
    </div>
     <div class="form-group">
      <label for="mcid">*Medical Council ID:</label>
      <input type="text" class="form-control" id="mcid" name="mcid"  placeholder="Enter ID" required>
    </div>
    <div class="form-group">
      <label for="email">*Email:</label>
      <input type="email" class="form-control" id="demail" name="demail"  placeholder="Enter ID" required>
    </div>
    <div class="form-group">
      <span id="dsepwd"></span>
      <label for="pwd">*Password:</label>
      <input type="password" class="form-control" id="dspwd" name="dspwd" placeholder="Enter password" required>
    </div>
    <div class="form-group">
      <label for="pwd">*Re-enter Password:</label>
      <input type="password" class="form-control" id="dsrepwd" name="dsrepwd" placeholder="Enter password" required>
    </div>
    <input type="submit" class="btn btn-success" value="Sign Up"/>
    <a href="#dportfolio" class="page-scroll btn btn-danger">Login</a>
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

    
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/agency.js"></script>

</body>

</html>
