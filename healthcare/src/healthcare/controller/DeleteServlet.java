package healthcare.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

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

import healthcare.model.DB;
import healthcare.model.FileDelete;
import healthcare.model.FileUpload;

/**
 *
 * @author K!R@N
 */
public class DeleteServlet extends HttpServlet {
   // private Object pageContext;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	try{
        response.setContentType("text/html");
        HttpSession session=request.getSession();
            
                        String path=getServletContext().getInitParameter("file-upload");
                        session.setAttribute("path", path);
                        FileDelete.processFile(path,request.getParameter("filename"));
                        
                        RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
                        rd.forward(request,response);
            }
            catch(Exception e)
            {
            	RequestDispatcher rd=request.getRequestDispatcher("/index.jsp.jsp?reason=unknown");
                rd.forward(request,response);
                //fue.printStackTrace();
                e.printStackTrace();
            }
       
    }
}


