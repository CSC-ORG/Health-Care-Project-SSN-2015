package notify.email;
import healthcare.model.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import notify.email.Misc;
@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
	private String host;
	private String port;
	private String user;
	private String pass;
	Connection con;
	Statement stmt;
	ResultSet rs;
	String resultMessage = "";
	
	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}
	static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	static Random rnd = new Random();

	String randomString( int len ) 
	{
	   StringBuilder sb = new StringBuilder( len );
	   for( int i = 0; i < len; i++ ) 
	      sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
	   return sb.toString();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// reads form fields

		try{
			boolean result=false;
			String sql="";
			con=DB.getDatabaseConnection(getServletContext());
			ServletContext context=getServletContext();
			String httpHost=context.getInitParameter("httpHost");
			stmt = con.createStatement();
			if(request.getParameter("reason").equals("signup")||request.getParameter("reason").equals("hsignup")||request.getParameter("reason").equals("dsignup")){
				String s="",tblname="",profile="";
				if(request.getParameter("reason").equals("signup")){
					s="s";
					tblname="patient";
					profile="profile";
				}
				else if(request.getParameter("reason").equals("hsignup")){
					s="hs";
					tblname="hospital";
					profile="hprofile";
				}
				
				sql = "select email from "+tblname+" where email = '"+request.getParameter(s+"email")+"';";
				rs = stmt.executeQuery(sql);
				 result = false;
				while(rs.next()){
						result = true;
				}	
				if(!result){	
					
					String trimpwd = request.getParameter(s+"pwd");
					trimpwd = trimpwd.replaceAll("\\s", "");
					trimpwd=Misc.Encrypt(trimpwd);
					sql = "insert into "+tblname+" (name,email,password) values ('"+request.getParameter(s+"name")+"','"+request.getParameter(s+"email")+"','"+trimpwd+"')";
					stmt.execute(sql);			
					sql = "select * from "+tblname+" where email='"+request.getParameter(s+"email")+"'";
					rs=stmt.executeQuery(sql);
					int id=0;
					String recipient = request.getParameter(s+"email");
					String subject = "Healthcare account verification required";
					while(rs.next()){
						id=rs.getInt("id");
					}	
					if(!tblname.equals("patient")){
					sql = "insert into "+profile+" (id,country,state,city,area,address) values ("+id+",'','','','','')";
					stmt.execute(sql);			
					}
					
					String sendemail=request.getParameter(s+"email");
					String content = "";
					content = "Hello!<br>Your account has been created.<br><br>Your ID is: "+ id+" <br> Kindly verify your email ID by clicking the following link whereby your account will be activated!<br><br>Healthy You!<br><a href='http://"+httpHost+"/healthcare/index.jsp?"+s+"email="+sendemail+"&reason=activate'>Activate My Account</a>"
							+"<br><br>If it wasn't you who created the account with us, please <a href='http://"+httpHost+"/healthcare/index.jsp?"+s+"email="+sendemail+"&reason=unsubscribe'>Unsubscribe And Delete Account.</a>";						
					EmailUtility.sendEmail(host, port, user, pass, recipient, subject,content,"no");
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?reason=signup");
					rd.forward(request, response);
				}
				else{
					RequestDispatcher rd;
					rd = request.getRequestDispatcher("/index.jsp?reason=norecreate");
					rd.forward(request, response);
				}
			}
			else if(request.getParameter("reason").equals("pforgotpwd")||request.getParameter("reason").equals("hforgotpwd")){
				String tblname = "";
				if(request.getParameter("reason").equals("pforgotpwd"))
					tblname = "patient";
				else if(request.getParameter("reason").equals("hforgotpwd"))
					tblname = "hospital";
				sql = "select email from "+tblname+" where email = '"+request.getParameter("femail")+"' and status is not null;";
				rs = stmt.executeQuery(sql);
				result = false;
				while(rs.next()){
					result = true;
				}
				if(!result){
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?reason=noaccount");
					rd.forward(request, response);
				}
				else{
				String newpwd = randomString(8);
				String newpwdencrypted=Misc.Encrypt(newpwd);
				sql = "update "+tblname+" set password = '"+newpwdencrypted+"' where email = '"+request.getParameter("femail")+"';";
				stmt.execute(sql);			
				String recipient = request.getParameter("femail");
				String subject = "Healthcare account new Password ";
				String content = "Hello!<br>We have successfully reset your password. You can change your password anytime. Your new password : "+newpwd+"<br><br>Healthy You!<br>http://"+httpHost+"/healthcare/index.jsp";
				
				EmailUtility.sendEmail(host, port, user, pass, recipient, subject,content,"no");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?reason=reset");
				rd.forward(request, response);
				}
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "There were an error: " + ex;
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?reason=unknown");
			rd.forward(request, response);
		} 
	}
}