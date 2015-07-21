    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.sql.*" %>
	<%@ page import="healthcare.model.DB" %>
    <%
     Connection conn=null;
    try {
		conn=DB.getDatabaseConnection(getServletContext());
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    String  s=request.getParameter("val");
    
    PreparedStatement stmt = conn.prepareStatement("select id from hospital where name = ?");
	stmt.setString(1,s);
	ResultSet rs = stmt.executeQuery();
	while(rs.next())
	{
		out.println(rs.getInt(1));
    }
    %>  

