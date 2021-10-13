package ex07string;

import java.util.Scanner;
/*
문제1] 파일명 : QuValidateId.java
사용자로 부터 아이디를 입력받은 후 다음 조건에 만족하는지 확인할 수 있는 프로그램을 작성하시오.
아이디는 8~12자 사이로만 사용할 수 있다. (length() 메서드 활용)
영문과 숫자로만 입력할 수 있다. (charAt() 메서드 활용)
특수기호, 공백, 그 외 모든 문자는 입력할 수 없다. 
위 조건에 만족하면 true, 만족하지 않으면 false를 반환한다. 
메서드명 : boolean idValidate(String inputId)
힌트 : (idChar>='a' && idChar<='z') 이와 같은 조건을 사용하면 된당^^*
 */
public class QuValidateId
{
	public static boolean idValidate(String inputId) 
	{
		//아이디 유효성 검증 확인용 변수
		boolean idOk = true;
		
		//아이디의 길이 확인(8~12자)
		if(inputId.length()>=8 && inputId.length()<=12) {
			//영문, 숫자의 조합인지 확인
			//입력한 아이디의 길이만큼 반복해서...
			for(int i=0 ; i<inputId.length() ; i++) {
				//각 문자가 영문 or 숫자인지 확인한다.
				char idChr = inputId.charAt(i);
				if( !((idChr>='a' && idChr<='z') || (idChr>='A' && idChr<='Z') 
						|| (idChr>='0' && idChr<='9')) ){
					//아이디가 영문+숫자 조합이 아니라면 false로 처리한다.
					idOk = false;
					//반복문을 탈출한다. 
					break;
				}				
			}			
		}
		else {
			//아이디의 길이가 잘못되었을때...
			idOk = false;
		}
		
		return idOk;
	}
	public static void main(String[] args)
	{
		Scanner scanner = new Scanner(System.in);
		System.out.print("아이디를 입력하세요:");
		String id = scanner.nextLine();
		boolean isOk = idValidate(id);
		if(isOk==true)
			System.out.println("사용 가능한 아이디입니다.");
		else
			System.out.println("아이디 제대로 입력해~!");
	}
}






