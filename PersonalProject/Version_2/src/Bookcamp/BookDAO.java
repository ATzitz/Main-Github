package Bookcamp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO extends SuperDAO {
	
	public BookDAO() {
	}
	
	public List<Book> getAllBooks() {
		
		List<Book> booklist = new ArrayList<>();
		
		try {
			
			this.open();
			
			String sqlquery= "SELECT * FROM book;";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();			
						
			while(rs.next()) {
				
				// Retrieve by column name
				int bookId = rs.getInt("book_id");
				String isbn = rs.getString("isbn");
				String imagePath = rs.getString("image");
				String title = rs.getString("title");
				int authorId = rs.getInt("author_id");
				Author author = this.getAuthor(authorId);
				String category = rs.getString("category");
				String publisher = rs.getString("publisher");
				int publicationYear = rs.getInt("publication_year");
				String description = rs.getString("description");

				// Fill booklist with all books in our database
				booklist.add(new Book(bookId, isbn, imagePath, title, author, category, publisher, publicationYear,
						description));
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
		return booklist;
	}//End of getAllBooks
	
	public Book getBookById(int bookId) {

		Book book = new Book();
		
		try {
			
			this.open();
			
			String sqlquery= "SELECT * FROM book where book_id = " +bookId +";";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();
			
			// Retrieve by column name
			rs.next();
			String isbn = rs.getString("isbn");
			String imagePath = rs.getString("image");
			String title = rs.getString("title");
			int authorId = rs.getInt("author_id");
			Author author = this.getAuthor(authorId);
			String category = rs.getString("category");
			String publisher = rs.getString("publisher");
			int publicationYear = rs.getInt("publication_year");
			String description = rs.getString("description");

			book = new Book(bookId, isbn, imagePath, title, author, category, publisher, publicationYear, description);

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
		return book;
	}//End of getBookById
	
	public List<Book> getAuthorsBooks(int author_Id) {

		List<Book> authorBooklist = new ArrayList<>();
		
		try {

			this.open();
			
			String sqlquery= "SELECT * FROM book where author_id = " +author_Id +";";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();
						
			while(rs.next()) {
				
				// Retrieve by column name
				int bookId = rs.getInt("book_id");
				String isbn = rs.getString("isbn");
				String imagePath = rs.getString("image");
				String title = rs.getString("title");
				int authorId = rs.getInt("author_id");
				Author author = this.getAuthor(authorId);
				String category = rs.getString("category");
				String publisher = rs.getString("publisher");
				int publicationYear = rs.getInt("publication_year");
				String description = rs.getString("description");

				// Fill authorBooklist with this author's books
				authorBooklist.add(new Book(bookId, isbn, imagePath, title, author, category, publisher, publicationYear,
						description));
				
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
		return authorBooklist;
	}//End of getAuthorsBooks
	
	public List<Book> getAuthorsOtherBooks (Book book) {
		List<Book> otherBooks;
		try {
			otherBooks = this.getAuthorsBooks(book.getAuthor().getAuthorId());
		} catch (Exception e) {
			otherBooks = new ArrayList<>();
			e.printStackTrace();
		}
		// Remove current book from list of author's books
		otherBooks.remove(book);
		return otherBooks;
	}
	
	public void printAllBooks() {
		try {
			for (Book book : this.getAllBooks()) {
				System.out.println(book);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Book getBook(int bookId) {
		try {
			for (Book book : this.getAllBooks()){
				if (book.getBookId() == bookId){
					return book;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Author> getAllAuthors() {

		List<Author> authorlist = new ArrayList<>();
		
		try {

			this.open();
			
			String sqlquery= "SELECT * FROM author;";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();
						
			while(rs.next()) {
				
				// Retrieve by column name
				int authorId = rs.getInt("author_id");
				String name = rs.getString("name");
				String surname = rs.getString("surname");
				String imagePath = rs.getString("image");
				String bio = rs.getString("bio");
				// Fill authorlist with all authors in our database
				authorlist.add(new Author(authorId, name, surname, imagePath, bio));
				
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
		return authorlist;
	}//End of getAllAuthors
	
	public Author getAuthor(int authorId) {
		try {
			for (Author author : this.getAllAuthors()){
				if (author.getAuthorId() == authorId){
					return author;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<String> getAllCategories() {

		List<String> categorylist = new ArrayList<>();
		
		try {

			this.open();
			
			String sqlquery= "SELECT distinct category FROM bookcamp.book;";
			
			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();
						
			while (rs.next()) {
				// Retrieve by column name
				String category = rs.getString("category");

				// Fill categorylist
				categorylist.add(category);
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
		return categorylist;
	}//End of getAllCategories
	
	public String getParagraphs (String text) { // make paragraphs visible in html
		return text.replace("\n", "<br>").replaceAll("\r", "<br>");
	}

	public List<Book> getQuery(String searchby, String keyword, String rating) {

		List<Book> querycatList = new ArrayList<>();
		
		try {

			this.open();

			String sqlquery;

			//this query is called with every type of navbar search
			sqlquery = ("SELECT * from (SELECT book.*, name, surname, bio, avg(rating) AS average from book " +
					"inner join author on author.author_id=book.author_id " +
					"left join rating on rating.book_id=book.book_id " +
					"where "+searchby+" LIKE '%"+ keyword +"%' " + 
					"group by book_id) as book_avg " + rating +" order by average DESC;");

			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			ResultSet rs = stmt1.executeQuery();

			while(rs.next()) {

				// Retrieve by column name
				int bookId = rs.getInt("book_id");
				String isbn = rs.getString("isbn");
				String imagePath = rs.getString("image");
				String title = rs.getString("title");
				int authorId = rs.getInt("author_id");
				Author author = this.getAuthor(authorId);
				String category = rs.getString("category");
				String publisher = rs.getString("publisher");
				int publicationYear = rs.getInt("publication_year");
				String description = rs.getString("description");

				// Fill booklist with all books fulfilling the chosen in our database
				querycatList.add(new Book(bookId, isbn, imagePath, title, author, category, publisher, publicationYear,
						description));
			}


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
		return querycatList;
	}
	
}