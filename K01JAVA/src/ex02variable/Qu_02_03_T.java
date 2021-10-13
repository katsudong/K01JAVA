package ex02variable;
/*
문제3] 파일명 : Qu_02_03.java
반지름이 10인 원의 넓이를 구해 출력하시오.
단, 넓이의 타입을 int, double형 두가지로 선언하여 각각 출력해야한다.
 */
public class Qu_02_03_T 
{

	public static void main(String[] args) 
	{
		
	 	//원주율은 변하지 않는 값이므로 상수로 선언한다.
		final double PI = 3.14;
		
		int radian = 10; // 반지름
		
		int area_int; // 정수형 넓이
		double area_double; // 실수형 넓이
		
		area_double = radian * radian * PI;
		area_int = (int)(radian * radian * PI);
		// 혹은 area_int = (int)area_double;
		System.out.println("int형:"+ area_int);
		System.out.println("double형"+ area_double);
		
		//방법3) 계산과 출력을 한번에
		//System.out.println("double형"+ (radian * radian * PI));

	}

}
