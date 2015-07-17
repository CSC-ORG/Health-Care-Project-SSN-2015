    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
	<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>CSC - Healthcare management system |Admin </title>

	<!-- recaptcha google api -->
	<!-- script src="https://www.google.com/recaptcha/api.js" async defer></script-->
	
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=TimesNewRoman' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=TimesNewRoman:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=TimesNewRoman:400,50,300,700' rel='stylesheet' type='text/css'>
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
   			width: 50%;
   			
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
	<body>
	<%
		HttpSession session1=request.getSession(false);
		response.setHeader("Cache-Control","no-cache");
		response.setHeader("Cache-Control","no-store");
		response.setDateHeader("Expires",0);
		response.setHeader("Pragma","no-cache");
	%>
	    <section id="portfolio" class="bg-light-gray">
        <div class="container">
  <h2>View and Update Schedule </h2>
  
  <div class="jumbotron">
	
		<table id="feedbacktbl" class="table table-hover table-condensed">
			
			<sql:setDataSource var="requests" url="jdbc:mysql://${initParam['MySQLHost']}/${initParam['MySQLDBName']}" driver="com.mysql.jdbc.Driver" user="${initParam['MySQLUsername']}" password="${initParam['MySQLPassword']}" />
			<sql:query dataSource="${requests}" var="result2" >	
				select count(*) as count from feedback;
			</sql:query>
			<c:forEach var="res2" items="${result2.rows}">
				<c:set value="${res2.count }" var="maxcount"/>
			</c:forEach>
			
			<sql:query dataSource="${requests}" var="result" >	
				select * from feedback ORDER BY date DESC LIMIT ${param.from},5;
			</sql:query>
			<th>Name</th>
			<th>Email</th>
			<th>Message</th>
			<th>Date</th>
				<c:forEach var="res1" items="${result.rows}">
					<tr>
						<td>${res1.name }</td>
						<td>${res1.email }</td>
						<td>${res1.message }</td>
						<td>${res1.date }</td>
					</tr>
				</c:forEach>  						
		</table>
		<nav>
  					<ul class="pagination">
    					
    					<c:choose>
      						<c:when test="${param.from-5 lt 0}">
							<li class="disabled"><a href="ViewFeedback.jsp?from=${0}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
      						</a></li>
							</c:when>
							<c:otherwise>
							<li>
							<a href="ViewFeedback.jsp?from=${param.from-5}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
      						</a></li>
							</c:otherwise>
							</c:choose>
		<c:set value="0" var="forPage"/>
		<c:set value="1" var="i"/>
			<c:forEach begin="${forPage }" end="${maxcount }" step="5" var="j">
					<c:choose>
					<c:when test="${i*5 eq param.from+5 }">
					<li class=active><a href="ViewFeedback.jsp?from=${j}">${i}</a></li>
					</c:when>
					<c:otherwise>
					<li><a href="ViewFeedback.jsp?from=${j}">${i}</a></li>
					</c:otherwise>
					</c:choose>
    					
    					<c:set value="${i+1}" var="i"/>
			</c:forEach>
							
							<c:choose>
							<c:when test="${param.from+5 gt maxcount}">
							<li class="disabled"><a href="ViewFeedback.jsp?from=${param.from}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
      						</a>
      						</li>
							</c:when>
							<c:otherwise>
							<li>
							<a href="ViewFeedback.jsp?from=${param.from+5}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
      						</a>
      						</li>
							</c:otherwise>
							</c:choose>
  					</ul>
				</nav>
	</div></div>
	</section>		
	</body>
</html>
