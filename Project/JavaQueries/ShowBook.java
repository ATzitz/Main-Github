import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ShowBook {

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
     String keyword= "Harry Potter and the Goblet of Fire";
     sql = ("SELECT book.image,book.title,book.category,author.surname,author.name,avg(rating.rating),back_cover.decription from book " +
    		 "inner join author on author.author_id=book.author_id " +
    		 "inner join rating on rating.book_id=book.book_id " +
    		 "inner join back_cover on back_cover.book_id=book.book_id "+
    		 "where book.title='" + keyword +"'");
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
        String backcover=rs.getString("back_cover.decription");
        

        //Display values
        System.out.print("book.image: " + bookimage);
        System.out.print(", title: " + booktitle);
        System.out.println(", book.category: " + bookcategory);
        System.out.println(", author.surname: " + authorsurname);
        System.out.println(", author.name: " + authorname);
        System.out.println(", avg(rating.rating): " + averagerating);
        System.out.println(", back_cover.decription: " + backcover);
        
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
  System.out.println("Query success-End!");
}//end main
}//end 