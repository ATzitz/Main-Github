import java.util.*;

public class Circle {

	private int x;
	private int y;
	private int r;
	static final double pi = 3.14;

	public void setX(int x){this.x = x;}
	public int getX(){return this.x;}
	public void setY(int y){this.y = y;}
	public int getY(){return this.y;}
	public void setR(int r){this.r = r;}
	public int getR(){return this.r;}

	Circle (){}

	Circle (int x, int y){
		this.x = x;
		this.y = y;
	}

	Circle (int x, int y, int r){
		this.x = x;
		this.y = y;
		this.r = r;
	}

	public void print (){
		System.out.printf ("I'm a circle at point (%d, %d) with radius %d\n", this.x, this.y, this.r);
	}

	public double calculateArea (double pi) {
		return (pi * Math.pow(this.r, 2));
	}

	public double calculatePerimeter (double pi) {
		return (2 * pi * this.r);
	}

	public Circle copy() {
	    Circle c = new Circle();
	    c.x = this.x;
	    c.y = this.y;
	    c.r = this.r;
	    return c;
	}

	public boolean cocentric (Circle c) {
		if ((this.x == c.x) && (this.y == c.y))
			return true;
		else
			return false;
	}

}