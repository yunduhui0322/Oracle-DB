select to_char(hire_date, 'yyyy-mm-dd hh:mi:ss dy') from employees;
select to_char(bdate,' am hh:mi:ss dy') as bdate from board;

select sysdate - to_date('19960322','yyyy-mm-dd') from dual;

select sysdate-1,sysdate as today, sysdate+1 from dual;

select concat(address1 ,address2) as "address" from member;

select address1 || address2 as address from member;

select emp_name from employees;

select lower(emp_name),upper(emp_name),initcap(emp_name) from employees;
--initcap ->ù���ڸ� �빮�ڷ�
select * from employees;

select bname,ltrim(bname,'��'),rtrim(bname,'��'),rtrim(bname,'��') from board;
--ltrim(column ��,�ڸ������ ����) Ư���� ���ڸ�  ���ʿ��� ���������Ұ� ����ϰ� ������ 
--(���ھȿ����ԵȰ͵� �߶�����. �׷��� Ư���� ���ڰ� �Ѱ��϶��� �����Ұ�)

select ltrim(job_id,'AD'),ltrim(job_title,'P') from jobs;

select substr(job_id,4) from jobs;
--substr ���ڿ� �ڸ����� �ڸ������ ������ �����ؼ� �ڸ� ���ڸ� ���

select length(bname) from board;
--length(�÷���) ���ڿ��� ���̸� ����Ҷ� ���

select emp_name,length(emp_name),lengthb(emp_name) from employees;
--lengthb ���ڿ��� ũ�� ����

select bname,length(bname),lengthb(bname) from board;
--������ �ѱ��ڴ� 1byte, �ѱ��� �ѱ��ڴ� 3byte

select length(job_title) from jobs;


select trunc(sysdate - hire_date) from employees;

select sysdate - to_date(20160426,'yyyy-mm-dd') from dual;
--��¥�Լ��� ���ϱ� �Ұ���, ����� ����, ���� ���ϱ�, ���� ����

select sysdate,add_months(sysdate,3) from dual;
--add_months(��¥,������) 
select bdate from board;

select bdate,add_months(bdate,12) from board;

select add_months('2021-03-22',12) from dual;

select bdate,last_day(bdate) from board;
--last_day�Էµ� ��¥�� month�� ���������� �������� ��� ex)7���� 30�ϱ���

select trunc(months_between('2021-09-09','2021-07-07')) from dual;
--months_between() 2���� ��¥�� ������ ������ ���

--employees ������, ������ ��������Ͻÿ�
select count(employee_id),to_char(sum(salary),'$999,999') from employees;
--�μ���ȣ�� 50�� �ְ���ޱݾװ� �̸��� ����Ͻÿ�
select emp_name,to_char(salary,'$999,999,999'),department_id from employees 
where salary = (select max(salary) from employees where department_id = 50 ) 
and department_id = 50 ;

select emp_name,salary,department_id from employees where department_id = 50 and
salary = (select max(salary) from employees where department_id =50);

select department_id,max(salary) from employees group by department_id;
--board���̺� ȫ�浿 2021�� 7�� 6�� ȭ ���·� ����Ͻÿ�
select bname,to_char(bdate,'yyyy"��"mm"��"dd"��" day') from board;
--employees ���� $12,333, ��ȭ��ǥ�� ;
select to_char(salary,'$999,999') as "�޷�",to_char(salary*1250,'L999,999,999') as "��ȭ" from employees;
--�����ȣ�� Ȧ���� ����� ����Ͻÿ�.
select * from employees where not mod(employee_id,2) = 0;
--32.7�ݿø�,51.2���� 123457.2�ø� ó���ؼ� dual�� ����Ͻÿ�.
select round(32.7),floor(51.9),ceil(123457.2) from dual;

-- adam aaa ��� �빮�� ���
select upper('adam aaa') from dual;
--AAA�ҹ���
select lower('AAA') from dual;
--aaaù���� �빮��
select initcap('aaa') from dual;

--employees �Ի��Ͽ��� ���� ����Ͻÿ� 08/02/01 ->02
select extract(month from hire_date) from employees;
select to_char(hire_date , 'mm') from employees;
select substr(hire_date,4,2) from employees;
--����̸����� A�� ������ ����Ͻÿ�
select ltrim(emp_name,'A') from employees;

--dream�����׷��� ���̸� ����Ͻÿ�.
select length('dream���α׷���') from dual;
--dream���α׷����� ���Byte�� ����Ͻÿ�.
select lengthb('dream���α׷���') from dual;
--���糯¥�� ������ ��¥�� ����Ͻÿ�
select LAST_DAY(SYSDATE) from dual;
--�Ի��ϰ� ���� ��¦������ �޼��� ���
select trunc(months_between(sysdate,hire_date)) from employees;

select sysdate,next_day(sysdate,'�Ͽ���') from dual;
--���糯¥���� �ֱ����� ã�� ������ �������� �����ش�

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

--10 : '����', 20 : '���', 30 : '�뱸', ������ : ����
select emp_name,department_id from employees;
select emp_name,department_id,
case when department_id =10 then '����'
when department_id = 20 then '���'
when department_id = 30 then '�뱸'
else '����' end as �μ����� from employees;
--job_id��SH CLERK,PU_CLERK�λ���� ����

select emp_name,job_id,
case when job_id = 'SH_CLERK' or job_id = 'PU_CLERK' then '����' else ' ' end as promotion from employees;

--������ 8000 �̻� �ӿ� , 6000 �̻� ����, 4000 �̻� �븮, �׿� ���
select emp_name, job_id,salary,job_id,
case when salary >= 8000 then '�ӿ�'
when salary >= 6000 then '����'
when salary >= 4000 then '�븮'
else '���' end ���� from employees order by salary;

--��ȣ 101~120 1��, 121 ~140 2��, 141~160 3��, 4��
select emp_name, employee_id,
case when employee_id >= 101 and employee_id <=120 then '1��'
when employee_id >= 121 and employee_id <= 140 then '2��'
when employee_id >= 141 and employee_id <= 160 then '3��'
else '4��' end as e_floor from employees order by e_floor;

select emp_name,department_id,
decode(department_id,10,'����',20,'�뱸',30,'���','����') from employees;

--hire_date 08/01/01 ���κи� ©�� ���ؼ� 12,1,2 -> �ܿ� 3,4,5 ->�� , 
--6,7,8, -> ���� 9,10,11 ->����
select to_char(hire_date,'mm') as ��,
case
when to_char(hire_date,'mm') = 12 then '�ܿ�'
when to_char(hire_date,'mm')>=9  then '����'
when to_char(hire_date,'mm')>=6 then '����'
when to_char(hire_date,'mm')>= 3 then '��'
when to_char(hire_date, 'mm' ) >=1 then '�ܿ�' end as ���� from employees order by ��;

select to_char(hire_date,'mm') as ��,
decode(to_char(hire_date,'mm'),12,'�ܿ�',1,'�ܿ�',2,'�ܿ�',3,'��',4,'��',5,'��',6,'����',7,'����',
8,'����',9,'����',10,'����',11,'����') as ���� from employees order by ��;