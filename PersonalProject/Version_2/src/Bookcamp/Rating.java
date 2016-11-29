package Bookcamp;

public class Rating {

	// fields
	private int userId;
	private int bookId;
	private int rating;
	private String review;
	
	// constructors
	public Rating() {
	}
	
	public Rating(int userId, int bookId, int rating, String review) {
		this.userId = userId;
		this.bookId = bookId;
		this.rating = rating;
		this.review = review;
	}

	// Getters & Setters
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	@Override
	public String toString() {
		return "Rating [userId=" + userId + ", bookId=" + bookId + ", rating=" + rating + ", review=" + review + "]";
	}

}
