package inheritance;

public class Customer {

	private String name;
	private int year;
	private String sex;
	private int id;
	private static int count;
	
	//Constructor
	Customer(){}
	Customer(String name, int year, String sex){
		this.name=name;
		this.year=year;
		this.sex=sex;
		count++;
		this.id=count;
	}
	
	//toString 
	
	@Override
    public String toString() {
        return "Name:" + name
                + ", Year:" + year + ", sex: " + sex + ", id: " + id;
    }
	
	//Getters Setters

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public static int getCount() {
		return count;
	}

	public static void setCount(int count) {
		Customer.count = count;
	}

	
		
	// Getters Setters
	
}
