package Arpan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import database.Dao;
import database.Obj;

/**
 * Servlet implementation class ABC
 */
@WebServlet("/log")
public class ABC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user_name=request.getParameter("username");
		String password=request.getParameter("password");
		Dao dao=new Dao();
		if(dao.login(user_name, password)) {
			HttpSession session=request.getSession();
			session.setAttribute("user_name",user_name);
			session.setAttribute("password", password);
			Connection con=(Connection)this.getServletContext().getAttribute("con");
			Dao d=new Dao(con);
			ArrayList<Obj> a=new ArrayList<Obj>();
			try {
				a = d.specialDeal();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("flight",a);
			RequestDispatcher rd=request.getRequestDispatcher("user.jsp");
			rd.forward(request, response);
//			response.sendRedirect("user.jsp");
		}
		else {
			response.sendRedirect("login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
