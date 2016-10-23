
public class Shape implements Agreeable {
	
	private int width;
	private int height;
	Shape(){}
	Shape(int width, int height){
		this.width=width;
		this.height=height;
	}

	public int calcArea(int width, int height){
		return this.width*this.height;
	}
	public static void main(String[] args) {
		
	}
	Shape small= new Shape(1,1);
	Shape big= new Shape(2,2);
	
	public void isSmallerThan() {
		
		
	}

}
