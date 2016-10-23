import java.util.*;

public class Library {

	private Book[] books = new Book[20];

	public void setBooks (Book[] books){this.books = books;}
	public Book[] getBook(){return this.books;}

	Library(Book[] books) {
		this.books = books;
	}

	public void printAvailableBooks () {
			for (Book book : books){
				if (book.isAvailable())
					System.out.println(book.getTitle());
			}
	}

	public void printBookDetails (String title) {
		for (Book book : books){
			if (book.getTitle().equals(title))
				System.out.println(book.toString());
		}
	}

	public void printBookFromAuthor (String name){
		for (Book book : books){
			if (book.getAuthor().equals(name))
				System.out.println(book.getTitle());
		}
	}

}