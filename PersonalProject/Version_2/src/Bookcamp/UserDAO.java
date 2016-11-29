package Bookcamp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends SuperDAO {

	public UserDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public List<User> getAllUsers() {

		List<User> userlist = new ArrayList<>();
		
		try {

			this.open();
			
			String sqlquery= "SELECT * FROM user;";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();
						
			while(rs.next()) {
				
				// Retrieve by column name
				int userId = rs.getInt("user_id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String surname = rs.getString("surname");
				int yearOfBirth = rs.getInt("birth_year");
				String sex = rs.getString("sex");
				// fill userlist with all users in our database
				userlist.add(new User(userId, username, password, name, surname, yearOfBirth, sex));
				
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
		return userlist;
	}//End of getAllUsers
	
	public User getUser(int userId) {

		try {
			for (User user : this.getAllUsers()){
				if (user.getUserId() == userId){
					return user;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public void registerUser(User user) {

		try {

			this.open();
			
			String sql= "INSERT INTO  bookcamp.user (username, password, name, surname, birth_year, sex) VALUES (?, ?, ?, ?, ?, ?);";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString( 1, user.getUsername() );
			stmt.setString( 2, user.getPassword() );
			stmt.setString( 3, user.getName());
			stmt.setString( 4, user.getSurname());
			stmt.setInt( 5, user.getYearOfBirth());
			stmt.setString( 6, user.getSex());
			
			stmt.executeUpdate();			
			
			stmt.close();	
			

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
	}//End of registerUser
	
	public void updateUser(int user_id, String username, String password, String name, String surname, int birth, String sex) {
		try {
			
			this.open();
			
			String sqlquery= "UPDATE user SET username='"+username+"',password='"+password+"',name='"+name+"', surname='"+surname+"',birth_year="+birth+",sex='"+sex+"' WHERE user_id="+user_id+";";
			
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
	
	public void removeUser(int user_id) {
		try {

			this.open();
			
			String sqlquery= "DELETE FROM wishlist WHERE user_id="+user_id+";";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			
			stmt1.executeUpdate();
			
			sqlquery= "DELETE FROM rating WHERE user_id="+user_id+";";
			stmt1 = con.prepareStatement(sqlquery);
			
			stmt1.executeUpdate();
			
			sqlquery= "DELETE FROM user WHERE user_id="+user_id+";";
			stmt1 = con.prepareStatement(sqlquery);
			
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
	}//remove user
	
	public List<Integer> getUsersWishlist(int userId) {

		List<Integer> userWishlist = new ArrayList<>();
		
		try {

			this.open();
			
			String sqlquery= "SELECT book_id FROM wishlist WHERE user_id = " +userId +";";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();
						
			while(rs.next()) {
				
				int bookId = rs.getInt("book_id");
				// Fill userWishlist with all books in wishlist table that have this user's id
				userWishlist.add(bookId);
				
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
		return userWishlist;
	}
	
	public void addtoWishlist(int userId, int bookId) {

		try {

			this.open();
			
			String sqlquery= "INSERT INTO wishlist (user_id, book_id)" + "VALUES (?, ?)";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			// insert values to above query
			stmt1.setInt(1, userId);
			stmt1.setInt(2, bookId);
			
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
	
	public void removeFromWishlist(int userId, int bookId) {

		try {

			this.open();
			
			String sqlquery= "DELETE FROM wishlist WHERE book_id =" +bookId +" AND user_id =" +userId +";";
			
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
