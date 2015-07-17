    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
	<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
    <meta name="author" content="">
    <title>CSC - Healthcare management system |Admin </title>

	<!-- recaptcha google api -->
	<!-- script src="https://www.google.com/recaptcha/api.js" async defer></script-->
<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/agency.css" rel="stylesheet">
  <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=TimesNewRoman' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=TimesNewRoman:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=TimesNewRoman:400,100,300,700' rel='stylesheet' type='text/css'>
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
  
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  
		<script src="scripts/approveDoc.js">
		</script>
		
	</head>
	<body onload="hidewarningdiv()">
	<%
		HttpSession session1=request.getSession(false);
		response.setHeader("Cache-Control","no-cache");
		response.setHeader("Cache-Control","no-store");
		response.setDateHeader("Expires",0);
		response.setHeader("Pragma","no-cache");
	%>
	    <section id="" class="bg-light-gray">
	    <input type="hidden" name="reason" id="reason" value="${param.reason }"/>
        <div class="container">
  <h2>Approve Doctors </h2>
  
    <div class="alert alert-info">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
     The selected Doctor accounts will be approved and a notification mail will be sent to the doctor.
  </div>
  
  <div class="alert alert-info" id="infoalert">
    <a href="#" class="close" data-dismiss="alert" aria-label="close" id="infolink">&times;</a>
     <div id="infotext"></div>
  </div>
  
    <div class="alert alert-warning" id="warningalert">
    <a href="#" class="close" data-dismiss="alert" aria-label="close" id="warninglink">&times;</a>
     <strong>Warning!</strong>Choose at least one Doctor to Approve.
  </div>
  
  <div class="jumbotron">
	<form name="ApproveDoctorForm" action="ApproveDoctorController" method="post" onsubmit="return onsubmitaction()">
	
	
			
			<sql:setDataSource var="requests" url="jdbc:mysql://${initParam['MySQLHost']}/${initParam['MySQLDBName']}" driver="com.mysql.jdbc.Driver" user="${initParam['MySQLUsername']}" password="${initParam['MySQLPassword']}" />
			<sql:query dataSource="${requests}" var="result2" >	
				select count(*) as count from doctor where status is null;
			</sql:query>
			<c:forEach var="res2" items="${result2.rows}">
				<c:set value="${res2.count }" var="maxcount"/>
			</c:forEach>
			
			<sql:query dataSource="${requests}" var="result" >	
				select * from doctor where status is null ORDER BY name DESC LIMIT ${param.from},5;
			</sql:query>
			<c:choose>
			<c:when test="${maxcount eq 0}">
			There is no pending Doctor account that needs to be verified and activated.
			</c:when>
			<c:otherwise>
				<table id="feedbacktbl" class="table table-hover">
			<th>Name</th>
			<th>Email</th>
			<th>MCID</th>
			<th>Approve/Reject</th>
				<c:forEach var="res1" items="${result.rows}">
					<tr>
						<td>${res1.name }</td>
						<td>${res1.email }</td>
						<td>${res1.mcid }</td>
						<td><input type="checkbox" name="chkbox" value="${res1.mcid }"/></td>
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
							<a href="ApproveDoctor.jsp?from=${0}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
      						</a></li>
							</c:when>
							<c:otherwise>
							<li>
							<a href="ApproveDoctor.jsp?from=${param.from-5}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
      						</a></li>
							</c:otherwise>
							</c:choose>
		<c:set value="0" var="forPage"/>
		<c:set value="1" var="i"/>
			<c:forEach begin="${forPage }" end="${maxcount }" step="5" var="j">
					<c:choose>
					<c:when test="${i*5 eq param.from+5 }">
					<li class=active><a href="ApproveDoctor.jsp?from=${j}">${i}</a></li>
					</c:when>
					<c:otherwise>
					<li><a href="ApproveDoctor.jsp?from=${j}">${i}</a></li>
					</c:otherwise>
					</c:choose>
    					
    					<c:set value="${i+1}" var="i"/>
			</c:forEach>
							<c:choose>
							<c:when test="${param.from+5 gt maxcount}">
							<li class="disabled">
							<a href="ApproveDoctor.jsp?from=${param.from}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
      						</a></li>
							</c:when>
							<c:otherwise>
							<li>
							<a href="ApproveDoctor.jsp?from=${param.from+5}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
      						</a></li>
							</c:otherwise>
							</c:choose>
  					</ul>
				</nav>
				<input type="hidden" id="approvedDoctors" name="approvedDoctors">
				
  <input type="hidden" id="yesorno" />
  <button type="button" class="btn btn-info btn-lg"   onclick="myselected(0)">Approve Selected Doctor Accounts</button><br><br>
  <button type="button" class="btn btn-info btn-lg"   onclick="myselected(1)">Reject Selected Doctor Accounts</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body" id="modalText">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <input type="submit" class="btn btn-default"  value="Confirm"  onclick="setaction(this)">
          <input type="submit" class="btn btn-default" value="Cancel" data-dismiss="modal" onclick="setaction(this)">
        </div>
      </div>
      
    </div>
  </div>
  	</form></div></div></section></body>
</html>
