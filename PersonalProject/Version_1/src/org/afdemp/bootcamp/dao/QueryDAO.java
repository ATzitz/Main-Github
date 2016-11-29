package org.afdemp.bootcamp.dao;


import java.sql.*;
import java.util.List;
import java.util.ArrayList;


import org.afdemp.bootcamp.domain.QueryCat;




public class QueryDAO extends QueryCat  {


	public QueryDAO() {}

	private Connection con = null;

	public void open() throws SQLException {
		try {
			// dynamically load the driver's class file into memory
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {

			throw new SQLException("MySQL Driver error: " + e.getMessage());
		}

		try {
			// establish a connection with the database and creates a Connection
			// object (con)
			con = DriverManager.getConnection("jdbc:mysql://localhost/bookcamp", "root", "alex1408");
		} catch (Exception e) {
			con = null;
			// throw SQLException if a database access error occurs
			throw new SQLException("Could not establish connection with the Database Server: " + e.getMessage());
		}

	} // End of open

	public void close() throws SQLException {
		try {
			// if connection is open
			if (con != null)
				con.close(); // close the connection to the database to end database session			

		} catch (Exception e3) {

			throw new SQLException("Could not close connection with the Database Server: " + e3.getMessage());
		}

	}// end of close

	public List<QueryCat> getQuery(String searchby, String keyword, String rating) throws Exception {

		try {

			if(con == null) {
				throw new Exception("You must open a connection first");
			}

			String sqlquery;


			sqlquery = ("SELECT book.image,book.title,book.category,author.surname,author.name,round(avg(rating.rating)),book.publication_year,book.description,book.book_id from book " +
					"inner join author on author.author_id=book.author_id " +
					"left join rating on rating.book_id=book.book_id " +
					"where "+searchby+" LIKE '%"+ keyword +"%' " + rating+
					" group by book.title;");

			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();

			List<QueryCat> querycatList = new ArrayList<QueryCat>();

			while(rs.next()) {

				querycatList.add( new QueryCat(rs.getString("book.image"), rs.getString("book.title"), rs.getString("book.category"), rs.getString("author.surname"), rs.getString("author.name"), rs.getString("round(avg(rating.rating))"),rs.getString("book.publication_year"),rs.getString("description"),rs.getString("book.book_id")));

			}


			return querycatList;

		} catch (Exception e) {

			throw new Exception("An error occured while getting students from database: " + e.getMessage());
		}

	}

	public void addwishlist(int userid, int bookid) throws SQLException {


		try {

			if(con == null) {
				throw new Exception("You must open a connection first");
			}



			String sqlinsert;


			sqlinsert = ("INSERT INTO bookcamp.wishlist (user_id,book_id) Values (?,?);");


			PreparedStatement stmt1 = con.prepareStatement(sqlinsert);
			stmt1.setInt(1, userid);
			stmt1.setInt(2, bookid);

			stmt1.executeUpdate();

		} catch (Exception e) { }


	}

	public void remfromwish(int userid, int bookid) throws SQLException {


		try {

			if(con == null) {
				throw new Exception("You must open a connection first");
			}



			String sqldel;


			sqldel = ("DELETE FROM bookcamp.wishlist WHERE user_id=? and book_id=?;");



			PreparedStatement stmt1 = con.prepareStatement(sqldel);
			stmt1.setInt(1, userid);
			stmt1.setInt(2, bookid);

			stmt1.executeUpdate();

		} catch (Exception e) { }


	}

	public List<QueryCat> getcategories() throws Exception {

		try {

			if(con == null) {
				throw new Exception("You must open a connection first");
			}

			String sqlquery;


			sqlquery = ("SELECT DISTINCT book.category FROM book;");

			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();

			List<QueryCat> catlist = new ArrayList<QueryCat>();

			while(rs.next()) {

				catlist.add( new QueryCat(rs.getString("book.category")));

			}


			return catlist;

		} catch (Exception e) {

			throw new Exception("An error occured while getting students from database: " + e.getMessage());
		}

	}//End of getStudents



}
