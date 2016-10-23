public class ex1 {
	
	public static void main(String[] args) { 
		int[] array = {1, 3, 1, 2, 5, 6, 6, 8, 9, 12, 1, 13, 3, 1};
		String s="";
		int i=-1;
		int min=Integer.MAX_VALUE;
		for (int x1:array){
				if (min>x1){
					min=x1;}
				}
		for (int x2:array)
		{ i++;
			if (min==x2)
				s+=String.valueOf(i);
			}
		//s+=String.valueOf(i);
		System.out.println(s);
		
	}

	}
