package healthcare.controller;

import healthcare.bean.User;
import healthcare.model.DB;

import java.io.IOException;
import java.sql.*; 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.lang.Object;

/**
 * Servlet implementation class DoctorSchedule
 */
@WebServlet("/DoctorSchedule")
public class DoctorSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorSchedule() {
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
		RequestDispatcher rd = null;
		try {
			Connection con=DB.getDatabaseConnection(getServletContext());
			Statement stmt = con.createStatement();
			String[][] weekmTime= {
			      { "Sun", request.getParameter("Sunmftime"),request.getParameter("Sunmttime") },
			      { "Mon", request.getParameter("Monmftime"),request.getParameter("Monmttime") },
			      { "Tue", request.getParameter("Tuemftime"),request.getParameter("Tuemttime") },
			      { "Wed", request.getParameter("Wedmftime"),request.getParameter("Wedmttime") },
			      { "Thu", request.getParameter("Thumftime"),request.getParameter("Thumttime") },
			      { "Fri", request.getParameter("Frimftime"),request.getParameter("Frimttime") },
			      { "Sat", request.getParameter("Satmftime"),request.getParameter("Satmttime") }
			      };
		String[][] weekaTime = {
			      { "Sun", request.getParameter("Sunaftime"),request.getParameter("Sunattime") },
			      { "Mon", request.getParameter("Monaftime"),request.getParameter("Monattime") },
			      { "Tue", request.getParameter("Tueaftime"),request.getParameter("Tueattime") },
			      { "Wed", request.getParameter("Wedaftime"),request.getParameter("Wedattime") },
			      { "Thu", request.getParameter("Thuaftime"),request.getParameter("Thuattime") },
			      { "Fri", request.getParameter("Friaftime"),request.getParameter("Friattime") },
			      { "Sat", request.getParameter("Sataftime"),request.getParameter("Satattime") }
			      };
		HttpSession session=request.getSession();
		User u = (User) session.getAttribute("doctoratt");
		
		System.out.println(u.id);
		String sql = "";
		String shid = request.getParameter("hid");
		System.out.println(shid);
		shid = shid.replaceAll("\\s", "");
		
		int hid=Integer.parseInt(shid);
		System.out.println(hid);
		for(int i=0;i<7;i++){
			if(!weekmTime[i][1].equals("")&&!weekmTime[i][2].equals("")){
				System.out.println(u.id);
				System.out.println(hid);
				sql="insert into docTime values('"+u.id+"',"+hid+",'"+weekmTime[i][0]+"','"+weekmTime[i][1]+"','"+weekmTime[i][2]+"','Morning'); ";
				stmt.execute(sql);
			}
			if(!weekaTime[i][1].equals("")&&!weekaTime[i][2].equals("")){
				sql="insert into docTime values('"+u.id+"',"+hid+",'"+weekmTime[i][0]+"','"+weekaTime[i][1]+"','"+weekaTime[i][2]+"','Evening'); ";
				stmt.execute(sql);
			}
		}
		if(request.getParameter("reason").equals("doctor"))
			rd = request.getRequestDispatcher("doctorHome.jsp?reason=detailsadded");
		else
			rd = request.getRequestDispatcher("doctHome.jsp?reason=detailsadded");
		rd.forward(request, response);
		} catch (Exception e) {
		// 	TODO Auto-generated catch block
			System.out.println("here");
			rd = request.getRequestDispatcher("index.jsp?reason=unknown");
			rd.forward(request, response);
		}

		
		
	}
}
