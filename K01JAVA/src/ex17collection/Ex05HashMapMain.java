package ex17collection;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
/*
HashMap<K,V>
	: Map<T> 인터페이스를 구현한 컬렉션 클랙스로
	- key, value의 쌍으로 객체를 저장한다.
	- 키값은 중복될 수 없다. 중복될 경우 기존의 데이터를 덮어쓰기한다.
	- 키값으로 검색하므로 다른 컬렉션에 비해 속도가 빠르다.
 */
public class Ex05HashMapMain 
{
	public static void main(String[] args) 
	{
		//Map컬렉션 생성. key와 value는 둘다 String으로 선언
		HashMap<String, String> map = new HashMap<String, String>();
		
		/*
		객체저장
			: 객체저장 시 기존에 저장된 동일한 key값이 존재하면
			이전에 저장된 객체가 반환된다. 만약 처음 입력이라면
			null값이 반환된다.
		 */
		System.out.println("name이라는 키값으로 저장된 이전의 값:" + map.put("name","홍길동"));
		//=>null 반환됨
		
		int number = 20;
		//map.put("age", number); //[에러발생]
		map.put("age", String.valueOf(number));
		map.put("gender", "남자");
		map.put("address", "가산디지털단지");
		
		/*
		3. 객체수
		 */
		System.out.println("저장된 객체수:"+map.size());
		
		/*
		4. 중복저장 : 기존에 입력된 Key값 name이 있으므로 "홍길동"이 출력된다.
			그리고 기존의 값은 "최길동"으로 수정된다.
		 */
		System.out.println("name이라는 키값으로 저장된 이전의 값:" + map.put("name", "최길동"));
		System.out.println("키값으로 중복 저장 후 객체수:" + map.size());
		
		/*
		5. 출력
		5-1] 키값을 알고 있을 때 출력하기
			: get(키값) 메소드를 이용한다.
		 */
		System.out.println("키값을 알 때:"+ map.get("name"));
		
		/*
		5-2] 키값을 모를 때 출력하기
			: keySet() 메소드를 호출하여 키값을 Set컬렉션으로 얻어온다.
			해당 반환값을 개선된 for문으로 추출하고, 이를 통해 value를 얻어올 수 있다.
			※Map계열의 컬렉션은 처음부터 개선된 for문을 사용하는 것은 불가능하다.
			아래처럼 key값을 먼저 얻어온 후 사용해야한다.
		 */
		Set<String> keys = map.keySet();
		System.out.println("[확장for문 적용]");
		for(String key : keys)
		{
			String value = map.get(key);
			System.out.println(String.format("%s:%s", key, value));
		}
		
		/*
		5-3] 이터레이터를 통한 출력
			: 이터레이터를 통해 출력할 때도 keySet()을 통해 먼저
			key값을 얻어온 후 반복 출력해야한다.
		 */
		System.out.println("[반복자 사용하기]");
		Set<String> keys2 = map.keySet();
		Iterator<String> it = keys2.iterator();
		while(it.hasNext())
		{
			String key = it.next();
			String value = map.get(key);
			System.out.println(String.format("%s:%s", key, value));
		}
		
		/*
		5-4] Value값만 얻어올 때 : values() 메소드 사용
		 */
		System.out.println("[value값들만 출력하기]");
		Collection<String> values = map.values();
		for(String value : values)
		{
			System.out.println(value);
		}
		
		/*
		6] 존재유무확인
			: key 혹은 value가 존재할 경우 true가 반환된다.
		 */
		System.out.println(map.containsKey("name") ? "name키값있다" : "name키값없다");
		System.out.println(map.containsKey("account") ? "account키값있다" : "account키값없다");
		System.out.println(map.containsKey("남자") ? "남자있다" : "남자없다");
		System.out.println(map.containsKey("여자") ? "여자있다" : "여자없다");
		
		/*
		7] 삭제 : key값을 통해 삭제하고 삭제되면 해당 value가 반환된다.
		 */
		System.out.println("삭제된 객체:"+ map.remove("age"));
		System.out.println("[age키값을 삭제 후 출력]");
		for(String key : keys)
		{
			System.out.println(String.format("%s:%s", key, map.get(key)));
		}
		
		/*
		전체삭제 : removeAll()은 없음. clear()만 사용가능함.
		 */
		map.clear();
		System.out.println("전체삭제 후 객체수:"+ map.size());
	}
}
