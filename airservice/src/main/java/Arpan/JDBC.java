package Arpan;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class JDBC
 *
 */
@WebListener
public class JDBC implements ServletContextListener {

    /**
     * Default constructor. 
     */
	String url="jdbc:mysql://localhost:3306/IT_ASS";
	String username="root";
	String password="4186";
    public JDBC() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	try {
 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			sce.getServletContext().setAttribute("con",con);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
    }
	
}
