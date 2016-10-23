import java.util.*;

public class Author {

	private String name;

	public void setName (String name){this.name = name;}
	public String getName(){return this.name;}

	Author(String name) {
		this.name = name;
	}

	public String toString(){
		return this.name;
	}

}