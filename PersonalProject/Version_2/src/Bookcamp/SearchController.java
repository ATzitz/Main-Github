package Bookcamp;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		//define RequestDispatcher object to forward if data are correct and successfully stored in database
		RequestDispatcher succdis = getServletContext().getRequestDispatcher("/search.jsp");


		BookDAO qdao = new BookDAO();
		BookDAO catdao = new BookDAO();

		try {
			List<String> categories = catdao.getAllCategories();  	 // Execute query

			request.setAttribute("catdao", categories);			// set attribute to be accessible for jsp
			// System.out.println("cat set");

		} catch (Exception e) {
			response.getWriter().append("ERROR ACCESSING THE DATABASE");  // PRINT ERROR MESSAGE
			e.printStackTrace();
		} 

		try {
			// System.out.println("q before opening ");

			List<Book> qdaojsp = qdao.getQuery(searchby, keyword, rating);  // Execute query
			// System.out.println("q done");

			request.setAttribute("qdao", qdaojsp); 							// set attribute to be accessible for jsp

			succdis.forward(request, response); 			//forward to search page showing resukts
			return;	
			
		} catch (Exception e) {
			response.getWriter().append("ERROR ACCESSING THE DATABASE");  // PRINT ERROR MESSAGE
			e.printStackTrace();
		} 
	}

}