    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="healthcare.model.DB" %>

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
    String s = request.getParameter("id1");
	String s2 = request.getParameter("id2");
	String s3 = request.getParameter("id3");
    PreparedStatement stmt = conn.prepareStatement("select * from doctime where id in(select h.id from hospital h join hprofile hp on h.id=hp.id and hp.area=? where h.id in (select id from hospital where name=?)) and mcid in (select mcid from doctor where name=?)");
    stmt.setString(1,s2);
    stmt.setString(2,s);
    stmt.setString(3,s3);
	ResultSet rs = stmt.executeQuery();
	String str = "";
	while(rs.next())
	{
		str +=rs.getString(3)+"-"+rs.getString(4)+"-"+rs.getString(5)+"-"+rs.getString(6)+";";
    }
	if(!str.equals(""))
	{
	str+="|<input type=button onclick='getSelectedSchedule()' value='Get Available Dates' class='page-scroll btn btn-success'/>";
	}
	out.print((str));
    %>  

