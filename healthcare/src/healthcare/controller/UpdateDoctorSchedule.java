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
import java.lang.Object;

/**
 * Servlet implementation class DoctorSchedule
 */
@WebServlet("/UpdateDoctorSchedule")
public class UpdateDoctorSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDoctorSchedule() {
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

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DB.getDatabaseConnection(getServletContext());
			Statement stmt = con.createStatement();
			String[][] weekmTime= {
			      { "Sun", request.getParameter("uSunmftime"),request.getParameter("uSunmttime") },
			      { "Mon", request.getParameter("uMonmftime"),request.getParameter("uMonmttime") },
			      { "Tue", request.getParameter("uTuemftime"),request.getParameter("uTuemttime") },
			      { "Wed", request.getParameter("uWedmftime"),request.getParameter("uWedmttime") },
			      { "Thu", request.getParameter("uThumftime"),request.getParameter("uThumttime") },
			      { "Fri", request.getParameter("uFrimftime"),request.getParameter("uFrimttime") },
			      { "Sat", request.getParameter("uSatmftime"),request.getParameter("uSatmttime") }
			      };
		String[][] weekaTime = {
			      { "Sun", request.getParameter("uSunaftime"),request.getParameter("uSunattime") },
			      { "Mon", request.getParameter("uMonaftime"),request.getParameter("uMonattime") },
			      { "Tue", request.getParameter("uTueaftime"),request.getParameter("uTueattime") },
			      { "Wed", request.getParameter("uWedaftime"),request.getParameter("uWedattime") },
			      { "Thu", request.getParameter("uThuaftime"),request.getParameter("uThuattime") },
			      { "Fri", request.getParameter("uFriaftime"),request.getParameter("uFriattime") },
			      { "Sat", request.getParameter("uSataftime"),request.getParameter("uSatattime") }
			      };
		User u = (User) request.getSession().getAttribute("doctoratt");
	
		String sql = "";
		String shid = request.getParameter("hid");
		shid = shid.replaceAll("\\s", "");
		int hid=Integer.parseInt(shid);
		for(int i=0;i<7;i++){
			if(!weekmTime[i][1].equals("")&&!weekmTime[i][2].equals("")){
				sql = "update doctime set fromTime='"+weekmTime[i][1]+"',toTime='"+weekmTime[i][2]+"' where mcid='"+u.id+"' and id="+hid+" and day = '"+weekmTime[i][0]+"' and session = 'Morning'";
				stmt.execute(sql);
			}else{
				sql = "delete from doctime where mcid='"+u.id+"' and id="+hid+" and day = '"+weekmTime[i][0]+"' and session = 'Evening'";
				stmt.execute(sql);
			}
			if(!weekaTime[i][1].equals("")&&!weekaTime[i][2].equals("")){
				sql = "update doctime set fromTime='"+weekaTime[i][1]+"',toTime='"+weekaTime[i][2]+"' where mcid='"+u.id+"' and id="+hid+" and day = '"+weekaTime[i][0]+"' and session = 'Evening'";
				stmt.execute(sql);
			}else{
				sql = "delete from doctime where mcid='"+u.id+"' and id="+hid+" and day = '"+weekaTime[i][0]+"' and session = 'Evening'";
				stmt.execute(sql);
			}
		}
		RequestDispatcher rd = null;
		if(request.getParameter("reason").equals("doctor"))
			rd = request.getRequestDispatcher("doctorHome.jsp?reason=successupdate");
		else
			rd = request.getRequestDispatcher("doctHome.jsp?reason=successupdate");
		rd.forward(request, response);

		} catch (Exception e) {
		// 	TODO Auto-generated catch block
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp?reason=unknown");
			rd.forward(request, response);
			e.printStackTrace();
		}
	}
}
