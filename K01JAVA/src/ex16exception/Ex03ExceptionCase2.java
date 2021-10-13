package ex16exception;

import java.io.IOException;
/*
예외처리방법2
	: 예외가 발생한 지점에서 예외를 직접 처리한다.
	개발 시 가장 많이 사용되는 방법이다. try~catch문을 통해 예외가 발생될 수
	있는 지점을 명시적으로 알 수 있다.
 */
public class Ex03ExceptionCase2
{
	static void compileFunc()
	{
		/*
		예외가 발생하는 지점을 try로 묶을 때 너무 작은 단위를 묶게되면
		프로그램의 가독성이 떨어지므로, 적당한 블록을 정해 묶어주는 것이 좋다.
		 */
		try
		{
			System.out.println("하나의 문자를 입력하세요:");
			int userChr = System.in.read();
			System.out.println("입력한 문자는 :"+(char)userChr);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args)
	{
		
		compileFunc();
		
	}
}
