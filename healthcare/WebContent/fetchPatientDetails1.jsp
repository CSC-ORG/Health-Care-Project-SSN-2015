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
    response.setContentType("text/html");
    String  s=request.getParameter("id");
    PreparedStatement stmt = conn.prepareStatement("select p.name,p.email,h.summary,h.filename from patient p join hist h on p.id=h.pid where p.id = ?");
	stmt.setString(1,s);
	ResultSet rs = stmt.executeQuery();
	boolean b=false;
	while(rs.next())
	{
		if(!b)
		{
			out.println("<table class='table table-hover table-condensed'><tr><th>Name</th><th>Email</th><th>Test Prescribed</th><th>Attachment</th></tr>");
		}
		b=true;
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td><button type='button' class='btn btn-info btn-lg' onclick=\"setname('http://localhost:8080/healthcare/"+rs.getString(4)+"')\" data-toggle='modal' data-target='#myModal'>"+rs.getString(4)+"</button></td>");
		out.println("</tr>");
	}
	if(!b)
	{
		out.println("<label for='state'>Please enter a valid Patient ID</label>");
	}
	else
		out.println("</table>");
    %>  
