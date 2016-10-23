import java.util.*;

public class TestCircles {

	public static void main(String[] args) {
		Circle c1 = new Circle();
		c1.setX(2);
		c1.setY(3);
		c1.setR(5);
		c1.print();

		Circle c2 = new Circle(1, 2);
		c2.setR(7);
		c2.print();

		Circle c3 = new Circle(3, 5, 9);
		c3.print();

		Circle c4 = new Circle(3, 1, 5);
		c4.print();

		Circle c4copy = c4.copy();

		System.out.println("c4 area = " + c4.calculateArea(Circle.pi) + " cm2");
		System.out.println("c4 perimeter = " + c4.calculatePerimeter(Circle.pi) + " cm");
		System.out.println("c4copy area = " + c4copy.calculateArea(Circle.pi) + " cm2");
		System.out.println("c4copy perimeter = " + c4copy.calculatePerimeter(Circle.pi) + " cm");

		c4.setX(6);
		c4.setY(2);
		c4.setR(7);

		System.out.println("c4 area = " + c4.calculateArea(Circle.pi) + " cm2");
		System.out.println("c4 perimeter = " + c4.calculatePerimeter(Circle.pi) + " cm");
		System.out.println("c4copy area = " + c4copy.calculateArea(Circle.pi) + " cm2");
		System.out.println("c4copy perimeter = " + c4copy.calculatePerimeter(Circle.pi) + " cm");

		if (c4.cocentric(c4copy) == true)
			System.out.println("c4 and c4copy are cocentric");
		else
			System.out.println("c4 and c4copy are NOT cocentric");

	}

}