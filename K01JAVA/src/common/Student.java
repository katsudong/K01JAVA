package common;

public class Student extends Person 
{
	private String stNumber;

	public Student(String name, int age, String stNumber) 
	{
		super(name, age);
		this.stNumber = stNumber;	
	}
	
	@Override
	public String getInfo() 
	{
		/*
		부모에서 정의한 getInfo()를 통해 이름, 나이까지의 문자열을 반환받은후
		자식에서 확장한 학번을 연결해서 문자열을 완성한다.
		 */
		return super.getInfo()+",학번:"+stNumber;
	}
	@Override
	public void showInfo() 
	{
		System.out.println("학생의 정보");
		System.out.println(getInfo());
	}
	
	/*
	hashCode()
	: 객체가 가진 고유한 주소값을 정수형으로 반환해준다.
	Set컬렉션에 저장 시 중복확인을 위한 첫번째 오버라이딩 해야할 메소드이다.
	 */
	@Override
	public int hashCode() 
	{
		int stNumberHashCode = stNumber.hashCode();
		System.out.println("stNumberHashCode="+ stNumberHashCode);
		return stNumberHashCode;
	}
	/*
	equals() : 객체가 가진 멤버변수의 값을 비교한다.
	 */
	@Override
	public boolean equals(Object obj) 
	{
		
		Student student = (Student)obj;
		System.out.println("equals()메소드 호출됨");
		//학번에 대한 비교를 진행
		if(student.stNumber.equals(this.stNumber))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}
