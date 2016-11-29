package Bookcamp;

public class Book {
	
	// fields
	private int bookId;
	private String isbn;
	private String imagePath;
	private String title;
	private Author author;
	private String category;
	private String publisher;
	private int publicationYear;
	private String description;
	
	// constructors
	public Book() {
		// TODO Auto-generated constructor stub
	}
	
	public Book(int bookId, String isbn, String imagePath, String title, Author author, String category, String publisher,
			int publicationYear, String description) {
		this.bookId = bookId;
		this.isbn = isbn;
		this.imagePath = imagePath;
		this.title = title;
		this.author = author;
		this.category = category;
		this.publisher = publisher;
		this.publicationYear = publicationYear;
		this.description = description;
	}
	
	// Getters & Setters
	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPublicationYear() {
		return publicationYear;
	}

	public void setPublicationYear(int publicationYear) {
		this.publicationYear = publicationYear;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", isbn=" + isbn + ", imagePath=" + imagePath + ", title=" + title
				+ ", author=" + author + ", category=" + category + ", publisher=" + publisher + ", publicationYear="
				+ publicationYear + ", description=" + description + "]";
	}
	
	public boolean equals(Object o) { //comparing book objects instead of ids
		if (o == null) {
			return false;
		}
		if (this.getBookId() == ((Book) o).getBookId()) {
			return true;
		}
		return false;
	}	
	
}
