--member테이블 생성 memno number 3 name 20 id 20 pw 20 gender 6 address1 100 address2 200
--hobby 24

create table member (
memno number(3),
name varchar2(20),
id varchar2(20),
pw varchar2(20),
gender varchar2(6),
address1 varchar2(100),
address2 varchar2(200),
hobby varchar2(24));

--1,홍길동,aaa,111,male,서울 구로구 구로1동,110-1,swim
insert into member values(
1,'홍길동','aaa','1111','male','서울 구로구 구로1동','110-1','swim');
insert into member values(
2,'이순신','bbb','1111','male','서울 영등포구 영등포동','100-2','game');
insert into member values(
3,'유관순','ccc','1111','female','서울 송파구 송파동','110-3','golf');
insert into member values(
4,'김미순','ddd','1111','female','서울 강남구 강남동','100-3','read');
insert into member values(
5,'홍길자','eee','1111','female','성루 동대문구 동대문동','210-1','game');
commit;
insert into member values(
6,'김감찬','fff','1111','male','서울 구로구 미로동','200-1','swim');
insert into member values(
7,'김유신','ggg','1111','male','서울 관악구 신림동','100-5','golf');
select * from member;
commit;

--id -> memeid pw ->pass

alter table member rename column id to memid;
alter table member rename column pw to pass;
desc member; 
--이름 홍들어간 사람들 출력하시오.
select * from member where name like '%홍%';
--성별이 여자인 사람을 출력
select * from member where gender like '%female%';
--구로구에 사는 사람 출력
select * from member where address1 like '%구로구%';
--age(3) 숫자형 컬럼을 추가
alter table member add age number(3);

desc member;

alter table member modify gender INVISIBLE;
alter table member modify address1 invisible;
alter table member modify address2 invisible;
alter table member modify hobby invisible;
alter table member modify gender visible;
alter table member modify address1 visible;
alter table member modify address2 visible;
alter table member modify hobby visible;
desc member;
commit;

update member set age=20 where name = '홍길동';
update member set age=35 where name = '이순신';
update member set age = 18 where name = '유관순';
update member set age = 22 where name = '김미순';
update member set age = 27 where name = '홍길자';
update member set age =30 where name = '김감찬';
update member set age = 25 where name = '김유신';
select * from member;

--나이가 20,30인 사람을 출력하시오.
select * from member where age = 20 or age = 30;
select * from member where age in (20,30);
--나이가 22~27사이의 사람을 출력
--비교연산자, between연산자
select *from member where age >=22 and age<= 27;
select * from member where age between 22 and 27;

-- address2 번지 두번째 자리수가 1로 시작되는 주소를 출력
select * from member where address2 like '_1%';

select -10,abs(-10) from dual;

-- -5와 -1의 차이는 얼마일까요? 
select -5- (-1), abs(-5 - (-1)) from dual;

select round(12.57*10)/10 from dual;

-- 58.267845 4자리에서 반올림
select round(58.267845*1000)/1000 from dual;
select round(58.267845,3) from dual;
-145.235678 5자리 버림
select floor(145.235678*10000)/10000 from dual;

select * from employees where mod(employee_id,2) = 1;