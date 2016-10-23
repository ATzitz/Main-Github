
public class ResizableCircle extends Circle implements Resizable{

	
	private double a;
	ResizableCircle(double radius){
		}
	@Override
	public void resize(double a) {
		this.a=a;
		a=0.9*a;
	}

	public static void main(String[] args) {
		
		ResizableCircle circle= new ResizableCircle(5);
		circle.resize(5);	
	}
	
}
