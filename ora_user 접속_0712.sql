select e.emp_name,department_id,d.department_name from employees e join departments d using (department_id) ;

select  * from employees;

select employee_id,emp_name,department_id from employees;

select employee_id,emp_name,department_id,department_name from employees e join departments d using(department_id);

select * from employees,departments;

select emp_name,employees.department_id,department_name from employees, departments where employees.department_id = departments.department_id;


select * from jobs;

select emp_name,job_id from employees;

select job_id,job_title from jobs;

--sql구문

select emp_name,jobs.job_id,jobs.job_title from employees, jobs where employees.job_id = jobs.job_id;

select employee_id,department_id,job_id from employees;

select department_id,department_name from departments;

select job_id,job_title from jobs;

--employees 테이블 중,
--department_id를 fk로 등록하겠다. departments테이블에 department_id를
alter table employees add constraint fk_department_id foreign key (department_id) references departments (department_id);
alter table employees add constraint fk_job_id foreign key (job_id) references jobs (job_id);

select * from employees;

-- Jennifer Whalen의 부서이름을 출력하시오

select emp_name,department_name from employees e , departments d
where e.emp_name = 'Jennifer Whalen' and e.department_id = d.department_id;

--Jennifer Whalen 의 월급,직급의 월급의 최소값과 최대값을 출력하시오

select e.emp_name,e.salary,max_salary,min_salary from employees e, jobs j where e.job_id = j.job_id and e.emp_name = 'Jennifer Whalen' ;
select e.emp_name,e.salary,max_salary,min_salary from employees e, jobs j where e.job_id = j.job_id and emp_name = 'Jennifer Whalen' ;

-- IT PROG,FI_ACCOUNT 직급의 사원명, 직급명,월급,최소월급,최대월급

select e.job_id,emp_name,salary,job_title,min_salary,max_salary
from employees e, jobs j where e.job_id = j.job_id and (e.job_id = 'IT_PROG' or e.job_id = 'FI_ACCOUNT') ;

select * from jobs;

-- 3000 -->>5등급, 5000 -->> 4등급, 6000-->> 3등급 7000-->> 2등급 8000 -->>1등급
--이라고 출력 해보세요

select emp_name,salary,
case when salary <=3000 then '5등급'
when salary <=5000 then '4등급'
when salary <=6000 then '3등급'
when salary < 8000 then '2등급'
when salary >=8000 then '1등급'
end as 등급 from employees;

select emp_name,e.department_id,department_name from employees e, departments d where e.department_id = d.department_id;

--job_id =>CLERK 사원명,직급번호,직급이름 출력

select emp_name,e.job_id,job_title,e.department_id,department_name from employees e, jobs j,departments d where e.job_id = j.job_id and e.department_id =d.department_id and 
e.job_id like '%CLERK%' ;

-- grade,low_salary,max_salary 테이블명 salary_grade

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

commit;

select * from salary_grade;

select emp_name,salary,grade from employees e , salary_grade s where salary between low_salary and max_salary ;

select * from jobs;

select * from employees;

--job_id MAN이 포함되어 있는 사원의 사원명, 직급코드,직급번호,직급이름을 출력하시오

select e.job_id,emp_name,job_title from employees e, jobs j where e.job_id like '%MAN%' and e.job_id = j.job_id;`

select employee_id,emp_name,manager_id from employees order by employee_id;

select e1.employee_id,e1.emp_name,e1.manager_id,e2.emp_name from employees e1,employees e2 where e1.manager_id = e2.employee_id order by e1.employee_id;

--매니저가 Steven King 인 사람을 구하시오


select e1.emp_name,e1.manager_id,e2.emp_name from employees e1 , employees e2 where e1.manager_id = e2.employee_id and e2.emp_name = 'Steven King';

select * from departments;
--마케팅 상위부서 번호와 이름을 

select d1.department_id,d1.department_name,d1.parent_id,d2.department_name from departments d1, departments d2 where d1.parent_id = d2.department_id and d1.department_name = '마케팅' ;

--manager_id, 사원이름(emp_name)
--manager_id null값이 있는것이 있음
--employee_id 에 없어도 출력
select e1.employee_id,e1.emp_name,e1.manager_id,e2.emp_name from employees e1 ,employees e2 where e1.manager_id = e2.employee_id(+) order by e1.employee_id;

select emp_name,department_id from employees;

select emp_name , department_id,e.job_id,j.job_title from employees e, jobs j where department_id is null and e.job_id = j.job_id;
select emp_name,e.department_id,department_name from employees e, departments d where e.department_id = d.department_id and e.department_id is null;
select distinct job_id from employees;
--employees 중복제거 부서개수 12( null 포함 ) 개
--총 부서개수 : 27

select distinct department_id from employees;
--e.department_id 의 모든 내용을 출력해라, 출력개수 : 107개( null 포함 ) 
select e.department_id,department_name from employees e,departments d where e.department_id = d.department_id(+);
--eq join: 106개

select* from departments;

select distinct department_id from employees;

-- emp_name,department_id,department_name

select emp_name,e.department_id,department_name from employees e, departments d where e.department_id(+) = d.department_id;
--(+)를 붙이는 반대편에 있는 내용이 나온다

select count(department_id) from employees;

select distinct department_id from departments;

select distinct department_id from employees;

select emp_name,e.department_id,department_name from employees e, departments d where e.department_id = d.department_id;

select emp_name,e.department_id,department_name from employees e inner join departments d on e.department_id = d.department_id ;

select emp_name,department_name from employees e inner join departments d using(department_id);

select emp_name,department_name,job_title from employees inner join departments using(department_id) inner join jobs using(job_id);

select emp_name,e.department_id,department_name from employees e, departments d where e.department_id = d.department_id;

select emp_name,department_id,department_name from employees right outer join departments using(department_id);--오른쪽(departments)에 모든값을 보여준다.
-- select emp_name,department_id,department_name from employees e , departments where e.department_id(+) = d.department_id 이거랑 같음

select emp_name,department_id,department_name from employees full outer join departments using(department_id);
--2개다 안보이는것을 출력한다.


--기존에 있는 테이블 employees,departments,jobs 각각 복사해서 employees2, departments2,jobs2테이블 만들기
create table employees2 as
select * from employees;

create table departments2 as
select * from departments;

create table jobs2 as
select * from jobs;

select * from departments2;

select * from jobs2;
commit;

drop table employees2;
drop table departments2;
drop table jobs2;
commit;
--101~150
create table employees2 as
select * from employees where employee_id between 101 and 150;

select * from employees2;

insert into employees2 select * from employees where employee_id between 170 and 180;


--employee_id, emp_name 만 181,185,189

insert into employees2(employee_id,emp_name,hire_date) select employee_id,emp_name,hire_date from employees where employee_id in(181,185,189);

drop table employees2;

--emp01 테이블생성( employee_id, emp_name, department_id,department_name,job_id,job_title)

create table emp01 as select employee_id,emp_name,department_id,department_name,job_id,job_title from employees join departments using (department_id) join jobs using(job_id);

insert into emp01 select employee_id,emp_name,department_id,department_name,job_id,job_title from employees  left outer join departments using (department_id) join jobs using(job_id) where emp_name = 'Kimberely Grant';
select * from emp01 order by employee_id;
rollback;
