
public class Bootcamp {

	
	public static void welcome(double a) throws DigitException, AnotherDigitException {
		
		if (a > 25) {

			throw new DigitException();
		}
		if (a < 25) {
			throw new AnotherDigitException();

		}
	}
	public static void main(String[] args) {
		double b = 45;
		
		try {
			welcome(b);
		}

		catch (DigitException e) {
			System.out.println("Error1.");
		}
		catch (AnotherDigitException e) {			
				System.out.println ("Error2.");
		}
	}

}
	
	
		// Bootcamp a = new Bootcamp();
		// System.out.println(a.welcome(2));



