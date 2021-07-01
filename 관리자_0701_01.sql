select * from employees;

select DISTINCT manager_id from employees order by manager_id;

desc employees;

select emp_name,salary,hire_date from employees where salary>6500 order by salary;

select * from employees;

select emp_name,salary,salary*12 as 연봉 from employees order by 연봉;

select emp_name,salary-100 from employees;

select emp_name  ,salary+(salary*nvl(commission_pct,0)) as salary from employees ;
nvl(commission_pct,0);-- null 일경우 0으로 표시해라

select emp_name, nvl(commission_pct,0) as "Comm" from employees;

select * from tab;

desc departments;

select department_id, department_name  from departments where department_id>=150 order by department_id desc;
select department_id, department_name from departments where department_id>=150 order by department_id desc;
desc employees;
select emp_name,department_id from employees order by department_id desc,emp_name asc;
select employee_id,emp_name,employee_id||emp_name as "idName" from employees;
--성,이름 :여권
select employee_id||'와'||emp_name from employees;

select DISTINCT department_id from employees;

select DISTINCT job_id from employees;

select count(*) from employees;

select count(distinct job_id) from employees;

select emp_name,salary,department_id from employees order by department_id;

select emp_name,max(salary),department_id from employees group by department_id,emp_name having max(salary)>=5000 order by max(salary) desc;