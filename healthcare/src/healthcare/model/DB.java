package healthcare.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContext;
/**
 * Servlet implementation class DB
 */
public abstract class DB  {
	
	public static Connection getDatabaseConnection(ServletContext context) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String MySQLUsername = context.getInitParameter("MySQLUsername");
		String MySQLPassword = context.getInitParameter("MySQLPassword");
		String MySQLDBName = context.getInitParameter("MySQLDBName");
		String MySQLHost = context.getInitParameter("MySQLHost");
		return DriverManager.getConnection("jdbc:mysql://"+MySQLHost+"/"+MySQLDBName,MySQLUsername,MySQLPassword);
	}

}
