/***********************
���ϸ� : Or08DML.sql
DML : Data Manipulation Language(������ ���۾�)
���� : ���ڵ带 ������ �� ����ϴ� ������. �տ��� �н��ߴ�
    select���� ����Ͽ� update(���ڵ����), delete(���ڵ����),
    insert(���ڵ��Է�)�� �ִ�.
***********************/

--study �������� �ǽ��մϴ�.

/*
���ڵ� �Է��ϱ� : insert
    ���ڵ� �Է��� ���� ������ �������� �ݵ�� ' �� ���ξ��Ѵ�.
    �������� ' ���� �׳� ����ȴ�. ���� �������� ' �� ���ΰԵǸ�
    �ڵ����� ����ȯ�Ǿ� �Էµȴ�.
*/
--�ǽ��� ���� ���̺� ����
create table tb_sample (
    dept_no number(10),
    dept_name varchar2(20),
    dept_loc varchar2(15),
    dept_manager varchar2(30)
);
desc tb_sample;
--���1�� ���� ���ڵ� �Է�
insert into tb_sample (dept_no, dept_name, dept_loc, dept_manager)
    values (10, '��ȹ��', '����', '����');
    insert into tb_sample (dept_no, dept_name, dept_loc, dept_manager)
    values (20, '�����', '����', '����');
--���2
insert into tb_sample values (30, '������', '�뱸', '���');
insert into tb_sample values (40, '�λ���', '�λ�', '��ȿ');

select * from tb_sample;

/*
    ���ݱ����� �۾�(Ʈ�����)�� �״�� �����ϰڴٴ� ������� Ŀ����
    �������� ������ �ܺο����� ����� ���ڵ带 Ȯ���� �� ����.
    ���⼭ ���ϴ� �ܺζ� Java/JSP�� ���� Oracle �̿��� ���α׷��� ���Ѵ�.
*/
commit;

--Ŀ�� ���� ���ο� ���ڵ带 �����ϸ� �ӽ����̺� ����ȴ�.
insert into tb_sample values (50, '������', '����', '���̸�');
--����Ŭ���� Ȯ���ϸ� ���� ���Ե� ��ó�� ���δ�. ������ ���� �ݿ����� ���� �����̴�.
select * from tb_sample;
--�ѹ� ������� ������ Ŀ�� ���·� �ǵ��� �� �ִ�.
rollback;
--�������� �Է��ߴ� ���̸� ���ڵ�� �������.
select * from tb_sample;

/*
    rollback ����� ������ Ŀ�� ���·� �ǵ����ش�.
    ��, commit�� ������ ���·δ� rollback �� �� ����.
*/

/*
���ڵ� �����ϱ� : update
    ����]
        update ���̺��
        set �÷�1=��1, �÷�2=��2, .....
        where ����;
    �������� ���� ��� ��� ���ڵ尡 �Ѳ����� �����ȴ�.
    �����̺�� �տ� from�� ���� �ʴ´�.
*/
--�μ���ȣ 40�� ���ڵ��� ������ �̱����� �����Ͻÿ�.
update tb_sample set dept_loc='�̱�' where dept_no=40;
select * from tb_sample;
--������ ������ ���ڵ��� �Ŵ������� '������'���� �����Ͻÿ�.
update tb_sample set dept_manager='������' where dept_loc='����';
select * from tb_sample;

--where�� ���� ��� ���ڵ带 ������� ������ '���������'�� �����Ͻÿ�.
update tb_sample set dept_loc='���������';
select * from tb_sample;

/*
���ڵ� �����ϱ� : delete
    ����]
        delete from ���̺�� where ����;
        �ط��ڵ带 �����ϹǷ� delete �ڿ� �÷��� ������� �ʴ´�.
*/
delete from tb_sample where dept_no=10;
delete from tb_sample;
select * from tb_sample;

--���������� Ŀ���ߴ� �������� �ǵ�����.
rollback;
select * from tb_sample;

/*
DML�� : ���ڵ带 �Է� �� �����ϴ� ������
    ���ڵ��Է� : insert into ���̺�� (�÷�) values (��)
    ���ڵ���� : update ���̺�� set �÷�=�� where ����
    ���ڵ���� : delete from ���̺�� where ����
    ���ڵ���ȸ : select �÷� from ���̺�� where ����
*/

