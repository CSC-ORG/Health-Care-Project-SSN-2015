<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="healthcare.model.DB" %>
<%@ page import="notify.email.Misc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con;
	Statement stmt;
	ResultSet rs;
	String resultMessage = "";
	Random rnd = new Random();
		try{
			boolean result=false;
			String sql="";
			con=DB.getDatabaseConnection(getServletContext());
			stmt = con.createStatement();				
			if(!request.getParameter("mcid").equals("")){
				sql = "select mcid from doctor where mcid = '"+request.getParameter("mcid")+"';";
				rs = stmt.executeQuery(sql);
				 result = false;
				while(rs.next()){
						result = true;
				}	
				if(!result){	
					sql = "insert into doctor (name,mcid,password,email) values ('"+request.getParameter("dsname")+"','"+request.getParameter("mcid")+"','"+Misc.Encrypt(request.getParameter("dspwd"))+"','"+request.getParameter("demail")+"')";
					stmt.execute(sql);									
					
					RequestDispatcher rd = request.getRequestDispatcher("/home.jsp?reason=dsignup&from=0");
					rd.forward(request, response);
				}
				else{
					RequestDispatcher rd;
					sql = "select mcid from doctor where mcid = '"+request.getParameter("mcid")+"' and status is null;";
					rs = stmt.executeQuery(sql);
					result = false;
					while(rs.next()){
						result = true;
					}
					if(result)
						rd = request.getRequestDispatcher("/home.jsp?reason=dnotactive&from=0");
					else
						rd = request.getRequestDispatcher("/home.jsp?reason=dnorecreate&from=0");
					rd.forward(request, response);
				}
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?reason=unknown");
			rd.forward(request, response);
		} 

%>
</body>
</html>