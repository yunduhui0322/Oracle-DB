drop table emp01;
drop table dept01;

create table emp01 as select employee_id,emp_name,department_id,department_name,job_id,job_title from employees join departments using (department_id) join jobs using(job_id);

insert into emp01 select employee_id,emp_name,department_id,department_name,job_id,job_title from employees  left outer join departments using (department_id) join jobs using(job_id) where emp_name = 'Kimberely Grant';
create table salary_grade (
grade number(1),
low_salary number(5),
max_salary number(5)
);

insert into salary_grade values(
1,8000,30000);
insert into salary_grade values(
2,6000,7999);
insert into salary_grade values(
3,5000,5999);
insert into salary_grade values(
4,4000,4999);
insert into salary_grade values(
5,0,3999);

select * from emp01;

drop table member;

--id,pw,name,phone,gender,address1,address2

create table member(
id varchar2(20) primary key,
pw varchar2(30) not null,
phone varchar2(13) not null,
name varchar2(10) not null,
address1 varchar2(100) not null,
address2 varchar2(100) not null);

insert into member values(
'aaa','1234','010-1111-1111','홍길동','서울시 구로구 구로동','101-1');
insert into member values(
'bbb','1111','010-2222-2222','이순신','인천시 연수구 옥련동','101-2');
insert into member values(
'ccc','2222','010-3333-3333','유관순','인천시 미추홀구 용현동','101-3');

drop table member;

create table member(
mid varchar2(20) primary key,
mpw varchar2(30) not null,
mname varchar2(30) not null,
mphone varchar2(11),
mgender varchar2(1) check (mgender in ('M','F')),
maddress1 varchar2(50),
maddress2 varchar2(80),
mhobby varchar2(40));

insert into member values(
mem_seq.nextval,'1111','홍길동','01011111111',
'M','서울시 구로구 구로동','110-1','swim,golf,run,read');
insert into member values(
mem_seq.nextval,'2222','이순신','01022222222','M','서울시 영등포구 영등포동','200-1',
'swim,run,read');
insert into member values(
mem_seq.nextval,'3333','유관순','01033333333','F','서울시 금천구 금천동','300-1','run,read');
commit;
select * from member;

--member2
--employees의 employee_id,emp_name,phone_number

select * from employees;

create table member2 as select employee_id,emp_name,phone_number from employees;

select * from member2 order by employee_id;

insert into member2 select employee_id,emp_name,phone_number from employees order by employee_id;

delete member2;
commit;

select * from member2;

--전화번호는 5자리까지만 입력하시오.

insert into member2 select employee_id,emp_name,substr(phone_number,1,5) from employees order by employee_id;
select * from member2;
select * from employees;
rollback;
commit;

delete member2;

--이름은 S 1개라도 들어가 있는 사람만 입력하시오
insert into member2 select employee_id,emp_name,phone_number from employees where upper(emp_name) like '%S%';

select * from member2;

select * from tab;

drop table member2;

select * from employees;

create table member2 as select employee_id,department_id,emp_name from employees;

select * from member2;

drop table member2;
-- member2 테이블 생성
-- employee_id,emp_name,department_id,department_name,job_id,job_title

create table member2 as select employee_id,emp_name,department_id,department_name,job_id,job_title
from employees  left outer join departments  using(department_id) inner join jobs  using (job_id);

select * from member2;

desc member2;

drop table member2;

--member2테이블 생성
-- employee_id,emp_naem,salary,rank
--8000이상 1등급,7000이상 2등급,6000이상3등급,4000이상 4등급, 그외 5등급
-- rank varchar2(7)
create table member2 as select employee_id,emp_name,salary,case
when salary >= 8000 then '1등급'
when salary >= 7000 then '2등급'
when salary >= 6000 then '3등급'
when salary >= 4000 then '4등급'
else '5등급' end as rank  from employees;

select * from member2;

alter table member2 modify rank varchar2(7);
