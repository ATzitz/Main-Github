package Bookcamp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RatingDAO extends SuperDAO {
	
	public RatingDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Rating> getAllRatings() {

		List<Rating> ratinglist = new ArrayList<>();
		
		try {

			this.open();
			
			String sqlquery= "SELECT * FROM rating;";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();
						
			while(rs.next()) {
				
				// Retrieve by column name
				int userId = rs.getInt("user_id");
				int bookId = rs.getInt("book_id");
				int rating = rs.getInt("rating");
				String review = rs.getString("review");
				// fill ratingslist with all ratings in our database
				ratinglist.add(new Rating(userId, bookId, rating, review));
				
			}

			rs.close();
			stmt1.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				this.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ratinglist;
	}//End of getAllRatings
	
	public int totalBookRatings(int bookId) {
		int count = 0;
		try {

			this.open();
			
			String sqlquery= "select count(*) as cnt from rating where book_id = " +bookId +";";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();

			rs.next();
				
				count = rs.getInt("cnt");

			rs.close();
			stmt1.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				this.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count;
	}
	
	public double averageBookRating(int bookId) {

		double avg = 0;
		
		try {

			this.open();
			
			String sqlquery= "SELECT avg(rating) as average FROM rating WHERE book_id = " +bookId +";";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();

			rs.next();
				
			avg = rs.getDouble("average");

			rs.close();
			stmt1.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				this.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return avg;
	}
	
	public List<Integer> getBookRatings(int bookId) {

		List<Integer> usersWhoRatedIt = new ArrayList<>();
		
		try {

			this.open();
			
			String sqlquery= "SELECT user_id FROM rating WHERE book_id = " +bookId +";";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();
						
			while(rs.next()) {
				
				int userId = rs.getInt("user_id");
				// Fill usersWhoRatedIt list with the ids of users who have rated this book
				usersWhoRatedIt.add(userId);
				
			}

			rs.close();
			stmt1.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				this.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return usersWhoRatedIt;
	}
	
	public void printAllRatings() {
		try {
			for (Rating rating : this.getAllRatings()) {
				System.out.println(rating.toString());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void addRating(int userId, int bookId, int rating, String review) {

		try {

			this.open();
			
			String sqlquery= "INSERT INTO rating (user_id, book_id, rating, review)" + "VALUES (?, ?, ?, ?)";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			
			// insert values to above query
			stmt1.setInt(1, userId);
			stmt1.setInt(2, bookId);
			stmt1.setInt(3, rating);
			stmt1.setString(4, review);
			
			stmt1.executeUpdate();

			stmt1.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				this.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void updateRating(int userId, int bookId, int rating, String review) {

		try {

			this.open();
			
			String sqlquery= "UPDATE rating SET rating=" +rating +" , review='" +review +"' WHERE user_id=" +userId +" AND book_id=" +bookId +";";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			
			stmt1.executeUpdate();

			stmt1.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				this.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void deleteRating(int userId, int bookId) {

		try {

			this.open();
			
			String sqlquery= "DELETE FROM rating WHERE book_id =" +bookId +" AND user_id =" +userId +";";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			
			stmt1.executeUpdate();

			stmt1.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				this.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
