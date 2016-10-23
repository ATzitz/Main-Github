

import java.util.ArrayList;

public class BootCampAdministration {

	//Create a private ArrayList with object of BootCampCandidates with name anArrayListOfBootCamps
	private ArrayList<BootCampCandidates> anArrayListOfBootCamps;
	
	
	//Create a constructor which receives an array with BootCampCandidate objects and 
	//initializes the anArrayListOfBootCamps ArrayList by adding all BootCampCandidate array's
	//elements in the the nArrayListOfBootCamps
	BootCampAdministration(){}
	BootCampAdministration(BootCampCandidates[] anArrayListOfBootCamps) {
		this.anArrayListOfBootCamps = new ArrayList<>();
		for (int i=0; i<anArrayListOfBootCamps.length; ++i)
			this.anArrayListOfBootCamps.add(anArrayListOfBootCamps[i]);
	}
	
	
	//Create setters and getters for BootCampAdministration

	public ArrayList<BootCampCandidates> getAnArrayListOfBootCamps() {
		return anArrayListOfBootCamps;
	}
	public void setAnArrayListOfBootCamps(ArrayList<BootCampCandidates> anArrayListOfBootCamps) {
		this.anArrayListOfBootCamps = anArrayListOfBootCamps;
	}	

	//create an int method that returns the size of anArrayListOfBootCamps
	
	
	//Print Method
	public void print() {
        for(int i=0; i<this.anArrayListOfBootCamps.size(); i++){
            System.out.println((i+1) + ". " + this.anArrayListOfBootCamps.get(i).toString());
        }
	}
	//Create a method that adds a new BootCampCandidate inside the ArrayList
    public void add(BootCampCandidates a){
    	this.anArrayListOfBootCamps.add(a);
    }
	
	//Create a method that removes a candidate by name and returns true if found or false if not
	//HINT: you have to use get() to get the object and equals to compare it
    public void remove(String v){
    boolean found=false;
    	for(int i=0; i<this.anArrayListOfBootCamps.size(); i++){
            if (this.anArrayListOfBootCamps.get(i).getName().equals(v)){
            	this.anArrayListOfBootCamps.remove(i);          		
            	found=true;
            System.out.println("Sucess");}
    	}
    	if (found==false){System.out.println("Not found");}
    }
	//Create a method to search for a boot camp member by surname and returns a string with its information
	// if it's found and null if it's not found

    public void find(String v){
    	    for(int i=0; i<this.anArrayListOfBootCamps.size(); i++){
    	            if (this.anArrayListOfBootCamps.get(i).getSurname().equals(v)){
    	            	System.out.println((i+1) + ". " + this.anArrayListOfBootCamps.get(i).toString());}
    	    	}
    	    	
    }
	//Create a method that can change a bootcampers age by having as input its name and surname

    public void change(String name,String surname, int age){
	    for(int i=0; i<this.anArrayListOfBootCamps.size(); i++){
	    if (this.anArrayListOfBootCamps.get(i).getName().equals(name) && this.anArrayListOfBootCamps.get(i).getSurname().equals(surname)){
	            	this.anArrayListOfBootCamps.get(i).setAge(age);
	            		    	}
	    }
    
	}	}

