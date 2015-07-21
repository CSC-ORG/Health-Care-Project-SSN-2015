package healthcare.controller;

import healthcare.bean.User;
import healthcare.model.DB;
import healthcare.model.FileUpload;

import java.io.IOException;
import java.io.InputStream;
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

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class AddHistory
 */
@WebServlet("/AddHistory")
public class AddHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddHistory() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	    response.setContentType("text/html");
        boolean isMultiPart=ServletFileUpload.isMultipartContent(request);
        HttpSession session=request.getSession();
        if(isMultiPart)
        {
            ServletFileUpload upload=new ServletFileUpload();
            String pid="",summary="";
           try
           {
                FileItemIterator itr=upload.getItemIterator(request);
              while(itr.hasNext())
                {
                    FileItemStream item=itr.next();
                    if(!item.isFormField())
                    {
                        String path=getServletContext().getInitParameter("file-upload");
                        session.setAttribute("path", path);
                        User u=(User)session.getAttribute("doctoratt");
                        Connection con=DB.getDatabaseConnection(getServletContext());
                        Statement stmt=con.createStatement();
                        String sql2="select max(histid) h from hist";
                        ResultSet rs =stmt.executeQuery(sql2);
                        int nextid=0;
                        while(rs.next()){
                        	nextid=rs.getInt("h")+1;
                        }
                        String name=Integer.toString(nextid)+"_"+item.getName();
                        if(FileUpload.processFile(path, item,Integer.toString(nextid)))
                        {
                                String sql1="insert into hist (mcid,pid,summary,filename,date) values('"+u.id+"',"+pid+",'"+summary+"','"+name+"',curdate());";
                                stmt.executeUpdate(sql1);
                                stmt.close();
                                con.close();
                        }
                        else{
                            System.out.println("File Upload failed.");
                            RequestDispatcher rd=request.getRequestDispatcher("/doctorHome.jsp?reason=failure");
                            rd.forward(request,response);
                        }
                    }
                    else
                    {
                    	String fieldName=item.getFieldName();
                        InputStream is=item.openStream();
                        byte[] b=new byte[is.available()];
                        is.read(b);
                        String value=new String(b);
                        if(fieldName.equals("pid"))
                            pid=value;
                        if(fieldName.equals("summary"))
                            summary=value;
                        
                    }
                
                }
              RequestDispatcher rd=request.getRequestDispatcher("/doctorHome.jsp");
              rd.forward(request,response);
            }
            catch(FileUploadException | ClassNotFoundException | SQLException fue)
            {
                //fue.printStackTrace();
            	RequestDispatcher rd=request.getRequestDispatcher("/index.jsp?reason=unknown");
                rd.forward(request,response);
                response.getWriter().print("<p>"+fue.getMessage()+"</p>");
            }
        }
	}

}
