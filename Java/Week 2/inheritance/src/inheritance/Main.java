package inheritance;
import java.util.Scanner;

public class Main {
	
	public static Customer[] customerArray= new Customer[10]; 
	public static Insurance[] insuranceArray= new Insurance[10]; 

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Customer a= new Customer("alex",1988,"Male");
		customerArray[1]=a;
		Customer b= new Customer("Takis",1908,"Male");
		customerArray[2]=b;
		Customer c= new Customer("maria",1980,"Female");
		customerArray[3]=c;
		Customer d= new Customer("Eleni",1987,"Femaale");
		customerArray[4]=d;
		Customer e= new Customer("Aion",1990,"Male");
		customerArray[5]=e;
		Customer f= new Customer("Kost",1940,"Male");
		customerArray[6]=f;
		Customer g= new Customer("Jib",1981,"Male");
		customerArray[7]=g;
		Customer h= new Customer("Dim",1952,"Male");
		customerArray[8]=h;
		
		Insurance a1= new Life(a.getId(),10,10000);
		insuranceArray[1]=a1;
		Insurance b1= new Life(b.getId(),9,12000);
		insuranceArray[2]=b1;
		Insurance c1= new Life(c.getId(),8,9000);
		insuranceArray[3]=c1;
		Insurance d1= new Life(d.getId(),5,2000);
		insuranceArray[4]=d1;
		Insurance e1= new Life(e.getId(),4,16000);
		insuranceArray[5]=e1;
		Insurance f1= new Health(f.getId(),2,120000);
		insuranceArray[6]=f1;
		Insurance g1= new Health(g.getId(),1,160);
		insuranceArray[7]=g1;
		Insurance h1= new Health(h.getId(),12,1600);
		insuranceArray[8]=h1;
		
		System.out.println( "***** Menu **** "
				+ "\n 1. Print all Insurances "
				+ "\n 2. Search Insurance by customer code "
				+ "\n 3. Search insurances by insurance code");
		
		Scanner sc = new Scanner(System.in);
	    int input = sc.nextInt();
		
		if ( input==1){
			Insurance print= new Insurance();
			print.printall();
		}
		if ( input==2){
			Insurance print= new Insurance();
			System.out.println( "Enter Customer Code:");
			Scanner sc2 = new Scanner(System.in);
		    int input2 = sc.nextInt();
			print.printc(input2);
		}
		if ( input==3){
			Insurance print= new Insurance();
			System.out.println( "Enter Insurance Code:");
			Scanner sc3 = new Scanner(System.in);
		    int input3 = sc.nextInt();
			print.print(input3);
		}
				
		/*for (int i=1; i<8; i++){
		System.out.println(customerArray[i].toString());} 
		System.out.println(g1.getIdins());
		Insurance print= new Insurance();
		
		print.print(7);
		//for (int i=1; i<8; i++){
		//System.out.println(Insurance.printall());}
		*/
	}

}
