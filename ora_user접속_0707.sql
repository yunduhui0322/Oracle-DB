select to_char(hire_date, 'yyyy-mm-dd hh:mi:ss dy') from employees;
select to_char(bdate,' am hh:mi:ss dy') as bdate from board;

select sysdate - to_date('19960322','yyyy-mm-dd') from dual;

select sysdate-1,sysdate as today, sysdate+1 from dual;

select concat(address1 ,address2) as "address" from member;

select address1 || address2 as address from member;

select emp_name from employees;

select lower(emp_name),upper(emp_name),initcap(emp_name) from employees;
--initcap ->첫글자만 대문자로
select * from employees;

select bname,ltrim(bname,'관'),rtrim(bname,'자'),rtrim(bname,'동') from board;
--ltrim(column 명,자르고싶은 문자) 특정한 문자를  왼쪽에서 부터제외할고 출력하고 싶을때 
--(문자안에포함된것도 잘라진다. 그래서 특정한 문자가 한개일때가 유용할것)

select ltrim(job_id,'AD'),ltrim(job_title,'P') from jobs;

select substr(job_id,4) from jobs;
--substr 문자열 자리수로 자르고싶은 범위를 지정해서 자른 문자를 출력

select length(bname) from board;
--length(컬럼명) 문자열의 길이를 출력할때 사용

select emp_name,length(emp_name),lengthb(emp_name) from employees;
--lengthb 문자열의 크기 측정

select bname,length(bname),lengthb(bname) from board;
--영문은 한글자당 1byte, 한글은 한글자당 3byte

select length(job_title) from jobs;


select trunc(sysdate - hire_date) from employees;

select sysdate - to_date(20160426,'yyyy-mm-dd') from dual;
--날짜함수는 더하기 불가능, 빼기는 가능, 숫자 더하기, 빼기 가능

select sysdate,add_months(sysdate,3) from dual;
--add_months(날짜,개월수) 
select bdate from board;

select bdate,add_months(bdate,12) from board;

select add_months('2021-03-22',12) from dual;

select bdate,last_day(bdate) from board;
--last_day입력된 날짜의 month의 마지막날이 몇일인지 출력 ex)7월은 30일까지

select trunc(months_between('2021-09-09','2021-07-07')) from dual;
--months_between() 2개의 날짜의 사이의 개월수 출력

--employees 직원수, 월급의 합을출력하시오
select count(employee_id),to_char(sum(salary),'$999,999') from employees;
--부서번호가 50인 최고월급금액과 이름을 출력하시오
select emp_name,to_char(salary,'$999,999,999'),department_id from employees 
where salary = (select max(salary) from employees where department_id = 50 ) 
and department_id = 50 ;

select emp_name,salary,department_id from employees where department_id = 50 and
salary = (select max(salary) from employees where department_id =50);

select department_id,max(salary) from employees group by department_id;
--board테이블 홍길동 2021년 7월 6일 화 형태로 출력하시오
select bname,to_char(bdate,'yyyy"년"mm"월"dd"일" day') from board;
--employees 월급 $12,333, 원화로표시 ;
select to_char(salary,'$999,999') as "달러",to_char(salary*1250,'L999,999,999') as "원화" from employees;
--사원번호가 홀수인 사원만 출력하시오.
select * from employees where not mod(employee_id,2) = 0;
--32.7반올림,51.2버림 123457.2올림 처리해서 dual에 출력하시오.
select round(32.7),floor(51.9),ceil(123457.2) from dual;

-- adam aaa 모두 대문자 출력
select upper('adam aaa') from dual;
--AAA소문자
select lower('AAA') from dual;
--aaa첫글자 대문자
select initcap('aaa') from dual;

--employees 입사일에서 월만 출력하시오 08/02/01 ->02
select extract(month from hire_date) from employees;
select to_char(hire_date , 'mm') from employees;
select substr(hire_date,4,2) from employees;
--사원이름에서 A만 삭제후 출력하시오
select ltrim(emp_name,'A') from employees;

--dream프래그래머 길이를 출력하시오.
select length('dream프로그래머') from dual;
--dream프로그래머의 사용Byte를 출력하시오.
select lengthb('dream프로그래머') from dual;
--현재날짜의 마지막 날짜를 출력하시오
select LAST_DAY(SYSDATE) from dual;
--입사일과 현재 날짝까지의 달수를 출력
select trunc(months_between(sysdate,hire_date)) from employees;

select sysdate,next_day(sysdate,'일요일') from dual;
--현재날짜에서 최근접한 찾는 요일이 언제인지 보여준다

select round(sysdate-hire_date) from employees;

select sysdate,round(sysdate,'month') from dual;

select hire_date,round(hire_date,'month') from employees;

select hire_date,trunc(hire_date,'month') from employees;

select trunc(123.45678,-1) from dual;

create table mvc_board(
b_id number(4) primary key,
b_name varchar2(20),
b_title varchar2(100),
b_content varchar2(2000),
b_date date default sysdate,
b_hit number(4) default 0,
b_group number(4),
b_step number(4) default 0,
b_indent number(4));

select to_char(to_number('10000')-to_number('5000'),'999,999,999') from dual;

select emp_name, manager_id from employees;

select emp_name ,nvl(to_char(manager_id),'CEO') from employees;

--10 : '대전', 20 : '경기', 30 : '대구', 나머지 : 서울
select emp_name,department_id from employees;
select emp_name,department_id,
case when department_id =10 then '대전'
when department_id = 20 then '경기'
when department_id = 30 then '대구'
else '서울' end as 부서이전 from employees;
--job_id가SH CLERK,PU_CLERK인사람은 승진

select emp_name,job_id,
case when job_id = 'SH_CLERK' or job_id = 'PU_CLERK' then '승진' else ' ' end as promotion from employees;

--월급이 8000 이상 임원 , 6000 이상 과장, 4000 이상 대리, 그외 사원
select emp_name, job_id,salary,job_id,
case when salary >= 8000 then '임원'
when salary >= 6000 then '과장'
when salary >= 4000 then '대리'
else '사원' end 직급 from employees order by salary;

--번호 101~120 1층, 121 ~140 2층, 141~160 3층, 4층
select emp_name, employee_id,
case when employee_id >= 101 and employee_id <=120 then '1층'
when employee_id >= 121 and employee_id <= 140 then '2층'
when employee_id >= 141 and employee_id <= 160 then '3층'
else '4층' end as e_floor from employees order by e_floor;

select emp_name,department_id,
decode(department_id,10,'대전',20,'대구',30,'울산','서울') from employees;

--hire_date 08/01/01 월부분만 짤라서 비교해서 12,1,2 -> 겨울 3,4,5 ->봄 , 
--6,7,8, -> 여름 9,10,11 ->가을
select to_char(hire_date,'mm') as 월,
case
when to_char(hire_date,'mm') = 12 then '겨울'
when to_char(hire_date,'mm')>=9  then '가을'
when to_char(hire_date,'mm')>=6 then '여름'
when to_char(hire_date,'mm')>= 3 then '봄'
when to_char(hire_date, 'mm' ) >=1 then '겨울' end as 계절 from employees order by 월;

select to_char(hire_date,'mm') as 월,
decode(to_char(hire_date,'mm'),12,'겨울',1,'겨울',2,'겨울',3,'봄',4,'봄',5,'봄',6,'여름',7,'여름',
8,'여름',9,'가을',10,'가을',11,'가을') as 계절 from employees order by 월;