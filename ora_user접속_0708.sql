desc mvc_board;

select * from mvc_board;

--시퀀스mvc_seq 
--시퀀스,홍길동,이벤트1,이벤트 내용1,현재날짜,1,시퀀스,1,1
--시퀀스,이순신,이벤트2,이벤트 내용2,현재날짜,1,시퀀스,1,1
--시퀀스,유관순,이벤트3,이벤트 내용3,현재날짜,1,시퀀스,1,1
--시퀀스,홍길자,이벤트4,이벤트 내용4,현재날짜,1,시퀀스,1,1
--시퀀스,이길동,이벤트5,이벤트 내용5,현재날짜,1,시퀀스,1,1
insert into mvc_board values(
mvc_seq.nextval,'홍길동','이벤트1','이벤트내용1',sysdate,1,mvc_seq.currval,1,1);
insert into mvc_board values(
mvc_seq.nextval,'이순신','이벤트2','이벤트내용2',sysdate,1,mvc_seq.currval,1,1);
insert into mvc_board values(
mvc_seq.nextval,'유관순','이벤트3','이벤트내용3',sysdate,1,mvc_seq.currval,1,1);
select * from mvc_board;

commit;
insert into mvc_board values(
mvc_seq.nextval,'홍길자','이벤트4','이벤트내용4',sysdate,1,mvc_seq.currval,1,1);
insert into mvc_board values(
mvc_seq.nextval,'이길동','이벤트5','이벤트내용5',sysdate,1,mvc_seq.currval,1,1);
select * from mvc_board;
commit;
update mvc_board set b_indent = 0 ;
select * from mvc_board;
commit;
insert into mvc_board values(
mvc_seq.nextval,'홍길순','▶이벤트3_1','▶이벤트내용3_1',sysdate,1,3,2,1);
select * from mvc_board;
commit;
select * from mvc_board
order by b_group desc, b_step asc;

insert  into mvc_board values(
mvc_seq.nextval,'홍유홍','▶이벤트3_2','▶이벤트내용3_2',sysdate,1,3,3,1);
commit;
select * from mvc_board order by b_group desc,b_step asc;
--step은 출력되는 순서 indent는 들여쓰기

insert into mvc_board values(
mvc_seq.nextval,'김구라','　▶이벤트3_1_1','　▶이벤트내용3_1_1',sysdate,1,3,4,2);
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
mvc_seq.currval,'김유신','▶이벤트3_3','▶이벤트내용3_3',sysdate,1,3,5,1);
select * from mvc_board order by b_group desc, b_step asc;
commit;

update mvc_board set b_step = b_step+1 where b_step>3;

insert into mvc_board values(
mvc_seq.nextval,'강감찬','　▶이벤트3_1_2','　▶이벤트내용3_1_2',sysdate,1,3,4,2);
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
mvc_seq.nextval,'홍길자','게시판제목','게시판내용',sysdate,mvc_seq.currval);
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
values(6,'김유신');
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
3,'유관순',100,100,100,300,'F');

select * from stu_score;

create table dept01(
deptno number(4) primary key,
deptname varchar2(20) not null,
address1 varchar2(20) default '서울시 구로구',
address2 varchar2(20) default '100-0');

insert into dept01(deptno,deptname,address1) values(
4,'홍길동','서울시동작구');
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
7,'홍길동',5);
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
1,'총무부');
select * from dept01 ;
insert into dept01 values(2,'마케팅부');
insert into dept01 values(3,'홍보부');

insert into emp01 values(
1,'홍길동','M',1);
insert into emp01 values(
2,'이순신','M',4);

commit;

select empname,e.deptno,deptname from emp01 e,dept01 d
where e.deptno = d.deptno;
select * from emp01;
update emp01 set deptno = 2 where empno =2;
alter table dept01 add  CONSTRAINT fk_empno foreign key(empno) references dept01(empno);

alter table emp01 add foreign key(deptno) references dept01(deptno) on delete cascade;

select * from emp01;

insert into emp01 values(
4,'강감찬','M',2);

select * from dept01;

delete dept01  where deptno = 3;

select job_id from employees;

-- SH_CLERK -> salary+salary*0.1
-- MK_MAN -> salary+salary*0.2
-- MK_REP -> salary+salary*0.17
-- 나머지 -> salary+salary*0.13

select job_id,decode(job_id,'SH_CLERK',salary*1.1
,'MK_MAN',salary*1.2,'MK_REP',salary*1.17,floor(salary*1.13)) as "인상후 월급" 
from employees;

select job_id, 
case when job_id = 'SH_CLERK' then salary*1.1
when job_id = 'MK_MAN' then salary*1.2
when job_id = 'MK_REP' then salary*1.17
else floor(salary*1.13) end as "인상후 월급" from employees;

--8000 -> 10%
-- 6000 -> 15%
-- 4000 -> 18%
-- 20%

select emp_name,salary,
case
when salary>=8000 then salary*1.1
when salary>=6000 then salary * 1.15
when salary >= 4000 then salary*1.18
else salary*1.2 end as "인상후 월급 " from employees;

select count(*) from employees;

select count(manager_id) from employees;

select manager_id from employees;
select nvl(to_char(manager_id),'CEO') from employees;

select sum(salary) from employees;
select max(salary) from employees;

select emp_name,salary from employees where salary = (select max(salary) from employees);

--최소월급 받는 사람의 사원명, 월급, 부서번호, 부서이름

select e.emp_name,e.salary,e.department_id,d.department_name
from employees e , departments d where e.department_id = d.department_id
and salary = (select min(salary) from employees);

select department_id,max(salary),min(salary) from employees group by department_id order by department_id;

--부서별 부서명 월급의 평균을 출력하시오 한화로 변경

select e.department_id,department_name,to_char(trunc(avg(e.salary))*1250,'L999,999,999') as 평균급여 
from employees e, departments d 
where e.department_id = d.department_id group by e.department_id,department_name ;

--foreign key에 연결된 primary key 없는데이터를 넣으려고 하면 error 처리