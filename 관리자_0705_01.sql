select * from employees;

select * from employees order by employee_id;
--employee_id ��������
--���� 5000�̻��λ���˻� 
--�̸����� ��������
--manager_id�� ����ϴµ�,�ߺ��������
select emp_name,salary from employees where salary>=5000 order by salary;
--���� 5000�̻�
select emp_name from employees order by emp_name desc;
--�̸� ��������
select distinct manager_id from employees order by manager_id;
--manager_id �ߺ�����


select emp_name,salary,salary*12,salary*12+(salary*nvl(commission_pct,0)) as total from employees ;
--�̸�,����,����,����+Ŀ�̼� �������

select salary*12 as ���ݿ���,salary*12+(salary*12)*0.03 as "�λ󿬺�(3%)" from employees;
--���ݿ����� 3%�λ󿬺� ���//Ŀ�̼� ����

select * from employees;

select emp_name||'��'||email from employees;

--�μ���ȣ �ߺ����� ���
select distinct department_id from employees;

--job_id

select job_id from employees;

select distinct job_id from employees;

--������ 5000�� ����� ����Ͻÿ�.

select emp_name,salary from employees where salary != 6000 order by salary;

select emp_name,department_id from employees where department_id = 50;

select emp_name, department_id from employees where department_id = 10 or department_id = 30;
--�μ���ȣ 10, 30���λ��

--�μ���ȣ�� 50�̸鼭 ���� 5000�̻��� ����� ���
select department_id,salary from employees where department_id = 50 and  salary >= 5000 order by salary;

--���� 4000�����λ�� 

select  manager_id as "�����ȣ",emp_name as "����̸�",salary as "�޿�", department_id as "�μ���ȣ" 
from employees where salary <= 4000 order by department_id;

select * from employees;

select * from employees where email = 'DOCONNEL';
--�÷����̳� ��ɾ���� ��ҹ��� ������ ���������� �ȿ��ִ� �����͵��� ��ҹ��ڸ� �����Ѵ�

select * from employees where emp_name = 'Susan Mavris';

-- �빮�� s�� ���۵Ǵ� ����� ����Ͻÿ�.

select * from employees where emp_name like '%d%a%';
--����%: ���ڷ� �����ϴ� ������, %����: ���ڷ� ������ ������, %����%: �յڷ� ���ڰ� ���Ե� ������

select * from employees where emp_name like 'S%';
--�빮�� S�� ���۵Ǵ� ������

--�ҹ��� a�� ������ �����͸� ���
select * from employees where emp_name like '%a';

--�빮�� S�� �� �ִ� ����� ���
select * from employees where emp_name like '%S%';

--u,d�� �� �ִ� ����� ���
select * from employees where emp_name like '%u%d%';

---D�� �����ϰ�, l�� ������ ������
select * from employees where emp_name like 'D%l';

--��� �ҹ���,�빮�ڷ� ��� lower �ҹ��� upper �빮��
select emp_name,lower(emp_name),upper(emp_name) from employees;
--��ҹ��� ���� ���� s�� ���۵Ǵ� �������� ��� 
select * from employees where lower(emp_name) like 's%';
-- �빮�� S�� �������� �ʴ� ������ ���
select * from employees where emp_name not like 'S%';

-- S�� �����ϰų� M���� �����ϴ� ����� ����Ͻÿ�
select * from employees where emp_name like 'S%' or emp_name like 'M%' order by emp_name;

-- 08�� 1�� 13�� �� ����� ���
select * from employees where hire_date = '08/01/13';
-- 08�� 1�� 13�� ������ ��� ���
select * from employees where hire_date > '2008.01.13';

-- A,M���� �����ϴ� ���
select * from employees where emp_name like 'A%' or emp_name like 'M%';

--s�� �����ų�,g�� ������ ����� ���
select * from employees where emp_name like '%s' or emp_name like '%g';

--k�� �� ���� ���� ����� ���
select * from employees where emp_name not like '%k%';

--�μ���ȣ�� 50�̸鼭 �빮�� S�� �����ϴ� ����� ����Ͻÿ�
select * from employees where department_id = 50 and emp_name like 'S%';

select sysdate from dual;

select * from departments;

--������ ��� �߿� ������ 5000�̻��� ����� ����Ͻÿ�.
select * from employees where department_id = 80 and salary >= 5000;

--���� 3000�̻� 6000������ ����� ���
select * from employees where salary >= 3000 and salary <= 6000 order by salary desc;

select * from jobs;

--�μ��� 10~50���� �̸鼭, job_id�� man�� �� �ִ� ��� ���
select * from employees 
where department_id >=10 and department_id <=50 and lower(job_id) like '%man%';

--Ŀ�̼� ������ 0.2�̻�, 0.4������ ����� Ŀ�̼� �ݾ��� ����Ͻÿ�

select emp_name,salary,salary*commission_pct from employees 
where commission_pct >=0.2 and commission_pct <= 0.4 order by salary*commission_pct;

-- �����ȣ�� 100,200,150,160 ����Ͻÿ�.
select emp_name,employee_id,salary from employees where employee_id = 100 or employee_id = 200
or employee_id = 150 or employee_id = 160;

--�����ȣ 150~170�������� �����ȣ,����̸�,�޿��� ����Ͻÿ�.
select employee_id,emp_name,salary from employees where employee_id >= 150 and employee_id <= 170;

select employee_id, emp_name, salary from employees where employee_id between 150 and 170;

--������ 4000�̻� 5000���� ���

select emp_name,salary from employees where salary between 4000 and 5000;
select emp_name,salary from employees where salary >= 4000 and salary <= 5000;

--������ 3000�̸�, 8000�ʰ��ϴ� ��� ���
select emp_name,salary from employees where salary < 3000 or salary >8000;

select emp_name,salary from employees where salary not between 3000 and 8000;

--�Ի���02/01/01 �̻� 06/12/31���� ���
select hire_date from employees where hire_date between '02/01/01' and '06/12/31'order by hire_date;
select hire_date from employees where hire_date >= '02/01/01' and hire_date <= '06/12/31';

--������ 3000,4000,5000�� ����� ��� �Ͻÿ�.
select emp_name, salary from employees where salary = 3000 or salary = 4000 or salary = 5000;

select * from employees where salary in (3000,4000,5000);

-- �����ȣ�� 110,120,150�λ���� ���
select * from employees where employee_id = 110 or employee_id = 120 or employee_id = 150;
select * from employees where employee_id in (110,120,150);

--�빮�� f �����ִ� �̸��� ����Ͻÿ�
select * from employees where emp_name like '%F%';
--�ҹ��� a �� ���̴� �̸��� ����Ͻÿ�
select * from employees where emp_name like '%a%';
--�빮�� J�� ���۵Ǵ� ����� ����Ͻÿ�
select * from employees where emp_name like 'J%';
--_i 
select * from employees where emp_name like '_i%';
--__e
select * from employees where emp_name like '__e%';

-- �տ���3��° �̸��� e�� ���ԵǾ� �ִ� ����� ����Ͻÿ�.
select * from employees where emp_name like '__e%';

-- r �ڿ��� 4��° �̸��� r�� ���ԵǾ��ִ� ��� ���
select emp_name from employees where emp_name like '%r___';

--employees���̺��� department_id �� null�� ����� ����Ͻÿ�.
select * from employees where department_id is null;

--�����ȣ�� 110���� ����� ����Ͻÿ�.
select * from employees where department_id = 110;

--Ŀ�̼��� null�� ����� ����Ͻÿ�.
select * from employees where commission_pct is null;

select emp_name,employee_id,hire_date,department_id from employees 
order by employee_id asc,hire_date desc;