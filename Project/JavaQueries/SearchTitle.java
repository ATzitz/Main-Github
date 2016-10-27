
import java.sql.*;

public class SearchTitle {

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
     System.out.println("Connecting to database...");
     conn = DriverManager.getConnection(DB_URL,USER,PASS);

     //Execute a query
     System.out.println("Creating statement...");
     stmt = conn.createStatement();
     String sql;
     String keyword= "harry";
     sql = ("SELECT book.image,book.title,book.category,author.surname,author.name,avg(rating.rating) from book " +
    		 "inner join author on author.author_id=book.author_id " +
    		 "inner join rating on rating.book_id=book.book_id " +
    		 "where book.title LIKE '%"+ keyword +"%' " +
    		 "group by book.title");
     ResultSet rs = stmt.executeQuery(sql);

     //Preview data from result set
     while(rs.next()){
        //Retrieve by column name
        String bookimage  = rs.getString("book.image");
        String booktitle = rs.getString("book.title");
        String bookcategory = rs.getString("book.category");
        String authorsurname = rs.getString("author.surname");
        String authorname = rs.getString("author.name");
        String averagerating = rs.getString("avg(rating.rating)");
        

        //Display values
        System.out.print("book.image: " + bookimage);
        System.out.print(", title: " + booktitle);
        System.out.println(", book.category: " + bookcategory);
        System.out.println(", author.surname: " + authorsurname);
        System.out.println(", author.name: " + authorname);
        System.out.println(", avg(rating.rating): " + averagerating);
        
     }
     //Clean-up environment
     rs.close();
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
  System.out.println("Finshed!");
}//end main
}//end 