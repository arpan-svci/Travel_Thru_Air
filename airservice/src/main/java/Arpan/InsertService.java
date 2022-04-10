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

import database.Dao;
import database.Obj;

/**
 * Servlet implementation class InsertService
 */
@WebServlet("/insertservice")
public class InsertService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con=(Connection)this.getServletContext().getAttribute("con");
		Dao d=new Dao(con);
		ArrayList<Obj> a=new ArrayList<Obj>();
		request.setAttribute("flight", a);
		String id=request.getParameter("id");
		String boarding=request.getParameter("boarding");
		String destination=request.getParameter("destination");
		String departure=request.getParameter("departure");
		String arrival=request.getParameter("arrival");
		String fare=request.getParameter("fare");
		try {
			d.addService(id, boarding, destination, departure, arrival, fare);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
