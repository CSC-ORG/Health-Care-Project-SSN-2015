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
    String  s=request.getParameter("val");
    if(request.getParameter("val").equals(""))
    	s="";
    String sql="select name from hospital where name like '"+s+"%' order by name asc;";
    PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	String str="";
	while(rs.next())
	{
		str = str + rs.getString(1) + "...";
    }
		out.print(str);
	
    %>  

