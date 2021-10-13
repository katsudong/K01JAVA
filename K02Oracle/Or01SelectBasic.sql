/***********************
���ϸ� : Or01SelectBasic.sql
ó������ �����غ��� ���Ǿ�(SQL�� Ȥ�� Query��)
���� : select, where �� ���� �⺻���� DQL�� ����غ���
************************/

/*
SQL Developer���� �ּ� ����ϱ�
    �������ּ� : �ڹٿ� ������
    ���δ����ּ� : -- ���๮��. ������ 2���� �������� ���
*/

--select�� : ���̺� ����� ���ڵ带 ��ȸ�ϴ� SQL������ DQL���� �ش��Ѵ�.
/*
����]
    select �÷�1, �÷�2, .....[�Ǵ� *]
    from ���̺��
    where ����1 and ����2 or ����3
    order by �������÷� asc(��������), desc(��������) ;
*/

--������̺� ����� ��� ���ڵ带 ��ȸ�ϱ�
select * from employees;

/*
�÷����� �����ؼ� �����ڰ� ������� �÷��� ��ȸ�ϱ�
=> �����ȣ, �̸�, �̸���, �μ����̵� ��ȸ�غ���
*/
select employee_id, first_name, last_name, email, department_id from employees;

--���̺��� �Ӽ��� �ڷ����� Ȯ���ϴ� ��ɾ�
desc employees;

--�ش� �÷��� number(����)�� ��� ��������� ���� 
select employee_id, first_name, salary, salary+100 from employees;
--���� Ÿ���� �÷������� ���굵 �����ϴ�
select employee_id, first_name, salary, commission_pct, salary+commission_pct
    from employees;
    
/*
AS(�˸��ƽ�) : ���̺� Ȥ�� �÷��� ��Ī(����)�� �ο��� �� ����Ѵ�.
    ���� ���ϴ� �̸�(����, �ѱ�)���� ������ �� ����� �� �ִ�.
    Ȱ���] ���� 2�� �̻��� ���̺��� JOIN(����)�ؾ� �� ��� Į������
    �ߺ��� �� �����ϴ� �뵵�� ����Ѵ�.
*/
select first_name, salary, salary+100 as "�޿�100����" from employees;
select first_name, salary, salary+100 as salaryUp100 from employees;

--as�� ������ �� �ִ�.
select employee_id "������̵�", first_name, last_name "��"
    from employees where first_name='William';
    
--����Ŭ�� �⺻������ ��ҹ��ڸ� �������� �ʴ´�. ������ �� �� ����� �� �ִ�.
SELECT employee_id "�����ȣ", first_name, email
    FROM employees WHERE first_name='Alexander';

--��, ���ڵ��� ��� ��ҹ��ڸ� �����Ѵ�. �Ʒ� SQL�������� �ƹ��� ����� ��µ��� �ʴ´�.
SELECT employee_id "�����ȣ", first_name, email
    FROM employees WHERE first_name='ALEXander'; --�̸��� ��ҹ��ڰ� �߸��Էµ�
    
/*
where���� �̿��ؼ� ���ǿ� �´� ���ڵ� �����ϱ�
    : last_name�� Smith�� ���ڵ带 �����Ѵ�.
    ����] where���� ������ �Է��� �� �÷��� �������̸�
    �̱������̼��� ����ؾ��Ѵ�. �������� ��� ������ �� �ִ�.
*/
select * from employees where last_name='Smith'; --2������
select * from employees where last_name='Smith'and salary=8000; --1������
select * from employees where last_name='Smith'or salary=8000; --4������

/*
�񱳿����ڸ� ���� �����ۼ�
    : �̻�, ���Ͽ� ���� ���ǿ� >, <= �� ���� �񱳿����ڸ� ����� �� �ִ�.
    ��¥�� ��� ������ ��¥�� ���� ���ǵ� �����ϴ�.
*/
--�޿��� 5000�̸��� ����� ������ �����Ͻÿ�.
select * from employees where salary<5000;
--�Ի����� 04��0101�� ������ ��� ������ �����Ͻÿ�
select * from employees where hire_date>='04/01/01';

/*
in������ : or �����ڿ� ����� ������� �ϳ��� �÷��� ����������
    ������ �ɰ���� �� ����ϴ� ������.
    �޿��� 4200, 6400, 8000�� ������ ������ ��ȸ�Ͻÿ�.
*/

--���1 : or�� ����Ѵ�. �÷����� �ݺ������� ����ؾ��Ѵ�.
select * from employees where salary=4200 or salary=6400 or salary=8000;
--���2 : in�� ����ϸ� �÷����� �ѹ��� ����ϸ� �ǹǷ� ���ϴ�.
select * from employees where salary in (4200, 6400, 8000);

/*
not������ : �ش� ������ �ƴ� ���ڵ带 �����´�.
    �μ���ȣ�� 50�� �ƴ� ��������� ��ȸ�Ͻÿ�.
*/
select * from employees where department_id<>50;
select * from employees where not (department_id=50);

/*
between and ������ : �÷��� ������ ���� �˻��� �� ����Ѵ�.
    �޿��� 4000~8000 ������ ��������� ��ȸ�Ͻÿ�.
*/
select * from employees where salary>=4000 and salary<=8000;
select * from employees where salary between 4000 and 8000;


/*
distinct : �÷����� �ߺ��Ǵ� ���ڵ带 ������ �� ����Ѵ�.
    Ư�� �������� select ���� �� �ϳ��� �÷����� �ߺ��Ǵ� ����
    �ִ� ��� �ߺ����� ������ �� ����� ����� �� �ִ�.
*/

select job_id from employees;
select distinct job_id from employees;

/*
like������ : Ư�� Ű���带 ���� ���ڿ� �˻��ϱ�
    ����) �÷��� like '%�˻���%'
    ���ϵ�ī�� ����
        % : ��� ���� Ȥ�� ��� ���ڿ��� ��ü�Ѵ�.
        Ex) D�� �����ϴ� �ܾ� : D% -> Da, Dae, Daewoo
            Z�� ������ �ܾ� : %Z -> aZ, abcZ
            C�� ���ԵǴ� �ܾ� : %C% -> aCb, abCde, Vitamin-C
        - : ����ٴ� �ϳ��� ���ڸ� ��ü�Ѵ�.
        Ex) D�� �����ϴ� 3������ �ܾ� : D__ -> Dab, Ddd, Dxy
            A�� �߰��� ���� 3������ �ܾ� : _A_ -> aAa, xAy
*/

--first_name�� 'D'�� �����ϴ� ������ �˻��Ͻÿ�.
select * from employees where first_name like 'D%';
--first_name�� ����° ���ڰ� 'a'�� ������ �����Ͻÿ�.
select * from employees where first_name like '__a%';
--last_name���� y�� ������ ������ �����Ͻÿ�.
select * from employees where last_name like '%y';
--��ȭ��ȣ�� 1344�� ���Ե� ���� ��ü�� �˻��Ͻÿ�.
select * from employees where phone_number like '%1344%';

/*
���ڵ� �����ϱ�(Sorting)
    ������������ : order by �÷��� asc (Ȥ�� ��������)
    ������������ : order by �÷��� desc
    
    2�� �̻��� �÷����� �����ؾ� �� ��� �޸��� �����ؼ� �����Ѵ�.
    ��, �� �� ���� �Է��� �÷����� ���ĵ� ���¿��� �ι�° �÷��� ���ĵȴ�.
*/

/*
����������̺��� �޿��� ������������ ���������� �������� �����Ͽ� ��ȸ�Ͻÿ�
����� �÷� : first_name, salary, email, phone_number
*/
select first_name, salary, email, phone_number from employees
    order by salary asc;
    
/*
�μ���ȣ�� ������������ ������ �� �ش� �μ����� ���� �޿��� �޴� ������
���� ��µǵ��� �ϴ� SQL���� �ۼ��Ͻÿ�
����׸� : �����ȣ, �̸�, ��, �޿�, �μ���ȣ
*/
select employee_id, first_name, last_name, salary, department_id from employees
    order by department_id desc, salary asc;
    
/*
is null Ȥ�� is not null
    : ���� null�̰ų� null�� �ƴ� ���ڵ� ��������
    �÷� �� null���� ����ϴ� ��� ���� �Է����� ������ null���� �Ǵµ�
    �̸� ������� select�� �� ����Ѵ�.
*/

--���ʽ����� ���� ����� ��ȸ�Ͻÿ�
select * from employees where commission_pct is null;

--���ʽ����� �ִ� ����� ��ȸ�Ͻÿ�
select * from employees where commission_pct is not null;

--��������̸鼭 �޿��� 8000�̻��� ����� ��ȸ�Ͻÿ�
select * from employees where salary>=8000 and commission_pct is not null;