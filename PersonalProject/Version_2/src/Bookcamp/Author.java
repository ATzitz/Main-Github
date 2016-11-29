package Bookcamp;

public class Author {

	// fields
	int authorId;
	String name;
	String surname;
	String imagePath;
	String bio;
	
	// constructors
	public Author() {
		// TODO Auto-generated constructor stub
	}

	public Author(int authorId, String name, String surname, String imagePath, String bio) {
		this.authorId = authorId;
		this.name = name;
		this.surname = surname;
		this.imagePath = imagePath;
		this.bio = bio;
	}
	
	// Getters & Setters
	public int getAuthorId() {
		return authorId;
	}

	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}
	
}
