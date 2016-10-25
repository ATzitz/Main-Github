
public class TestMain {

	public static void main(String[] args) {
		
		Rectangle test=new Rectangle();
		Rectangle x = new Rectangle(5,5);
		Rectangle y = new Rectangle(5,5);

		test.areEqual(x, y);
		
		x.draw(x);

		x.copy(x);
		
		
	}
	
}
