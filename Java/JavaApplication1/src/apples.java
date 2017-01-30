public class apples {
	
	public int a;
	public int b;
	public apples nextone;
	
	public apples(int d1, int d2) {
		a= d1;
		b=d2;
		
	}
	
	public void printlink() {
		System.out.println("{"+a+","+b+"}");
	}
}