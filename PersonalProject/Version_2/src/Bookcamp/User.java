package Bookcamp;

public class User {

	// fields
	private int userId;
	private String username;
	private String password;
	private String name;
	private String surname;
	private int yearOfBirth;
	private String sex;
	
	// constructors
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(int userId, String username, String password, String name, String surname, int yearOfBirth, String sex) {
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.name = name;
		this.surname = surname;
		this.yearOfBirth = yearOfBirth;
		this.sex = sex;
	}

	// Getters & Setters
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public int getYearOfBirth() {
		return yearOfBirth;
	}

	public void setYearOfBirth(int yearOfBirth) {
		this.yearOfBirth = yearOfBirth;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}		

}
