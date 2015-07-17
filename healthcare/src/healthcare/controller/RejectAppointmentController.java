package healthcare.controller;

import healthcare.model.DB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notify.email.EmailUtility;

/**
 * Servlet implementation class RejectAppointmentController
 */
@WebServlet("/RejectAppointmentController")
public class RejectAppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RejectAppointmentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Connection con=DB.getDatabaseConnection(getServletContext());
			Statement stmt = con.createStatement();
			String s=request.getParameter("approvedAppointment");
			String sql="";
		if(s!=null)
			for(String strID: s.split(" ")){
				sql="select a.aid aid,a.pid pid,dc.id id,dc.mcid mcid,a.date date,dc.session session,dc.fromTime fromTime,dc.toTime toTime from doctime dc join appointments a on dc.id=a.id and dc.mcid=a.mcid and dc.session=a.session and dc.day=a.day where a.aid='"+strID+"';";
				ResultSet rs=stmt.executeQuery(sql);
				String pname="",hname="",dname="",pemail="";
				
				String date="",day="",session="",fromTime="",toTime="",did="";
				int pid=0,hid=0,aid=0;
				while(rs.next()){
					aid=rs.getInt("aid");
					pid=rs.getInt("pid");
					hid=rs.getInt("id");
					did=rs.getString("mcid");
					date=rs.getString("date");
					session=rs.getString("session");
					fromTime=rs.getString("fromTime");
					toTime=rs.getString("toTime");
				}
				
				sql="select name,email from patient where id="+pid+";";
				ResultSet rs1=stmt.executeQuery(sql);
				while(rs1.next()){
					pname=rs1.getString("name");
					pemail=rs1.getString("email");
				}
				sql="select name from hospital where id="+hid+";";
				ResultSet rs2=stmt.executeQuery(sql);
				while(rs2.next()){
					hname=rs2.getString("name");
				}
				sql="select name from doctor where mcid='"+did+"';";
				ResultSet rs3=stmt.executeQuery(sql);
				while(rs3.next()){
					dname=rs3.getString("name");
				}

			String recipient = pemail;
			String content = "";
			String subject = "Appointment Rejection";
			content = "Hello "+pname+"!<br>Your Appointment Request has been rejected by the Hospital.<br><br>Your appointment details is as follows:<br><table border='0'><tr><td>Appointment ID:</td><td>"+aid+"</td></tr>"
					+ "<tr><td>Hospital Name:</td><td>"+hname+"</td></tr><tr><td>Doctor Name:</td><td>"+dname+"</td></tr><tr><td>Date:</td><td>"+date+"</td></tr><tr><td>Session:</td><td>"+session+"</td></tr><tr><td>From Time:</td><td>"+fromTime+"</td></tr><tr><td>To Time:</td><td>"+toTime+"</td></tr></table><br>Kindly reshedule.";						
			EmailUtility.sendEmail(host, port, user, pass, recipient, subject,content,"no");
			sql="delete from appointments where aid="+Integer.parseInt(strID)+";";
			stmt.execute(sql);
			
			
			}
		RequestDispatcher rd=request.getRequestDispatcher("/home.jsp?from=0&reason1=success");
		rd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher rd=request.getRequestDispatcher("/home.jsp?from=0&reason1=failure");
			rd.forward(request, response);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			RequestDispatcher rd=request.getRequestDispatcher("/home.jsp?from=0&reason1=failure");
			rd.forward(request, response);
			
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			RequestDispatcher rd=request.getRequestDispatcher("/home.jsp?from=0&reason1=failure");
			rd.forward(request, response);
			
			e.printStackTrace();
		}
		
	}

}
