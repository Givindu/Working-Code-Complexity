
public class B {
int x1=100;
public static int x2=200;
public static int x3=200;
	

	public static void BFileA() {
        int added=x2+x3;
        A.Aa();
        BFileB(BFileC());
	}
	
	public static void BFileB() {
		for(int i=0;i<10;i++) {
			System.out.println("ishan");
		}
        //call recursive method from different file
         A.getSqr(12.5);
	}
	
        public static void BFileC() {
		if (a==210) {
	         //Aif block
		}

	}	


   public static void BFileRecursiveA(int a) {
		if (a==10) {
			return;
		}
//this is arecursive method
	   BFileRecursiveA(a++);
	}


}
