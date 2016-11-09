package org.afdemp.bootcamp.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.afdemp.bootcamp.dao.QueryDAO;
import org.afdemp.bootcamp.domain.Query;
import org.afdemp.bootcamp.domain.QueryCat;


@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchController() {
		super();
		}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		//reading parameters from request
		String searchby = request.getParameter("searchby");
		String keyword = request.getParameter("searchfield");
		String rating= request.getParameter("rating");
		///define RequestDispatcher object to forward any errors
		RequestDispatcher errodis = getServletContext().getRequestDispatcher("/error.jsp");

		//define RequestDispatcher object to forward if data are correct and successfully stored in database
		RequestDispatcher succdis = getServletContext().getRequestDispatcher("/search.jsp");


		Query queryobj= new Query(searchby,keyword);
		QueryDAO qdao = new QueryDAO();
		QueryDAO catdao = new QueryDAO();

		try {
			
			catdao.open();					// open connection
			

			List<QueryCat> categories = catdao.getcategories();  	 // Execute query
			
			request.setAttribute("catdao", categories); 							// set attribute to be accessible for jsp

			catdao.close();						// close connection
			
			

			
		} catch (Exception e) {
			response.getWriter().append("ERROR ACCESSING THE DATABASE");  // PRINT ERROR MESSAGE
			errodis.forward(request, response);
			e.printStackTrace();
		} 
		
		

		try {
			qdao.open();					// open connection
			

			List<QueryCat> qdaojsp = qdao.getQuery(searchby, keyword,rating);  	 // Execute query
			request.setAttribute("qdao", qdaojsp); 							// set attribute to be accessible for jsp

			qdao.close();						// close connection
			


			request.setAttribute("queryobj", queryobj);		// forward the search parameters
			succdis.forward(request, response); 			//forward to search page showing resukts

			

			return;	
		} catch (Exception e) {
			response.getWriter().append("ERROR ACCESSING THE DATABASE");  // PRINT ERROR MESSAGE
			errodis.forward(request, response);
			e.printStackTrace();
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String delarg = request.getParameter("delarg");
		
		

		if (delarg==null){

		

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String bookid=request.getParameter("addtowish");
		String bookimage=request.getParameter("addedbookimage");
		
		request.setAttribute("bookadd", bookid);
		request.setAttribute("addedbookimage", bookimage);

		
		String userid= "10"; // WIll be extracted when the log in page is ready( Method to be used is session) 

		QueryDAO indao= new QueryDAO();



		try {


			indao.open();

			int userid_int=Integer.valueOf(userid);
			int bookid_int=Integer.valueOf(bookid);

			indao.addwishlist(userid_int,bookid_int);

			
			indao.close();
			request.getRequestDispatcher("wishadd.jsp").forward(request, response);

		} catch (SQLException AlreadyAdded) {
			// TODO Auto-generated catch block
			AlreadyAdded.printStackTrace();
		}
		

	}
	
	else{

		String userid= "10"; // WIll be extracted when the log in page is ready( Method to be used is session) 
		
		String bookid=request.getParameter("delarg");
		String bookimageremov=request.getParameter("removedbook");

		request.setAttribute("removedbook", bookimageremov);
		QueryDAO outdao= new QueryDAO();
		
		try {


			outdao.open();

			int userid_int=Integer.valueOf(userid);
			int bookid_int=Integer.valueOf(bookid);

			outdao.remfromwish(userid_int,bookid_int);

			

			outdao.close();
			request.getRequestDispatcher("removed.jsp").forward(request, response);

		} catch (SQLException AlreadyAdded) {
			// TODO Auto-generated catch block
			AlreadyAdded.printStackTrace();
		}

		
		
	}

}
}

