package healthcare.controller;

import healthcare.model.DB;

import java.sql.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddFeedback
 */
public class AddFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFeedback() {
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
		String name=request.getParameter("fename");
		String email=request.getParameter("feemail");
		String message=request.getParameter("femessage");
		RequestDispatcher rd;
		try {
			Connection con=DB.getDatabaseConnection(getServletContext());
			Statement stmt = con.createStatement();
			String sql="insert into feedback values('"+name+"','"+email+"','"+message+"',curdate())";
			stmt.execute(sql);
			rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
	
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			rd = request.getRequestDispatcher("/index.jsp?reason=unknown");
			rd.forward(request, response);
			e.printStackTrace();
		}
		
	}

}
