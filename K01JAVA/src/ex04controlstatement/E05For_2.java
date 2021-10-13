package ex04controlstatement;

public class E05For_2 
{

	public static void main(String[] args) 
	{
	 /*
	 시나리오] for문을 이용하여 1~10 사이의 정수 중 2의 배수의 합을 구하는
	 프로그램을 작성하시오.
	 */
		
		int total = 0;
		//방법1 : 10번 반복해서 if문을 통해 2의 배수를 찾은 후 누적함
		for(int i=1 ; i<=10 ; i++)
		{
			if(i%2==0)
			{
				total += i;
			}
		}
		System.out.println("1~10사이 2의 배수의 합:"+ total);
		
		//방법2 : if문 없이 2씩 증가하면서 누적합
		total = 0;
		for(int i=0 ; i<=10 ; i+=2) // 복합대입 연산자 사용가능함
		{
			total += i;
		}
		System.out.println("1~10사이 2의 배수의 합(방법2):"+ total);
		
		//for문으로 무한루프를 만들 때 사용. 일반적으로 while문을 사용함
//		int a = 1;
//		for(;;)
//		{
//			System.out.println("나는 for문으로 만든 무한루프입니다"+ a);
//			a++;
//		}
		
		/*
		for문의 끝에 ;를 사용하면 반복할 문장이 없는 것으로 간주되어
		for문과 상관없이 한번만 실행된다.
		 */
		for(int j=0 ; j<=5 ; j++);
		{
			System.out.println("어랏...나는 누구? 여긴 어디?");
		}
		
		/*
		for문의 초기식에서 선언된 변수 j는 for문이 종료된 순간 메모리에서
		소멸된다. 여기서 사용된 변수 j는 지역변수(local variable)라고 한다.
		지역변수는 해당 지역을 벗어나면 즉시 소멸되는 특징을 가지고 있다.
		 */
		//System.out.println("위 for문에서 선언한 변수 j="+ j);
		System.out.println("위 main함수 지역에서 선언한 변수 total="+ total);
		/*
		for문의 초기값을 외부(넓은지역)에서 선언하면 해당변수는 for문의
		안쪽(좁은지역)에서 사용할 수 있다. 즉 아래에 선언한 변수 i는
		main 메소드의 지역 변수가 된다.
		 */
		int i=0;
		for( ; i<=5 ; i++)
		{
			System.out.println("for문 안에서의 i값="+ i);
		}
		System.out.println("for문 밖에서의 i값="+ i);
		
		/*
		연습문제1] 구구단을 출력하는 프로그램을 for문으로 작성하시오.
		 */
		
		
		for(int dan=2 ; dan<=9 ; dan++)
		{
			for(int su=1 ; su<=9 ; su++) 
			{
				System.out.printf("%-2d*%-2d=%2d", dan, su, (dan*su));
			}
			System.out.println();
		}
		System.out.println();
		
		/*
		해설]
		for(int dan2 ; dan<=9 ; dan++) // 2단부터 9단까지 반복
			for(int su1 ; su<=9 ; su++) // 1~9까지 반복
				system.out.printf("%2d*%2d=%2d ", dan, su, (dan*su));
				System.out.println();
		 */
		
		/*
		연습문제2] 다음 출력결과를 보이는 for문을 작성하시오.
		출력결과
		1 0 0 0
		0 1 0 0
		0 0 1 0
		0 0 0 1
		 */
		
		
		for(int x=1 ; x<=4 ; x++)
		{
			for(int y=1 ; y<=4 ; y++)
			{
			if(x==y)
			{
				System.out.print("1 ");
			}
			else
			{
				System.out.print("0 ");
			}
		}
		System.out.println();
		
		/*
		해석]
		
		for(int x=1 ; x<=4 ; x++)
		{
			for(int y=1 ; y<=4 ; y++)
			{
			if(x+y==5)
			{
				system.out.print("1 ");
			}
			else
			{
				system.out.print("0 ");
			}
			}
		}
		System.out.println();
		 */
	}
	}
}
