
public class B {
int x1=100;
public static int x2=200;
public static int x3=200;
	

	public static void BFileA() {
		
	}
	
	public static void BFileB() {
		for(int i=0;i<10;i++) {
			System.out.println("ishan");
		}
	}
	
	
   public static void BFileRecursiveA(int a) {
		if (a==10) {
			return;
		}
	   BFileRecursiveA(a++);
	}


}
