package inheritance;

public class Health extends Insurance {

	private int expense;

	Health() {
	}

	Health(int id, int duration, int expense) {
		super(id,duration);
		this.expense = expense;
	}
//getters setters
	public int getExpense() {
		return expense;
	}

	public void setExpense(int expense) {
		this.expense = expense;
	}
//overrides
	@Override
	public String toString() {
		return "Id:" + id + ", Insurance ID:" + idins + ", Duration: " + duration;
	}

	public int calculateCost( Customer b) {
		for (int i = 1; i < Main.customerArray.length; i++) {
			if (Main.customerArray[i] != null && Main.customerArray[i].getSex().equals("Male"))
			{
				int mancost=50;
				return super.calculateCost()+ 7*b.getYear() + mancost;
				}
			else
				return super.calculateCost()+ 7*b.getYear();}
	return 0;
}
}