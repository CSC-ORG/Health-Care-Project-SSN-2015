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
    String  s1=request.getParameter("id1");
    String  s2=request.getParameter("id2");
    String  s3=request.getParameter("id3");
    PreparedStatement stmt = conn.prepareStatement("select name from doctor where mcid in(select distinct d.mcid from hospital h, hprofile hp,docprofile d where h.name=? and hp.area=? and d.specialisation=?)");
	stmt.setString(1,s1);
	stmt.setString(2,s2);
	stmt.setString(3,s3);
	ResultSet rs = stmt.executeQuery();
	out.println("<label for='doctor'>*Select Doctor:</label><select name='doctorname' onClick='createRequestObject5();hideAlldiv()' class='form-control'>");
	while(rs.next())
	{
		out.println("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
	}
	out.println("</select>");
	
    %>  
