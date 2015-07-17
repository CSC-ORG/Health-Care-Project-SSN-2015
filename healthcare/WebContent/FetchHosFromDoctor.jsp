<%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.sql.*" %>
<%@ page import="healthcare.model.DB" %>
<%@ page import="healthcare.bean.User" %>
    <%
     Connection conn=null;
    try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DB.getDatabaseConnection(getServletContext());
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    String  s=request.getParameter("id");
    PreparedStatement stmt = conn.prepareStatement("select p3.hname,a.pid,a.aid,date,session,day from (select p1.hname hname,p1.haid aid ,p2.dname from (select h.name as hname,a.aid as haid from appointments a join hospital h on a.id=h.id) p1 join (select d.name as dname,a1.aid as daid from appointments a1 join doctor d on a1.mcid=d.mcid) p2 on p1.haid=p2.daid) p3,appointments a where p3.aid=a.aid and a.id=? and a.mcid=? and a.status is not null");
    HttpSession s2=request.getSession(true);
    User u=(User)s2.getAttribute("doctoratt");
    stmt.setString(2,u.id);
    stmt.setString(1,s);
	ResultSet rs = stmt.executeQuery();
	
	out.println("<table class='table table-hover'><tr><th>Patient ID</th><th>Date</th><th>Session</th><th>Day</th></tr>");	
	while(rs.next())
	{
		out.println("<tr><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td></tr>");
	}
	out.println("</table>");
	
    %>  
