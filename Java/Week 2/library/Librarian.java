import java.util.*;

public class Librarian {

	private Library library;

	public void setLibrary (Library library){this.library = library;}
	public Library getLame(){return this.library;}

	Librarian(Library library) {
		this.library = library;
	}

	public void findMeBooksFromAuthor(String name) {
		this.library.printBookFromAuthor(name);
	}

	public void findMeAvailableBooks () {
		this.library.printAvailableBooks ();
	}

	public void findMeBook (String title) {
		this.library.printBookDetails (title);
	}

}