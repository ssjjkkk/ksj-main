package e_oop.pack1;

public class B {
	
	public void print() {
		A a = new A(); // 객체생성 가능
		System.out.println(a.a);
		System.out.println(a.b);
		System.out.println(a.c);
		System.out.println("");
//		System.out.println(a.d); // private이라 해당클래스가 아니면 안됨
	}
	
}
