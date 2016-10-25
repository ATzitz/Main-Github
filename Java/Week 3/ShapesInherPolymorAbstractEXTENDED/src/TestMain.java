
public class TestMain {

	public static void main(String[] args) {
		
		Rectangle test=new Rectangle();
		Rectangle x = new Rectangle(5,5,2);
		Rectangle y = new Rectangle(5,5,2);

		//test.areEqual(x, y);
		
		//x.draw(x);

		//x.copy(x);
		System.out.println(test.area(x));
		System.out.println(test.perimeter(x));
		Shape rer1 = new Rectangle(2,3);

		Rectangle rec2 = new Rectangle(3,5);
		
		test.areEqual(rec2, y);
		Shape[] ListOfShapes={rer1,rec2,x,y};
		
		for (int i=0; i<ListOfShapes.length; i++){
			System.out.println(ListOfShapes[i]);

		}
		
		
	}
	
}
