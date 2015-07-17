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
    String s = request.getParameter("val");
	s = s.replaceAll("\\s", "");
	
	String s2 = request.getParameter("mcid");
	s2 = s2.replaceAll("\\s", "");
	
    
    PreparedStatement stmt = conn.prepareStatement("select * from doctime where id= ? and mcid=?");
    stmt.setString(1,s);
    stmt.setString(2,s2);
	ResultSet rs = stmt.executeQuery();
	String str = "";
	while(rs.next())
	{
		str +=rs.getString(3)+"-"+rs.getString(4)+"-"+rs.getString(5)+"-"+rs.getString(6)+";";
    }
	out.print((str));
    %>  

