select e.emp_name,department_id,d.department_name from employees e join departments d using (department_id) ;

select  * from employees;

select employee_id,emp_name,department_id from employees;

select employee_id,emp_name,department_id,department_name from employees e join departments d using(department_id);

select * from employees,departments;

select emp_name,employees.department_id,department_name from employees, departments where employees.department_id = departments.department_id;


select * from jobs;

select emp_name,job_id from employees;

select job_id,job_title from jobs;

--sql����

select emp_name,jobs.job_id,jobs.job_title from employees, jobs where employees.job_id = jobs.job_id;

select employee_id,department_id,job_id from employees;

select department_id,department_name from departments;

select job_id,job_title from jobs;

--employees ���̺� ��,
--department_id�� fk�� ����ϰڴ�. departments���̺� department_id��
alter table employees add constraint fk_department_id foreign key (department_id) references departments (department_id);
alter table employees add constraint fk_job_id foreign key (job_id) references jobs (job_id);

select * from employees;

-- Jennifer Whalen�� �μ��̸��� ����Ͻÿ�

select emp_name,department_name from employees e , departments d
where e.emp_name = 'Jennifer Whalen' and e.department_id = d.department_id;

--Jennifer Whalen �� ����,������ ������ �ּҰ��� �ִ밪�� ����Ͻÿ�

select e.emp_name,e.salary,max_salary,min_salary from employees e, jobs j where e.job_id = j.job_id and e.emp_name = 'Jennifer Whalen' ;
select e.emp_name,e.salary,max_salary,min_salary from employees e, jobs j where e.job_id = j.job_id and emp_name = 'Jennifer Whalen' ;

-- IT PROG,FI_ACCOUNT ������ �����, ���޸�,����,�ּҿ���,�ִ����

select e.job_id,emp_name,salary,job_title,min_salary,max_salary
from employees e, jobs j where e.job_id = j.job_id and (e.job_id = 'IT_PROG' or e.job_id = 'FI_ACCOUNT') ;

select * from jobs;

-- 3000 -->>5���, 5000 -->> 4���, 6000-->> 3��� 7000-->> 2��� 8000 -->>1���
--�̶�� ��� �غ�����

select emp_name,salary,
case when salary <=3000 then '5���'
when salary <=5000 then '4���'
when salary <=6000 then '3���'
when salary < 8000 then '2���'
when salary >=8000 then '1���'
end as ��� from employees;

select emp_name,e.department_id,department_name from employees e, departments d where e.department_id = d.department_id;

--job_id =>CLERK �����,���޹�ȣ,�����̸� ���

select emp_name,e.job_id,job_title,e.department_id,department_name from employees e, jobs j,departments d where e.job_id = j.job_id and e.department_id =d.department_id and 
e.job_id like '%CLERK%' ;

-- grade,low_salary,max_salary ���̺�� salary_grade

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

--job_id MAN�� ���ԵǾ� �ִ� ����� �����, �����ڵ�,���޹�ȣ,�����̸��� ����Ͻÿ�

select e.job_id,emp_name,job_title from employees e, jobs j where e.job_id like '%MAN%' and e.job_id = j.job_id;`

select employee_id,emp_name,manager_id from employees order by employee_id;

select e1.employee_id,e1.emp_name,e1.manager_id,e2.emp_name from employees e1,employees e2 where e1.manager_id = e2.employee_id order by e1.employee_id;

--�Ŵ����� Steven King �� ����� ���Ͻÿ�


select e1.emp_name,e1.manager_id,e2.emp_name from employees e1 , employees e2 where e1.manager_id = e2.employee_id and e2.emp_name = 'Steven King';

select * from departments;
--������ �����μ� ��ȣ�� �̸��� 

select d1.department_id,d1.department_name,d1.parent_id,d2.department_name from departments d1, departments d2 where d1.parent_id = d2.department_id and d1.department_name = '������' ;

--manager_id, ����̸�(emp_name)
--manager_id null���� �ִ°��� ����
--employee_id �� ��� ���
select e1.employee_id,e1.emp_name,e1.manager_id,e2.emp_name from employees e1 ,employees e2 where e1.manager_id = e2.employee_id(+) order by e1.employee_id;

select emp_name,department_id from employees;

select emp_name , department_id,e.job_id,j.job_title from employees e, jobs j where department_id is null and e.job_id = j.job_id;
select emp_name,e.department_id,department_name from employees e, departments d where e.department_id = d.department_id and e.department_id is null;
select distinct job_id from employees;
--employees �ߺ����� �μ����� 12( null ���� ) ��
--�� �μ����� : 27

select distinct department_id from employees;
--e.department_id �� ��� ������ ����ض�, ��°��� : 107��( null ���� ) 
select e.department_id,department_name from employees e,departments d where e.department_id = d.department_id(+);
--eq join: 106��

select* from departments;

select distinct department_id from employees;

-- emp_name,department_id,department_name

select emp_name,e.department_id,department_name from employees e, departments d where e.department_id(+) = d.department_id;
--(+)�� ���̴� �ݴ��� �ִ� ������ ���´�

select count(department_id) from employees;

select distinct department_id from departments;

select distinct department_id from employees;

select emp_name,e.department_id,department_name from employees e, departments d where e.department_id = d.department_id;

select emp_name,e.department_id,department_name from employees e inner join departments d on e.department_id = d.department_id ;

select emp_name,department_name from employees e inner join departments d using(department_id);

select emp_name,department_name,job_title from employees inner join departments using(department_id) inner join jobs using(job_id);

select emp_name,e.department_id,department_name from employees e, departments d where e.department_id = d.department_id;

select emp_name,department_id,department_name from employees right outer join departments using(department_id);--������(departments)�� ��簪�� �����ش�.
-- select emp_name,department_id,department_name from employees e , departments where e.department_id(+) = d.department_id �̰Ŷ� ����

select emp_name,department_id,department_name from employees full outer join departments using(department_id);
--2���� �Ⱥ��̴°��� ����Ѵ�.


--������ �ִ� ���̺� employees,departments,jobs ���� �����ؼ� employees2, departments2,jobs2���̺� �����
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


--employee_id, emp_name �� 181,185,189

insert into employees2(employee_id,emp_name,hire_date) select employee_id,emp_name,hire_date from employees where employee_id in(181,185,189);

drop table employees2;

--emp01 ���̺����( employee_id, emp_name, department_id,department_name,job_id,job_title)

create table emp01 as select employee_id,emp_name,department_id,department_name,job_id,job_title from employees join departments using (department_id) join jobs using(job_id);

insert into emp01 select employee_id,emp_name,department_id,department_name,job_id,job_title from employees  left outer join departments using (department_id) join jobs using(job_id) where emp_name = 'Kimberely Grant';
select * from emp01 order by employee_id;
rollback;
