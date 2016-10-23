package inheritance;

public class Life extends Insurance {

	private int invest;
	
	
	Life(){}
	Life(int id, int duration, int invest){
		super(id,duration);
		this.invest=invest;
	}	
	//getters setters
	
	public int getInvest() {
		return invest;
	}
	public void setInvest(int invest) {
		this.invest = invest;
	}
	
//overrides
	@Override
	public String toString() {
		return "Id:" + id + ", Insurance ID:" + idins + ", Duration: " + duration;
	}
	
	public int calculateCost( Customer b) {
		return super.calculateCost()+ 5*b.getYear();}
	
	
	
	
}
