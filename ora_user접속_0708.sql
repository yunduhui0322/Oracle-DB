desc mvc_board;

select * from mvc_board;

--������mvc_seq 
--������,ȫ�浿,�̺�Ʈ1,�̺�Ʈ ����1,���糯¥,1,������,1,1
--������,�̼���,�̺�Ʈ2,�̺�Ʈ ����2,���糯¥,1,������,1,1
--������,������,�̺�Ʈ3,�̺�Ʈ ����3,���糯¥,1,������,1,1
--������,ȫ����,�̺�Ʈ4,�̺�Ʈ ����4,���糯¥,1,������,1,1
--������,�̱浿,�̺�Ʈ5,�̺�Ʈ ����5,���糯¥,1,������,1,1
insert into mvc_board values(
mvc_seq.nextval,'ȫ�浿','�̺�Ʈ1','�̺�Ʈ����1',sysdate,1,mvc_seq.currval,1,1);
insert into mvc_board values(
mvc_seq.nextval,'�̼���','�̺�Ʈ2','�̺�Ʈ����2',sysdate,1,mvc_seq.currval,1,1);
insert into mvc_board values(
mvc_seq.nextval,'������','�̺�Ʈ3','�̺�Ʈ����3',sysdate,1,mvc_seq.currval,1,1);
select * from mvc_board;

commit;
insert into mvc_board values(
mvc_seq.nextval,'ȫ����','�̺�Ʈ4','�̺�Ʈ����4',sysdate,1,mvc_seq.currval,1,1);
insert into mvc_board values(
mvc_seq.nextval,'�̱浿','�̺�Ʈ5','�̺�Ʈ����5',sysdate,1,mvc_seq.currval,1,1);
select * from mvc_board;
commit;
update mvc_board set b_indent = 0 ;
select * from mvc_board;
commit;
insert into mvc_board values(
mvc_seq.nextval,'ȫ���','���̺�Ʈ3_1','���̺�Ʈ����3_1',sysdate,1,3,2,1);
select * from mvc_board;
commit;
select * from mvc_board
order by b_group desc, b_step asc;

insert  into mvc_board values(
mvc_seq.nextval,'ȫ��ȫ','���̺�Ʈ3_2','���̺�Ʈ����3_2',sysdate,1,3,3,1);
commit;
select * from mvc_board order by b_group desc,b_step asc;
--step�� ��µǴ� ���� indent�� �鿩����

insert into mvc_board values(
mvc_seq.nextval,'�豸��','�����̺�Ʈ3_1_1','�����̺�Ʈ����3_1_1',sysdate,1,3,4,2);
update mvc_board set b_step = 3 where b_step =4;
select * from mvc_board order by b_group desc, b_step asc;
update mvc_board set b_step =3,b_id = 8 where b_id = 9;

select * from mvc_board order by b_group desc, b_step asc;
delete mvc_board where b_id = 8;
select * from mvc_board;

update mvc_board set b_step = b_step+1
where b_step>2 ;
select * from mvc_board order by b_group desc, b_step asc;

insert into mvc_board values(
mvc_seq.currval,'������','���̺�Ʈ3_3','���̺�Ʈ����3_3',sysdate,1,3,5,1);
select * from mvc_board order by b_group desc, b_step asc;
commit;

update mvc_board set b_step = b_step+1 where b_step>3;

insert into mvc_board values(
mvc_seq.nextval,'������','�����̺�Ʈ3_1_2','�����̺�Ʈ����3_1_2',sysdate,1,3,4,2);
select * from mvc_board order by b_group desc, b_step asc;

alter table mvc_board add b_upload varchar2(30);
desc mvc_board;

update mvc_board set b_upload = '1.jpg' where b_id = 1;
update mvc_board set b_upload = '2.jpg' where b_id = 2;
update mvc_board set b_upload = '10.jpg' where b_id = 10;

select * from mvc_board order by b_group desc,b_step asc;

alter table mvc_board rename column image to b_image;

alter table mvc_board modify b_image varchar2(50);

commit ;
desc mvc_board;

alter table mvc_board add b_image2 varchar2(50);
alter table mvc_board drop column b_image2;

insert into mvc_board(b_id,b_name,b_title,b_content,b_date,b_group) values(
mvc_seq.nextval,'ȫ����','�Խ�������','�Խ��ǳ���',sysdate,mvc_seq.currval);
select * from mvc_board;

update mvc_board set b_group = 6 where b_id = 11;

select * from mvc_board;


desc mvc_board;

alter table mvc_board modify b_group number(4) not null;
rollback;

create table emp02(
empno number(4) primary key,
ename varchar2(20) not null,
job varchar2(10) unique,
deptno number(2));

insert into emp02(empno,ename)
values(6,'������');
select * from emp02;

select employee_id, emp_name,department_id from employees;

select e.employee_id,e.emp_name,e.department_id,department_name from employees e, departments d
where e.department_id = d.department_id;
--emp_name,job_title
select e.emp_name,job_title from employees e, jobs j 
where e.job_id = j.job_id;

create table stu_score (
stuno number(4) primary key,
stuname varchar2(20) not null,
kor number(3) check(kor between 0 and 100),
eng number(3) check(eng between 0 and 100),
math number(3) check(math between 0 and 100),
total number(3) check (total between 0 and 300),
gender varchar2(1) check(gender in ('M','F')));

insert into stu_score values(
3,'������',100,100,100,300,'F');

select * from stu_score;

create table dept01(
deptno number(4) primary key,
deptname varchar2(20) not null,
address1 varchar2(20) default '����� ���α�',
address2 varchar2(20) default '100-0');

insert into dept01(deptno,deptname,address1) values(
4,'ȫ�浿','����õ��۱�');
select * from dept01;
commit;

alter table dept01
add empno number(4) ;
desc dept01;
select * from emp02;
update dept01 set empno = 1;
select * from dept01;
alter table dept01 add CONSTRAINT fk_empno foreign key (empno) references emp02(empno);

desc dept01;
select * from dept01;
select * from emp02;
insert into dept01(deptno,deptname,empno) values(
7,'ȫ�浿',5);
commit;

delete emp02 where empno=5;

drop table emp;

drop table emp01;
create table emp01(
empno number(4) primary key,
empname varchar2(20) not null,
gender varchar2(1) check(gender in ('M','F')),
deptno number(4));

create table dept01(
deptno number(4) primary key,
deptname varchar2(20) not null);

insert into dept01 values(
1,'�ѹ���');
select * from dept01 ;
insert into dept01 values(2,'�����ú�');
insert into dept01 values(3,'ȫ����');

insert into emp01 values(
1,'ȫ�浿','M',1);
insert into emp01 values(
2,'�̼���','M',4);

commit;

select empname,e.deptno,deptname from emp01 e,dept01 d
where e.deptno = d.deptno;
select * from emp01;
update emp01 set deptno = 2 where empno =2;
alter table dept01 add  CONSTRAINT fk_empno foreign key(empno) references dept01(empno);

alter table emp01 add foreign key(deptno) references dept01(deptno) on delete cascade;

select * from emp01;

insert into emp01 values(
4,'������','M',2);

select * from dept01;

delete dept01  where deptno = 3;

select job_id from employees;

-- SH_CLERK -> salary+salary*0.1
-- MK_MAN -> salary+salary*0.2
-- MK_REP -> salary+salary*0.17
-- ������ -> salary+salary*0.13

select job_id,decode(job_id,'SH_CLERK',salary*1.1
,'MK_MAN',salary*1.2,'MK_REP',salary*1.17,floor(salary*1.13)) as "�λ��� ����" 
from employees;

select job_id, 
case when job_id = 'SH_CLERK' then salary*1.1
when job_id = 'MK_MAN' then salary*1.2
when job_id = 'MK_REP' then salary*1.17
else floor(salary*1.13) end as "�λ��� ����" from employees;

--8000 -> 10%
-- 6000 -> 15%
-- 4000 -> 18%
-- 20%

select emp_name,salary,
case
when salary>=8000 then salary*1.1
when salary>=6000 then salary * 1.15
when salary >= 4000 then salary*1.18
else salary*1.2 end as "�λ��� ���� " from employees;

select count(*) from employees;

select count(manager_id) from employees;

select manager_id from employees;
select nvl(to_char(manager_id),'CEO') from employees;

select sum(salary) from employees;
select max(salary) from employees;

select emp_name,salary from employees where salary = (select max(salary) from employees);

--�ּҿ��� �޴� ����� �����, ����, �μ���ȣ, �μ��̸�

select e.emp_name,e.salary,e.department_id,d.department_name
from employees e , departments d where e.department_id = d.department_id
and salary = (select min(salary) from employees);

select department_id,max(salary),min(salary) from employees group by department_id order by department_id;

--�μ��� �μ��� ������ ����� ����Ͻÿ� ��ȭ�� ����

select e.department_id,department_name,to_char(trunc(avg(e.salary))*1250,'L999,999,999') as ��ձ޿� 
from employees e, departments d 
where e.department_id = d.department_id group by e.department_id,department_name ;

--foreign key�� ����� primary key ���µ����͸� �������� �ϸ� error ó��