--�����ȣ ¦���� ���
select * from employees  where mod(employee_id,2) = 0 order by employee_id;

--132.57820 3�ڸ����� �ݿø�
select round(132.57820,2) from dual;

create sequence b_seq
increment by 1 --1������
start with 1 --1���ͽ���
minvalue 1 -- �ּڰ� 1
maxvalue 1000 --�ִ� 1000
nocycle; --����Ŭ X

-- member ���̺� 1�� �����
-- memNo number4,memId 20,memPw 30,name 30,tel 13,gender 5
--address1 100, adress2 100, hobby 30;

create table member(
memNo number(4),
memId varchar2(20),
memPw varchar2(30),
name varchar2(30),
tel varchar2(13),
gender varchar2(5),
address1 varchar2(100),
address2 varchar2(100),
hobby varchar2(30));

desc member;

insert into member values(
b_seq.nextval,'aaa','111','ȫ�浿','010-1111-1111','male','���� ���α� ���ε�','100-11','swim');
--b_seq.nextval��ȣ�־��ֱ�,��ɾ ������ ������ �������� �����ȴ�.
--b_seq.currval ���� ������ ��ȣ�� �����ش�.
commit;

select b_seq.currval from dual;
select * from member;
insert into member values(
b_seq.nextval,'bbb','1111','�̼���','010-2222-2222','male','���� ������ ������','200-1','golf');


select * from member;
--�÷� ������Ÿ�� ����
alter table member modify (gender  varchar2(6));

--memDate �÷� �߰� date
alter table member add memDate date;

update member set memDate = sysdate where memno = 3;
commit;
select * from member;

--��¥�� ���糯¥ ��� ����
update member set memDate = sysdate where memno = 1 or memno = 2;
commit;

-- board ���̺� ����
-- bid number(4),btitle 50, bcontent 2000, bname 30,
--bgroup number(4),bstep number(4),bindent number(4),bdate date, bupload 80

create table board(
bid number(4),
btitle varchar2(50),
bcontent varchar2(2000),
bname varchar2(30),
bgroup number(4),
bstep number(4),
bindent number(4),
bdate date,
bupload varchar(80));

desc board;

insert into board values(
board_seq.nextval,'�Խ�������','�Խ��ǳ����Դϴ�.','ȫ�浿',board_seq.currval,
0,0,sysdate,'1.jpg');

select * from board;
commit;

insert into board values(
board_seq.nextval,'Ȩ������ ����','Ȩ�������� �����߽��ϴ�','������',
board_seq.currval,0,0,sysdate,'2.jpg');

select * from board;
commit;

select board_seq.currval from dual;

insert into board values(
board_seq.nextval,'�̺�Ʈ����','�̺�Ʈ�� �����մϴ�.','������',
board_seq.currval,0,0,sysdate,'3.jpg');

select * from board;
commit;
--bstep ->�鿩���� , bgroup �����ü�� bgroup, bstep ->����� ����

--mem_seq

select * from tab;

select * from member;

insert into member values(
mem_seq.nextval,'ddd','1111','�����','010-4444-4444','male','���� ���α� �ָԵ�','400-4','fight',sysdate);
insert into member values(
mem_seq.nextval,'eee','1111','�Ż��Ӵ�','010-5555-5555','female','��õ ����Ȧ�� ������','500-5','write',sysdate);
insert into member values(
mem_seq.nextval,'fff','1111','����','010-6666-6666','male','��� ���汸 ����','600-6','cook',sysdate);
select * from member;
insert into member values(
mem_seq.nextval,'ggg','1111','�豸','010-7777-7777','male','���� ���α� ����3��','700-7','golf',sysdate);

update member set memno=4,name = 'ȫ����' where memid = 'ddd';
select * from member;
update member set memno=5, name = '��ȫ��' where memid = 'eee';
update member set address1 = '���� ��õ�� ��굿' where memid = 'eee';
update member set memno = 7 where name = '�豸';
select * from member;
update member set address2 = '700-1' where memno = 7;

create table emp01(
empno number(4),
ename varchar2(10),
hiredate date);
--1.emp_seq ������ ����� 1,1,1,1,100000
--2.table ���� - table name =>emp 01 //empno ���� ũ��4 ename ���ڿ� ũ�� 10 hiredate date
--3. nextval�� ����Ͽ� 3���� ������ ����
insert into emp01 values(
emp_seq.nextval,'ȫ�浿',sysdate);
insert into emp01 values(
emp_seq.nextval,'�̼���',sysdate);
insert into emp01 values(
emp_seq.nextval,'������',sysdate);
select * from emp01;

select * from employees order by employee_id;

select count(*) from employees;

select sum(salary) from employees;

select avg(salary) from employees;

select min(salary) from employees;

select emp_name,salary from employees where salary=(select min(salary) from employees);

select max(salary) from employees;

select department_id from employees;

select max(salary) from employees where department_id = 50;

select emp_name,salary from employees 
where department_id = 50 and 
salary = (select max(salary) from employees where department_id =50);

select count(*) from employees;

select emp_name,commission_pct from employees;

select count(commission_pct) from employees;
--count�� ���簪�� �ִ°͸� ���´�.

--��տ��� ���� ���� �޴»���� ����Ͻÿ�
select emp_name,salary from employees where salary>(select avg(salary) from employees);

select count(*) from employees where commission_pct is null ;

select max(salary),min(salary),max(salary)-min(salary) from employees;

select abs(-20) as "���밪" from dual;

create table numData(
num number(3),
varch varchar2(3),
num_varch varchar2(3),
varch_num number(3));

insert into numdata values(
100,'100','300',400);

commit;

update numdata set varch='200' where num = 100;

select * from numdata;

select num,varch_num,num+varch_num from numdata;

select num,varch,varch+num from numdata;

update numdata set varch = 'v200';

alter table numdata modify varch varchar2(4);

select num,varch,num+varch from employees;

select salary as "�޷�����",to_char( salary*1250,'L999,999,999' )as "��ȭ����" from employees;
--$�޷�ǥ�ô� ->�޷�ǥ�� L�� ������ ��ȭǥ��(�ѱ� OSü�� ������)

--���� + Ŀ�̼� �ݾ�, 1000����ǥ�� -�޶�ǥ�� �ְ�
--(���� + Ŀ�̼Ǳݾ�)*1250 1000����

select to_char(salary*12+(salary*nvl(commission_pct,0))*12,'$999,999,999') as "�޷�",
to_char((salary*12+(salary*nvl(commission_pct,0))*12)*1250,'L999,999,999') as "��ȭ" from employees order by "��ȭ" desc; 

select hire_date from employees;
select to_char(hire_date,'yyyy"��"MM"��"dd"��" pm hh"��"mi"��"ss"��"') from employees;

select to_char(bdate,'yyyy-mm-dd pm hh24:mi:ss dy"����"') from board;

insert into board values(
board_seq.nextval,'�������� ����','������ ������ �������˴ϴ�.',
'������',board_seq.currval,0,0,sysdate,'4.jpg');

commit ;

select to_char(bdate,'yyyy-mm-dd pm hh24:mi:ss dy"����"') from board;

select sysdate-to_date('19960322','yyyymmdd') from dual;

select hire_date,floor((sysdate - hire_date)/365) as day from employees order by day;