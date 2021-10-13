package ex05method;

import java.util.Scanner;

/*
문제5-2) 파일명 : QuCircleCalculator.java (난이도:중)
원의 반지름을 파라메타로 전달하면 원의넓이와 둘레를 계산하여 
반환하는 메소드를 각각 정의하자. 이를 호출하는 main 메소드를 정의하라.

 */
public class QuCircleCalculator {

	public static void main(String[] args) {		
		Scanner scanner = new Scanner(System.in);
		System.out.print("반지름을 입력하세요:");
		double rad = scanner.nextDouble();
		
		circleArea(rad);
		//반환값이 있는 메서드이므로 print문 안에서 호출한다. 
		System.out.println("원의둘레는:"+ circleRound(rad));
	}
	//반환값이 없으므로 매개변수를 받은 후 결과를 즉시 출력한다.
	static void circleArea(double radian) { //원의넓이 
		double result = 3.14 * radian * radian;
		System.out.println("원의넓이는:"+ result);
	}	
	static double circleRound(double radian) {// 원의둘레
		return (2 * 3.14 * radian);
	}
}

