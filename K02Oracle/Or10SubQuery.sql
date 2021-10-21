/********************
���ϸ� : Or10SubQuery.sql
��������
���� : ������ �ȿ� �� �ٸ� �������� ���� ������ select��
*********************/

/*
������ ��������
    ����]
        select * from ���̺�� where �÷�=(
            select �÷� from ���̺�� where ����
        );
    �ذ�ȣ���� ���������� �ݵ�� �ϳ��� ����� �����ؾ��Ѵ�.
*/

/*
�ó�����] ������̺��� ��ü����� ��ձ޿����� ���� �޿��� �޴� �������
�����Ͽ� ����Ͻÿ�.
    ����׸� : �����ȣ, �̸�, �̸���, ����ó, �޿�
*/
--�ش� �������� ���ƻ� �´µ������� �׷��Լ��� �����࿡ ������ �߸��� ����
select * from employees where salary<avg(salary);--�����߻�
--1�ܰ� : ��ձ޿��� ������ Ȯ��
select round(avg(salary)) from employees;
--2�ܰ� : 6262���� ���� �޿��� �޴� ������ ����
select * from employees where salary<6462;
--3�ܰ� : 2���� �������� �ϳ��� �������������� ��ģ��.
select * from employees 
    where salary<(select round(avg(salary)) from employees);--56�� ����
    
/*
�ó�����] ��ü ��� �� �޿��� ���� ���� ����� �̸��� �޿��� ����ϴ�
������������ �ۼ��Ͻÿ�.
    ����׸� : �̸�1, �̸�2, �̸���, �޿�
*/
--1�ܰ� : �ּұ޿� Ȯ��
select min(salary) from employees;
--2�ܰ� : 2100�� �޴� ����
select * from employees where salary=2100;
--3�ܰ� : ��ġ��
select * from employees 
    where salary=(select min(salary) from employees);
    
/*
�ó�����] ��ձ޿����� ���� �޿��� �޴� ������� ����� ��ȸ�� �� �ִ�
������������ �ۼ��Ͻÿ�.
    ��³��� : �̸�1, �̸�2, ��������, �޿�
�ش��������� jobs ���̺� �����Ƿ� join�ؾ��Ѵ�.
*/
--1�ܰ� : ��ձ޿�
select trunc(avg(salary), 2) from employees;
--2�ܰ� : 
select * from employees where salary >6461.83;
--3�ܰ� : join�� �Ǵ�.
select 
    first_name, last_name, job_title, salary
from employees inner join jobs using(job_id)
where salary>6461.83;
--4�ܰ�
select 
    first_name, last_name, job_title, salary
from employees inner join jobs using(job_id)
where salary>(select trunc(avg(salary), 2) from employees);

/*
������ ��������
    ����]
        select * from ���̺�� where �÷� in (
            select �÷� from ���̺�� where ����
        );
    �� ��ȣ���� ���������� 2�� �̻��� ����� �����ؾ��Ѵ�.
*/

/*
�ó�����] ���������� ���� ���� �޿��� �޴� ����� ����� ��ȸ�Ͻÿ�
    ��¸�� : ������̵�, �̸�, ���������̵�, �޿�
*/
--1�ܰ� : �������� ���� ���� �޿� Ȯ��
select job_id, max(salary)
from employees
group by job_id;
--2�ܰ� : ���� ����� �ܼ��� or�������� �����.
select employee_id, first_name, job_id, salary
from employees
where
    (job_id='IT_PROG' and salary=9000) or
    (job_id='AC_MGR' and salary=12008) or
    (job_id='AC_ACCOUNT' and salary=8300); --19���� or ������ �ʿ���
--3�ܰ� : ������ �����ڸ� ���� ���������� ��ģ��.
select employee_id, first_name, job_id, salary
from employees
where
    (job_id, salary) in 
        (
            select job_id, max(salary)
            from employees
            group by job_id
        );
        
/*
������ ������2 : any
    ���������� �������� ���������� �˻������ �ϳ��̻�
    ��ġ�ϸ� ���� �Ǵ� ������. �� �� �� �ϳ��� �����ϸ� �ش�
    ���ڵ带 �����´�.
*/

/*
�ó�����] ��ü����߿��� �μ���ȣ�� 20�� ������� �޿����� ���� �޿��� �޴�
    �������� �����ϴ� ������������ �ۼ��Ͻÿ�.
*/
--1�ܰ� : 20���μ��� �޿��� Ȯ��
select first_name, salary from employees where department_id=20;
--2�ܰ� : 1�� ����� �ܼ� ������ �ۼ�
select first_name, salary from employees
    where salary>6000 or salary>13000;
--3�ܰ� : �� �� �ϳ��� �����ϸ� ������ ���̹Ƿ� any�� �̿��� ���������� �ۼ�
select first_name, last_name, department_id, salary
    from employees
    where salary>any(select salary from employees where department_id=20);
    /*
        ������ ������ any�� ����ϸ� 2���� ���� or �������� �������
        �����ϰ� �ȴ�. 6000 �Ǵ� 13000 �̻��� ���ڵ常 ����ȴ�.
    */
    
/*
�����࿬����3 : all
    ���������� �������� ���������� �˻������ ��� ��ġ�ؾ�
    ���ڵ带 �����Ѵ�.
*/
select first_name, last_name, department_id, salary
    from employees
    where salary>all(select salary from employees where department_id=20);
    /*
        6000���� ũ�� 13000���ٵ� Ŀ���ϹǷ� ��������� 13000 �̻���
        ���ڵ常 �����ϰ� �ȴ�.
    */


/*
Top���� : ��ȸ�� ������� ������ ���� ���ڵ带 ������ �� ����Ѵ�.
    �ַ� �Խ����� ����¡�� ���ȴ�.
    
    rownum : ���̺��� ���ڵ带 ��ȸ�� ������� ������ �ο��Ǵ�
        ������ �÷��� ���Ѵ�. �ش� �÷��� ��� ���̺� �����Ѵ�.
*/
--��� ���ڵ带 �����´�.
select * from employees;
--���ľ��� ��� ���ڵ带 �����ͼ� rownum�� ����Ѵ�.(rownum�� ������� ����)
select employee_id, first_name, rownum 
    from employees;
--�̸����� �������� ������ �� ����Ѵ�.(rownum�� �������� ����)
select employee_id, first_name, rownum 
    from employees 
    order by first_name asc;
    
select employee_id, first_name from employees order by first_name asc;

select first_name, rownum from
    (select * from employees order by first_name asc);

--������̺��� ������ ������ ���� �������� ���� ����������
select * from
    (select tb.*, rownum rNum from
        (select * from employees order by first_name asc) tb)
--where rNum between 1 and 10;
--where rNum between 11 and 20;
where rNum between 21 and 30;

/*
between�� ������ ���� ���� �������ָ� �ش� �������� ���ڵ常 �����ϰԵȴ�.
���� ������ ���� jSP���� �������� ������ �����Ͽ� ����ؼ� �����Ѵ�.

    3.2�� ��� ��ü�� ������ ����...
        (2.1�� ����� rownum�� ��ο��Ѵ�.
             (1.������̺��� ��� ���ڵ带 ������������ �����ؼ� ����) tb
        )
    �ʿ��� �κ��� between���� ������ ���� �����Ѵ�.
    
*/

/*
04.��� �޿��� ���� ���� ����(job)�� ��� �޿��� ǥ���Ͻÿ�.
*/
--���޺� ��ձ޿� ����
select job, avg(sal) from emp group by job;
--�����߻�. �׷��Լ��� 2�� ���Ʊ� ������ job �÷��� �����ؾ���
select job, min(avg(sal)) from emp group by job;
--��������. ���� �� �ּұ޿� ����.
select min(avg(sal)) from emp group by job;

select job, avg(sal)
    from emp 
        group by job
        having avg(sal)=
    

/*
05.���μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.
*/
--�ܼ� ������ ���� �μ��� �޿� Ȯ��
select deptno, sal from emp order by deptno, sal;
--�׷��Լ��� ���� �μ��� �ּұ޿� Ȯ��
select deptno, min(sal) from emp group by deptno;
--�ܼ� or���� ���� ����
select ename, sal, deptno, sal from emp
    where (deptno=30 and sal=950)
        or (deptno=20 and sal=800)
        or (deptno=10 and sal=1300);
--���������� ������ �����ڸ� ���� ���� �ۼ�
select ename, sal, deptno, sal from emp
    where (deptno, sal) in (select deptno, min(sal) from emp group by deptno);
    
    
/*
06.��� ������ �м���(ANALYST)�� ������� �޿��� �����鼭 ������ 
�м���(ANALYST)�� �ƴ� ������� ǥ ��(�����ȣ, �̸�, ������, �޿�)�Ͻÿ�.
*/
select * from emp where job='ALALYST';
select * from emp where sal<3000 and job<>'ANALYST';
/*
    ANALYST ������ ���� ����� 1���̹Ƿ� �Ʒ��� ���� ������ �����ڷ�
    ���������� ���� �� ������, ���� ����� 2�� �̻��̶�� ������ ��������
    all�̳� any�� �߰��ؾ� �Ѵ�.
*/
select empno, ename, job, sal from emp
    where sal<(select sal from emp where job='ANALYST') and job<>'ANALYST';

/*
07.�̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� ����� �����ȣ�� 
�̸��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�
*/

select * from emp where ename like '%K%';
select * from emp where deptno in (30, 10);
/*
    or������ in���� ǥ���� �� �����Ƿ�, ������������ ������ ��������
    in�� ����Ѵ�. 2�� �̻��� ����� or�� �����Ͽ� ����ϴ� ����� ������.
*/
select * from emp where deptno in (select deptno from emp where ename like '%K%');












