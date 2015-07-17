package healthcare.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import healthcare.bean.User;
import healthcare.model.Authenticator;

public class LoginController extends HttpServlet{
   public LoginController(){
      super();
   }
   public User user;
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	   String s="",tblname = "";
	   if(request.getParameter("reason").equals("patient")){
		   s="l";
		   tblname = "patient";
	   }
	   else if(request.getParameter("reason").equals("hospital")){
		   s="h";
		   tblname = "hospital";
	   }
	   else if(request.getParameter("reason").equals("doctor")||request.getParameter("reason").equals("hdoctor")){
		   s="d";
		   tblname = "doctor";
	   }
	   RequestDispatcher rd = null;
		  Authenticator authenticator = new Authenticator();
		  String password = request.getParameter(s+"pwd");
		  String[] result={"","",""};
		  String email="";
		  if(!tblname.equals("doctor")){
			  email =request.getParameter(s+"email");	
		  }
		  else{
			  email =request.getParameter("dmcid");
		  }
		  result = authenticator.authenticate(email,password,tblname,getServletContext());
	  if(!result[0].equals("failure")&&!result[0].equals("temporary")&&!result[0].equals("notactive")&&!result[0].equals("noaccount")){
		  User u = new User(result[0],result[1],result[2]);
		  if(tblname.equals("patient")){
			  request.getSession().setAttribute("patientatt",u);
		   	  rd = request.getRequestDispatcher("/PatientHome.jsp");
		  }
		  else if(tblname.equals("hospital")){
			  request.getSession().setAttribute("hospitalatt", u);
		   	  rd = request.getRequestDispatcher("/home.jsp?from=0");
		  }
		  else if(request.getParameter("reason").equals("hdoctor")){
			  request.getSession().setAttribute("doctoratt", u);
		   	  rd = request.getRequestDispatcher("/doctHome.jsp");
		  }
		  else if(request.getParameter("reason").equals("doctor")){
			  request.getSession().setAttribute("doctoratt", u);
		   	  rd = request.getRequestDispatcher("/doctorHome.jsp");
		  }
		  
	  user = new User(result[0],result[1],email,password);
	  request.setAttribute("user",user);
	  }
	  else if(request.getParameter("reason").equals("doctor")||request.getParameter("reason").equals("patient")||request.getParameter("reason").equals("hospital")||tblname.equals("hdoctor")){
		  if(result[0].equals("notactive")){
			  rd = request.getRequestDispatcher("index.jsp?reason=notactive");
		  }
		  else if(result[0].equals("noaccount")){
			  rd = request.getRequestDispatcher("index.jsp?reason=noaccount");
		  }else if(result[0].equals("failure")){
			  rd = request.getRequestDispatcher("index.jsp?reason=failure");
		  }
		  else{
			  rd = request.getRequestDispatcher("index.jsp?reason=unknown");
		  }
	  }
	  else{
		  if(result[0].equals("notactive")){
			  rd = request.getRequestDispatcher("home.jsp?reason=dnotactive&from=0");
		  }
		  else if(result[0].equals("noaccount")){
			  rd = request.getRequestDispatcher("home.jsp?reason=noaccount&from=0");
		  }else if(result[0].equals("failure")){
			  rd = request.getRequestDispatcher("home.jsp?reason=failure&from=0");
		  }
		  else{
			  rd = request.getRequestDispatcher("home.jsp?reason=unknown&from=0");
		  }
	  }
	  response.getWriter().println(result[1]);
   rd.forward(request,response);
   }
}
