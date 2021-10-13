package ex05method;
/*
문제5-3) 파일명 : QuTemperature.java  (난이도:중)
섭씨(Celsius)를 입력받아서 화씨(Fahrenheit)로 변환하여 
리턴하는 함수와 화씨를 입력받아서 섭씨로 변환하여 리턴하는 함수를 만들어라.
 */
public class QuTemperature {

	//섭씨->화씨.
	static double celsiusToFahrenheit(double cel) {
		double fah = 1.8 * cel + 32;
		return fah;
	}
	//화씨->섭씨..
	static double fahrenheitToCelsius(double fah) {
		return (fah - 32) / 1.8;
	}
	public static void main(String[] args) {
		
		System.out.println("섭씨23도=>화씨="+celsiusToFahrenheit(23));
		System.out.println("화씨98도=>섭씨="+fahrenheitToCelsius(98.3));
	}
}
