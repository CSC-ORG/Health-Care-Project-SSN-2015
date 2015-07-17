package healthcare.controller;

import healthcare.model.DB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ApproveDoctorController
 */
@WebServlet("/ApproveDoctorController")
public class ApproveDoctorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApproveDoctorController() {
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
			Connection con=DB.getDatabaseConnection(getServletContext());
			Statement stmt = con.createStatement();
			String s=request.getParameter("approvedDoctors");
		if(s!=null)
			for(String strID: s.split(" ")){
				String sql="update doctor set status='active' where mcid='"+strID+"';";
				stmt.execute(sql);
				String sql1="insert into docprofile (mcid) values ('"+strID+"');";
				stmt.execute(sql1);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher rd=request.getRequestDispatcher("/ApproveDoctor.jsp?from=0&reason=unknown");
			rd.forward(request, response);
		}
		RequestDispatcher rd=request.getRequestDispatcher("/ApproveDoctor.jsp?from=0&reason=success");
		rd.forward(request, response);
	}

}
