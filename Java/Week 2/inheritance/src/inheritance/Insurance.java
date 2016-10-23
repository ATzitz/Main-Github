package inheritance;

public class Insurance {

	protected int id;
	protected int idins;
	static int count;
	protected int duration;

	// Constructor
	Insurance() {
	}

	Insurance(int id, int duration) {
		this.id = id;
		count++;
		this.idins = count;
		this.duration = duration;
	}

	// calculate cost

	public int calculateCost() {
		return 100;
	}

	// printall stored insurance
	public void printall() {
		for (int i = 1; i < 9; i++) {
			System.out.println(Main.insuranceArray[i].toString());
		}

	}

	// print a particular insurance

	public void print(int input) {
		for (int i = 1; i < Main.insuranceArray.length; i++) {
			if (Main.insuranceArray[i] != null && Main.insuranceArray[i].getIdins() == input) {
				System.out.println(Main.insuranceArray[i].toString());
			}
		}
	}
	
	public void printc(int input) {
		for (int i = 1; i < Main.customerArray.length; i++) {
			if (Main.customerArray[i] != null && Main.customerArray[i].getId() == input) {
				System.out.println(Main.customerArray[i].toString());
			}
		}
	}

	// toString

	@Override
	public String toString() {
		return "Id:" + id + ", Insurance ID:" + idins + ", Duration: " + duration ;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdins() {
		return idins;
	}

	public void setIdins(int idins) {
		this.idins = idins;
	}

	public static int getCount() {
		return count;
	}

	public static void setCount(int count) {
		Insurance.count = count;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	// getters setters

}
