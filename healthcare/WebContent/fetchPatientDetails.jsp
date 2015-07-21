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
    String  s=request.getParameter("id");
    PreparedStatement stmt = conn.prepareStatement("select name,email from patient where id = ?");
	stmt.setString(1,s);
	ResultSet rs = stmt.executeQuery();
	boolean b=false;
	while(rs.next())
	{
		b=true;
		out.println("<label for='name'>Patient Name: "+rs.getString(1)+" </label><br>");
		out.println("<label for='email'>Patient Email: "+rs.getString(2)+" </label><br><br>");
		out.println("<label for='summary'>*Test Prescribed</label><textarea rows='5' cols='50' name='summary' id='summary' class='form-control' placeholder='Test Prescribed to patient' required></textarea><br><label for='file'>Attachment</label><input type='file' name='file' class='form-control' class='btn btn-info btn-lg' placeholder='Attachment' required/>");
		out.println("<input type='submit' class='btn btn-success' value='Add Medical History'>");
	}
	if(!b)
	{
		out.println("<label for='state'>Please enter a valid Patient ID</label>");
	}
    %>  
