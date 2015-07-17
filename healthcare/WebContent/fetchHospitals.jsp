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
    PreparedStatement stmt = conn.prepareStatement("select name from hospital where id in (select distinct hp.id from hprofile hp where area=?)");
	stmt.setString(1,s);
	ResultSet rs = stmt.executeQuery();
	out.println("<label for='hos'>*Select Hospital:</label><select name='hospitalname' onClick='createRequestObject3();hideAlldiv()' class='form-control'>");
	while(rs.next())
	{
		out.println("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
	}
	out.println("</select>");
	
    %>  
