select * from employees;

select * from employees order by employee_id;
--employee_id 순차정렬
--연봉 5000이상인사람검색 
--이름으로 역순정렬
--manager_id를 출력하는데,중복제거출력
select emp_name,salary from employees where salary>=5000 order by salary;
--연봉 5000이상
select emp_name from employees order by emp_name desc;
--이름 역순정렬
select distinct manager_id from employees order by manager_id;
--manager_id 중복제거


select emp_name,salary,salary*12,salary*12+(salary*nvl(commission_pct,0)) as total from employees ;
--이름,월급,연봉,연봉+커미션 까지출력

select salary*12 as 지금연봉,salary*12+(salary*12)*0.03 as "인상연봉(3%)" from employees;
--지금연봉과 3%인상연봉 출력//커미션 제외

select * from employees;

select emp_name||'와'||email from employees;

--부서번호 중복제거 출력
select distinct department_id from employees;

--job_id

select job_id from employees;

select distinct job_id from employees;

--월급이 5000인 사람을 출력하시오.

select emp_name,salary from employees where salary != 6000 order by salary;

select emp_name,department_id from employees where department_id = 50;

select emp_name, department_id from employees where department_id = 10 or department_id = 30;
--부서번호 10, 30번인사람

--부서번호가 50이면서 월급 5000이상인 사람을 출력
select department_id,salary from employees where department_id = 50 and  salary >= 5000 order by salary;

--월급 4000이하인사람 

select  manager_id as "사원번호",emp_name as "사원이름",salary as "급여", department_id as "부서번호" 
from employees where salary <= 4000 order by department_id;

select * from employees;

select * from employees where email = 'DOCONNEL';
--컬럼명이나 명령어들은 대소문자 구별을 하지않지만 안에있는 데이터들은 대소문자를 구분한다

select * from employees where emp_name = 'Susan Mavris';

-- 대문자 s로 시작되는 사람을 출력하시오.

select * from employees where emp_name like '%d%a%';
--글자%: 글자로 시작하는 데이터, %글자: 글자로 끝나는 데이터, %글자%: 앞뒤로 글자가 포함된 데이터

select * from employees where emp_name like 'S%';
--대문자 S로 시작되는 데이터

--소문자 a로 끝나는 데이터를 출력
select * from employees where emp_name like '%a';

--대문자 S가 들어가 있는 사람을 출력
select * from employees where emp_name like '%S%';

--u,d가 들어가 있는 사람을 출력
select * from employees where emp_name like '%u%d%';

---D로 시작하고, l로 끝나는 데이터
select * from employees where emp_name like 'D%l';

--모두 소문자,대문자로 출력 lower 소문자 upper 대문자
select emp_name,lower(emp_name),upper(emp_name) from employees;
--대소문자 구분 없이 s로 시작되는 데이터을 출력 
select * from employees where lower(emp_name) like 's%';
-- 대문자 S로 시작하지 않는 데이터 출력
select * from employees where emp_name not like 'S%';

-- S로 시작하거나 M으로 시작하는 사람을 출력하시오
select * from employees where emp_name like 'S%' or emp_name like 'M%' order by emp_name;

-- 08년 1월 13일 인 사람을 출력
select * from employees where hire_date = '08/01/13';
-- 08년 1월 13일 이후의 사람 출력
select * from employees where hire_date > '2008.01.13';

-- A,M으로 시작하는 사람
select * from employees where emp_name like 'A%' or emp_name like 'M%';

--s로 끝나거나,g로 끝나는 사람을 출력
select * from employees where emp_name like '%s' or emp_name like '%g';

--k가 들어가 있지 않은 사람을 출력
select * from employees where emp_name not like '%k%';

--부서번호가 50이면서 대문자 S로 시작하는 사람을 출력하시오
select * from employees where department_id = 50 and emp_name like 'S%';

select sysdate from dual;

select * from departments;

--영업부 사람 중에 월급이 5000이상인 사람을 출력하시오.
select * from employees where department_id = 80 and salary >= 5000;

--월급 3000이상 6000이하인 사람을 출력
select * from employees where salary >= 3000 and salary <= 6000 order by salary desc;

select * from jobs;

--부서가 10~50까지 이면서, job_id가 man이 들어가 있는 사람 출력
select * from employees 
where department_id >=10 and department_id <=50 and lower(job_id) like '%man%';

--커미션 비율이 0.2이상, 0.4이하인 사람의 커미션 금액을 출력하시오

select emp_name,salary,salary*commission_pct from employees 
where commission_pct >=0.2 and commission_pct <= 0.4 order by salary*commission_pct;

-- 사원번호가 100,200,150,160 출력하시오.
select emp_name,employee_id,salary from employees where employee_id = 100 or employee_id = 200
or employee_id = 150 or employee_id = 160;

--사원번호 150~170번까지의 사원번호,사원이름,급여를 출력하시오.
select employee_id,emp_name,salary from employees where employee_id >= 150 and employee_id <= 170;

select employee_id, emp_name, salary from employees where employee_id between 150 and 170;

--월급이 4000이상 5000이하 출력

select emp_name,salary from employees where salary between 4000 and 5000;
select emp_name,salary from employees where salary >= 4000 and salary <= 5000;

--월급이 3000미만, 8000초과하는 사람 출력
select emp_name,salary from employees where salary < 3000 or salary >8000;

select emp_name,salary from employees where salary not between 3000 and 8000;

--입사일02/01/01 이상 06/12/31이하 출력
select hire_date from employees where hire_date between '02/01/01' and '06/12/31'order by hire_date;
select hire_date from employees where hire_date >= '02/01/01' and hire_date <= '06/12/31';

--월급이 3000,4000,5000인 사람을 출력 하시오.
select emp_name, salary from employees where salary = 3000 or salary = 4000 or salary = 5000;

select * from employees where salary in (3000,4000,5000);

-- 사원번호가 110,120,150인사람을 출력
select * from employees where employee_id = 110 or employee_id = 120 or employee_id = 150;
select * from employees where employee_id in (110,120,150);

--대문자 f 가들어가있는 이름을 출력하시오
select * from employees where emp_name like '%F%';
--소문자 a 가 들어가이는 이름을 출력하시오
select * from employees where emp_name like '%a%';
--대문자 J로 시작되는 사람을 출력하시오
select * from employees where emp_name like 'J%';
--_i 
select * from employees where emp_name like '_i%';
--__e
select * from employees where emp_name like '__e%';

-- 앞에서3번째 이름의 e가 포함되어 있는 사람을 출력하시오.
select * from employees where emp_name like '__e%';

-- r 뒤에서 4번째 이름의 r이 포함되어있는 사람 출력
select emp_name from employees where emp_name like '%r___';

--employees테이블에서 department_id 가 null인 사람을 출력하시오.
select * from employees where department_id is null;

--사원번호가 110번인 사람을 출력하시오.
select * from employees where department_id = 110;

--커미션인 null인 사람을 출력하시오.
select * from employees where commission_pct is null;

select emp_name,employee_id,hire_date,department_id from employees 
order by employee_id asc,hire_date desc;