/***********************
파일명 : Or08DML.sql
DML : Data Manipulation Language(데이터 조작어)
설명 : 레코드를 조작할 때 사용하는 쿼리문. 앞에서 학습했던
    select문을 비롯하여 update(레코드수정), delete(레코드삭제),
    insert(레코드입력)가 있다.
***********************/

--study 계정에서 실습합니다.

/*
레코드 입력하기 : insert
    레코드 입력을 위한 쿼리로 문자형은 반드시 ' 로 감싸야한다.
    숫자형은 ' 없이 그냥 쓰면된다. 만약 숫자형을 ' 로 감싸게되면
    자동으로 형변환되어 입력된다.
*/
--실습을 위한 테이블 생성
create table tb_sample (
    dept_no number(10),
    dept_name varchar2(20),
    dept_loc varchar2(15),
    dept_manager varchar2(30)
);
desc tb_sample;
--방식1을 통한 레코드 입력
insert into tb_sample (dept_no, dept_name, dept_loc, dept_manager)
    values (10, '기획실', '서울', '나연');
    insert into tb_sample (dept_no, dept_name, dept_loc, dept_manager)
    values (20, '전산실', '수원', '쯔위');
--방식2
insert into tb_sample values (30, '영업팀', '대구', '모모');
insert into tb_sample values (40, '인사팀', '부산', '지효');

select * from tb_sample;

/*
    지금까지의 작업(트랜잭션)을 그대로 유지하겠다는 명령으로 커밋을
    수행하지 않으면 외부에서는 변경된 레코드를 확인할 수 없다.
    여기서 말하는 외부란 Java/JSP와 같은 Oracle 이외의 프로그램을 말한다.
*/
commit;

--커밋 이후 새로운 레코드를 삽입하면 임시테이블에 저장된다.
insert into tb_sample values (50, '금융팀', '제주', '아이린');
--오라클에서 확인하면 실제 삽입된 것처럼 보인다. 하지만 실제 반영되지 않은 상태이다.
select * from tb_sample;
--롤백 명령으로 마지막 커밋 상태로 되돌릴 수 있다.
rollback;
--마지막에 입력했던 아이린 레코드는 사라진다.
select * from tb_sample;

/*
    rollback 명령은 마지막 커밋 상태로 되돌려준다.
    즉, commit한 이전의 상태로는 rollback 할 수 없다.
*/

/*
레코드 수정하기 : update
    형식]
        update 테이블명
        set 컬럼1=값1, 컬럼2=값2, .....
        where 조건;
    ※조건이 없는 경우 모든 레코드가 한꺼번에 수정된다.
    ※테이블명 앞에 from이 들어가지 않는다.
*/
--부서번호 40인 레코드의 지역을 미국으로 수정하시오.
update tb_sample set dept_loc='미국' where dept_no=40;
select * from tb_sample;
--지역이 서울인 레코드의 매니저명을 '박진영'으로 수정하시오.
update tb_sample set dept_manager='박진영' where dept_loc='서울';
select * from tb_sample;

--where절 없이 모든 레코드를 대상으로 지역을 '가산디지털'로 변경하시오.
update tb_sample set dept_loc='가산디지털';
select * from tb_sample;

/*
레코드 삭제하기 : delete
    형식]
        delete from 테이블명 where 조건;
        ※레코드를 삭제하므로 delete 뒤에 컬럼을 명시하지 않는다.
*/
delete from tb_sample where dept_no=10;
delete from tb_sample;
select * from tb_sample;

--마지막으로 커밋했던 지점으로 되돌린다.
rollback;
select * from tb_sample;

/*
DML문 : 레코드를 입력 및 조작하는 쿼리문
    레코드입력 : insert into 테이블명 (컬럼) values (값)
    레코드수정 : update 테이블명 set 컬럼=값 where 조건
    레코드삭제 : delete from 테이블명 where 조건
    레코드조회 : select 컬럼 from 테이블명 where 조건
*/

