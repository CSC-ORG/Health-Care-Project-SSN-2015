package healthcare.controller;

import healthcare.bean.User;
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
import javax.servlet.http.HttpSession;

import notify.email.Misc;

/**
 * Servlet implementation class UpdateHospitalProfile
 */
@WebServlet("/UpdateHospitalProfile")
public class UpdateHospitalProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHospitalProfile() {
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
		String name=request.getParameter("name");
		String pass=request.getParameter("pwd");
		String repass=request.getParameter("rpwd");
		String country=request.getParameter("country");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String area=request.getParameter("area");
		String add=request.getParameter("add");
		HttpSession hs = request.getSession(true);
		User u =(User)hs.getAttribute("hospitalatt");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		Connection con=DB.getDatabaseConnection(getServletContext());
		Statement stmt = con.createStatement();
		String sql = "update hprofile set country='"+country+"',city='"+city+"',address='"+add+"',state='"+state+"',area='"+area+"' where id="+u.id+"";
		stmt.execute(sql);
		sql = "update hospital set name='"+name+"',password='"+Misc.Encrypt(pass)+"' where id='"+u.id+"'";
		stmt.execute(sql);
		u.name=name;
		request.getSession().setAttribute("hospitalatt",u);
		RequestDispatcher rd = request.getRequestDispatcher("home.jsp?from=0");
		rd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp?reason=unknown");
			rd.forward(request, response);
			e.printStackTrace();
		}
		
	}

}
