--member���̺� ���� memno number 3 name 20 id 20 pw 20 gender 6 address1 100 address2 200
--hobby 24

create table member (
memno number(3),
name varchar2(20),
id varchar2(20),
pw varchar2(20),
gender varchar2(6),
address1 varchar2(100),
address2 varchar2(200),
hobby varchar2(24));

--1,ȫ�浿,aaa,111,male,���� ���α� ����1��,110-1,swim
insert into member values(
1,'ȫ�浿','aaa','1111','male','���� ���α� ����1��','110-1','swim');
insert into member values(
2,'�̼���','bbb','1111','male','���� �������� ��������','100-2','game');
insert into member values(
3,'������','ccc','1111','female','���� ���ı� ���ĵ�','110-3','golf');
insert into member values(
4,'��̼�','ddd','1111','female','���� ������ ������','100-3','read');
insert into member values(
5,'ȫ����','eee','1111','female','���� ���빮�� ���빮��','210-1','game');
commit;
insert into member values(
6,'�谨��','fff','1111','male','���� ���α� �̷ε�','200-1','swim');
insert into member values(
7,'������','ggg','1111','male','���� ���Ǳ� �Ÿ���','100-5','golf');
select * from member;
commit;

--id -> memeid pw ->pass

alter table member rename column id to memid;
alter table member rename column pw to pass;
desc member; 
--�̸� ȫ�� ����� ����Ͻÿ�.
select * from member where name like '%ȫ%';
--������ ������ ����� ���
select * from member where gender like '%female%';
--���α��� ��� ��� ���
select * from member where address1 like '%���α�%';
--age(3) ������ �÷��� �߰�
alter table member add age number(3);

desc member;

alter table member modify gender INVISIBLE;
alter table member modify address1 invisible;
alter table member modify address2 invisible;
alter table member modify hobby invisible;
alter table member modify gender visible;
alter table member modify address1 visible;
alter table member modify address2 visible;
alter table member modify hobby visible;
desc member;
commit;

update member set age=20 where name = 'ȫ�浿';
update member set age=35 where name = '�̼���';
update member set age = 18 where name = '������';
update member set age = 22 where name = '��̼�';
update member set age = 27 where name = 'ȫ����';
update member set age =30 where name = '�谨��';
update member set age = 25 where name = '������';
select * from member;

--���̰� 20,30�� ����� ����Ͻÿ�.
select * from member where age = 20 or age = 30;
select * from member where age in (20,30);
--���̰� 22~27������ ����� ���
--�񱳿�����, between������
select *from member where age >=22 and age<= 27;
select * from member where age between 22 and 27;

-- address2 ���� �ι�° �ڸ����� 1�� ���۵Ǵ� �ּҸ� ���
select * from member where address2 like '_1%';

select -10,abs(-10) from dual;

-- -5�� -1�� ���̴� ���ϱ��? 
select -5- (-1), abs(-5 - (-1)) from dual;

select round(12.57*10)/10 from dual;

-- 58.267845 4�ڸ����� �ݿø�
select round(58.267845*1000)/1000 from dual;
select round(58.267845,3) from dual;
-145.235678 5�ڸ� ����
select floor(145.235678*10000)/10000 from dual;

select * from employees where mod(employee_id,2) = 1;