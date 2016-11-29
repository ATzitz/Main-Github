package Bookcamp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class SuperDAO {

	protected Connection con = null;
	
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
			con = DriverManager.getConnection("jdbc:mysql://localhost/bookcamp", "root", "admin");
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

	public Connection getCon() {
		return con;
	}	
	
}
