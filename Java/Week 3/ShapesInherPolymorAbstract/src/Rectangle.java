
public class Rectangle extends Shape{

	private int a;
	private int b;

	// Constructors
	Rectangle() {
	};

	Rectangle(int a, int b) {
		this.a = a;
		this.b = b;
	}

	
	
	@Override
	public String toString() {
		return "Side A:" + a + ", Side B:" + b;
	}

	public void areEqual(Rectangle x, Rectangle y) {
		if (x.getA()==y.getA() && x.getB()==y.getB())
			System.out.println("The Rectangles given are equal");
	}
	public Rectangle copy(Rectangle x) {
			Rectangle Z = new Rectangle(this.getA(), this.getB());
			System.out.println(Z.toString());
			return Z;
	}

	public void isSquare(Rectangle x) {
		if (this.getA() == (this.getB()))
			System.out.println(" The Rectangle is square");
	}

	public void draw(Rectangle r) {
		for (int i = 0; i <= r.getB()-1; i++) {
			if (i == 0 ) {
				String start = new String(new char[r.getA()]).replace("\0", "*");
				System.out.println(start);
				}
			if (i!=0 && i != r.getB()-1) {
				StringBuilder mid = new StringBuilder();
				mid.setLength(r.getA());
				mid.insert(0, "*");
				mid.insert(r.getA()-1, "*");
				System.out.println(mid);
				}
				
			if ( i == r.getB()-1) {
				String end = new String(new char[r.getA()]).replace("\0", "*");
				System.out.println(end);
				}
			}
		}

	



	// Getters Setters

	public int getA() {
		return a;
	}

	public void setA(int a) {
		this.a = a;
	}

	public int getB() {
		return b;
	}

	public void setB(int b) {
		this.b = b;
	}

}
