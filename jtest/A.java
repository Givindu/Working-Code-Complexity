import java.util.*;
public class A {
	double num = 0.0;
	int x1 = 123;
        static	int x2 = 456;
	public static void main(String[] args) {
		A m2 = new A();
		//Accessing class from
		B b= new B();
		b.BFileB();
		//Accessing normal B method from normal A method
		B.BFileA();
		m2.answer();
	}
	public double Aa() {
		int value1=B.x2+B.x1;
		Aa();
		this.x1 = 1000 + x2;
		this.x2 = this.x1;
		this.x1 = 1000;
		return 0.0;
	}
	public double getSqr(double num1) {
		//Accessing normal B method from recursive A method
				B.BFileA();
	int value1=B.x3;
		//access global var of another file
	    int fromOther =	B.x3;
		this.x1 = 1000;
		if (num1 == 0)
			return num;
		else
			return getSqr(num1 - 1) + (2 * num1);
	}
	public double getCube(double num2) {
		//Accessing recursive B method from recursive A method
				B.BFileRecursiveA(212);
		if (num2 == 0)
			return 0;
		else
			return getCube(num2 - 1) + 3 * (getSqr(num2) - 3 * num2 + 1);
	}
	public void answer() {
		A m1 = new A();
		Scanner input = new Scanner(System.in);
		System.out.print("Enter a number");
		num = input.nextInt();
		double n2 = m1.getSqr(num);
	}
}
