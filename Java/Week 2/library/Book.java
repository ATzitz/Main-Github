import java.util.*;

public class Book {

	private String title;
	private Author author;
	private final String isbn;
	private int physical_copies;
	private int available_copies;
	private int times_rented;

	public void setTitle (String title){this.title = title;}
	public String getTitle(){return this.title;}
	public String getIsbn(){return this.isbn;}
	public void setPhysical_copies(int physical_copies){this.physical_copies = physical_copies;}
	public int getPhysical_copies(){return this.physical_copies;}
	public void setAvailable_copies(int available_copies){this.available_copies = available_copies;}
	public int getAvailable_copies(){return this.available_copies;}
	public void setTimes_rented(int times_rented){this.times_rented = times_rented;}
	public int getTimes_rented(){return this.times_rented;}
	public void setAuthor (String name) {this.author.setName(name);}
	public String getAuthor() {return this.author.toString();}

	Book(String title, Author author, String isbn, int physical_copies, int available_copies, int times_rented) {
		this.title = title;
		this.author = author;
		this.isbn = isbn;
		this.physical_copies = physical_copies;
		this.available_copies = available_copies;
		this.times_rented = times_rented;
	}

	public String toString(){
		String bookDetails = "\nTitle: " +this.title +"\nAuthor: " +this.author.toString()
		+"\nIsbn: " + this.isbn +"\nPhysical copies: " +this.physical_copies
		+"\nAvailable copies: " +this.available_copies +"\nTimes rented: " +this.times_rented +"\n";
			return bookDetails;
	}

	public boolean isAvailable () {
		if (this.available_copies > 0)
			return true;
		else
			return false;
	}

	public void rentPhysicalCopy () {
		if (this.isAvailable()){
			System.out.println ("You have rented " +this.title +".");
			this.available_copies --;
			this.times_rented ++;}
		else
			System.out.println ("Sorry, there are no available copies of " +this.title +" at the moment");
	}

	public boolean hasAuthor (Author author) {
		if (this.author == author)
			return true;
		else
			return false;
	}

}