
public abstract class Shape {

	Shape(){}
	Shape(int sides){
		this.sides=sides;
	}
	public int sides;
	
	int area(Shape S){
		int a=S.getSides()*10;
		return  a;
	}
	int perimeter(Shape S){
		int peri=S.getSides()*5;
		return peri;
	}

	public String toString() {
		return "Shape with:" + sides + "sides.";
	}
	
	//GettersSetters

	public int getSides() {
		return sides;
	}
	public void setSides(int sides) {
		this.sides = sides;
	}
}
