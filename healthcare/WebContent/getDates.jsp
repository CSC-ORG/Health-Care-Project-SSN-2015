<%@ page import="notify.email.Misc" %>
    <%
    String  s1=request.getParameter("id1");
    String res=Misc.getDates(s1);
    String[] two= res.split(";");
    out.println("<div class='form-group'><table class='table table-hover table-condensed'><tr><td><label for='date'>First Available date:</label></td><td>"+two[0]+"</td><td><input type=radio name=dates value='"+two[0]+"'></td></tr><tr><td><label for='date'>Second Available date:</label></td><td>"+two[1]+"</td><td><input type=radio name=dates value='"+two[1]+"'></td></tr></table></div>");
    out.println("<input type=submit class='page-scroll btn btn-success' value='Book Appointment'/>");
    %>  
