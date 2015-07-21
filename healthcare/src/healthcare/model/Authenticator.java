package healthcare.model;
import javax.servlet.http.HttpServlet;
import notify.email.Misc;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*; 
public class Authenticator extends HttpServlet{
   public String[] authenticate(String email,String password, String tblname,ServletContext context) {
	   password = Misc.Encrypt(password);
      final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
      final String DB_URL="jdbc:mysql://localhost:3306/hcdb";
      // Database credentials
      Connection  conn = null;
      Statement stmt = null;
      // Set response content type
      String title = "Database Result";
      String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
      try
      {
    	  Class.forName(JDBC_DRIVER);
    	  conn=DB.getDatabaseConnection(context);
   	     // Execute SQL query
	     stmt = conn.createStatement(); 
	     String sql;
	     String[] str = {"","",""};
	     if(tblname.equals("doctor"))
	    	 sql = "SELECT mcid FROM doctor where mcid='"+email+"';";
	     else
	    	 sql = "SELECT email FROM "+tblname+" where email='"+email+"';";
	     ResultSet rs1 = stmt.executeQuery(sql);
	     boolean res = false;
	     while(rs1.next()){res=true;}
	     if(res==false){
	     str[0]="noaccount";
	     return str;
	     }
	     if(tblname.equals("doctor")){
				sql = "select mcid from doctor where mcid = '"+email+"' and status is not null;";
			}
			else{
				sql = "select name from "+tblname+" where email = '"+email+"' and status is not null;";
			}
			rs1= stmt.executeQuery(sql);
			res=false;
			while(rs1.next()){
				res=true;
			}
			if(res==false){
				str[0] ="notactive";
				str[1]="";
				str[2]="";
	   	        return str;
			}
	
	     if(tblname.equals("doctor"))
	    	 sql = "SELECT name,mcid,email FROM doctor where mcid='"+email+"' and password='"+password+"';";
	     else
	    	 sql = "SELECT id,name,email FROM "+tblname+" where email='"+email+"' and password='"+password+"';";
	     ResultSet rs = stmt.executeQuery(sql);
	     while(rs.next()){
	    	 if(!tblname.equals("doctor"))
	    		 str[0]=rs.getString("id");
	    	 else
	    		 str[0]=rs.getString("mcid");
				str[1]=rs.getString("name");
				str[2]=rs.getString("email");
						return str;
	     }
	     str[0]="failure";
	     return str;
      }
      catch(Exception e)
      {
         // Handle errors for Class.forName
	     e.printStackTrace();
	     String[] str={"temporary",""};
	     return str;
      }
	
   }
}