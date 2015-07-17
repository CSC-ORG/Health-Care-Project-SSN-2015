package healthcare.controller;

import healthcare.bean.User;
import healthcare.model.DB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BookAppointmentController
 */
@WebServlet("/BookAppointmentController")
public class BookAppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookAppointmentController() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String hname=request.getParameter("hospitalname");
		String dname=request.getParameter("doctorname");
		String schedule=request.getParameter("schedule");
		String[] s1=schedule.split(" ");
		String session="";
		if(s1[1].equals("m"))
			session="Morning";
		else
			session="Evening";
		String dates=request.getParameter("dates");
		String day=s1[0];
		RequestDispatcher rd;
		try {
			Connection con=DB.getDatabaseConnection(getServletContext());
			Statement stmt = con.createStatement();
			HttpSession s=request.getSession(true);
			User u=(User)s.getAttribute("patientatt");
			String sql="select id from hospital where name='"+hname+"'";
			ResultSet rs=stmt.executeQuery(sql);
			int hid=0;
			String mcid="";
			while(rs.next())
			{
				hid=rs.getInt("id");
			}
			
			String sql1="select mcid from doctor where name='"+dname+"'";
			stmt.execute(sql);
			rs=stmt.executeQuery(sql1);
			while(rs.next())
			{
				mcid=rs.getString("mcid");
			}
			String sql2="insert into appointments(pid,id,mcid,date,day,session) values("+u.id+","+hid+",'"+mcid+"','"+dates+"','"+day+"','"+session+"')";
			stmt.execute(sql2);
			rd = request.getRequestDispatcher("/PatientHome.jsp?reason=appts");
			rd.forward(request, response);
	
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			rd = request.getRequestDispatcher("/index.jsp?reason=unknown");
			rd.forward(request, response);
			e.printStackTrace();
		}
	
		
		
	}

}
