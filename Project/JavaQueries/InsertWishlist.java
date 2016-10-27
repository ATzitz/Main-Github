import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertWishlist {

  static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
  static final String DB_URL = "jdbc:mysql://localhost/bookcamp";
  static final String USER = "root";
  static final String PASS = "alex1408";
  
  public static void main(String[] args) {
  Connection conn = null;
  Statement stmt = null;
  try{
     //Register JDBC driver and Open a connection
     Class.forName("com.mysql.jdbc.Driver");
     System.out.println("Connecting to database...Ok");
     conn = DriverManager.getConnection(DB_URL,USER,PASS);

     //Execute a query
     System.out.println("Creating statement...");
     stmt = conn.createStatement();
     String sql;
     int userid=9;
     int bookid=10;
     sql = ("INSERT INTO bookcamp.wishlist (user_id,book_id) Values (" + userid + "," + bookid + ")");
     int rs = stmt.executeUpdate(sql);

    //Preview data from result set
/*   while(rs.next()){
        //Retrieve by column name
        String SQLuserid  = rs.getString("user_id");
        String SQLbookid = rs.getString("book_id");
       

        //Display values
        System.out.print("userid: " + SQLuserid);
        System.out.print(", bookid: " + SQLbookid);
        
        
     } 
     //Clean-up environment
     rs.close();*/
     stmt.close();
     conn.close();
  }catch(SQLException se){
     //Handle errors for JDBC
     se.printStackTrace();
  }catch(Exception e){
     //Handle errors for Class.forName
     e.printStackTrace();
  }finally{
     //finally block used to close resources
     try{
        if(stmt!=null)
           stmt.close();
     }catch(SQLException se2){
     }// nothing we can do
     try{
        if(conn!=null)
           conn.close();
     }catch(SQLException se){
        se.printStackTrace();
     }//end finally try
  }//end try
  System.out.println("Query success-End!");
}//end main
}//end 