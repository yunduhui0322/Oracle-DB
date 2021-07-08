--사원번호 짝수만 출력
select * from employees  where mod(employee_id,2) = 0 order by employee_id;

--132.57820 3자리에서 반올림
select round(132.57820,2) from dual;

create sequence b_seq
increment by 1 --1씩증가
start with 1 --1부터시작
minvalue 1 -- 최솟값 1
maxvalue 1000 --최댓값 1000
nocycle; --사이클 X

-- member 테이블 1개 만들기
-- memNo number4,memId 20,memPw 30,name 30,tel 13,gender 5
--address1 100, adress2 100, hobby 30;

create table member(
memNo number(4),
memId varchar2(20),
memPw varchar2(30),
name varchar2(30),
tel varchar2(13),
gender varchar2(5),
address1 varchar2(100),
address2 varchar2(100),
hobby varchar2(30));

desc member;

insert into member values(
b_seq.nextval,'aaa','111','홍길동','010-1111-1111','male','서울 구로구 구로동','100-11','swim');
--b_seq.nextval번호넣어주기,명령어가 나오면 무조건 시퀀스가 증가된다.
--b_seq.currval 현재 시퀀스 번호를 보여준다.
commit;

select b_seq.currval from dual;
select * from member;
insert into member values(
b_seq.nextval,'bbb','1111','이순신','010-2222-2222','male','서울 강남구 강남동','200-1','golf');


select * from member;
--컬럼 데이터타입 변경
alter table member modify (gender  varchar2(6));

--memDate 컬럼 추가 date
alter table member add memDate date;

update member set memDate = sysdate where memno = 3;
commit;
select * from member;

--날짜를 현재날짜 모두 변경
update member set memDate = sysdate where memno = 1 or memno = 2;
commit;

-- board 테이블 생성
-- bid number(4),btitle 50, bcontent 2000, bname 30,
--bgroup number(4),bstep number(4),bindent number(4),bdate date, bupload 80

create table board(
bid number(4),
btitle varchar2(50),
bcontent varchar2(2000),
bname varchar2(30),
bgroup number(4),
bstep number(4),
bindent number(4),
bdate date,
bupload varchar(80));

desc board;

insert into board values(
board_seq.nextval,'게시판제목','게시판내용입니다.','홍길동',board_seq.currval,
0,0,sysdate,'1.jpg');

select * from board;
commit;

insert into board values(
board_seq.nextval,'홈페이지 오픈','홈페이지를 오픈했습니다','관리자',
board_seq.currval,0,0,sysdate,'2.jpg');

select * from board;
commit;

select board_seq.currval from dual;

insert into board values(
board_seq.nextval,'이벤트진행','이벤트를 진행합니다.','관리자',
board_seq.currval,0,0,sysdate,'3.jpg');

select * from board;
commit;
--bstep ->들여쓰기 , bgroup 답글전체가 bgroup, bstep ->답글의 순서

--mem_seq

select * from tab;

select * from member;

insert into member values(
mem_seq.nextval,'ddd','1111','김두한','010-4444-4444','male','서울 종로구 주먹동','400-4','fight',sysdate);
insert into member values(
mem_seq.nextval,'eee','1111','신사임당','010-5555-5555','female','인천 미추홀구 용현동','500-5','write',sysdate);
insert into member values(
mem_seq.nextval,'fff','1111','김억두','010-6666-6666','male','논산 강경구 내동','600-6','cook',sysdate);
select * from member;
insert into member values(
mem_seq.nextval,'ggg','1111','김구','010-7777-7777','male','서울 구로구 구로3동','700-7','golf',sysdate);

update member set memno=4,name = '홍길자' where memid = 'ddd';
select * from member;
update member set memno=5, name = '이홍길' where memid = 'eee';
update member set address1 = '서울 금천구 녹산동' where memid = 'eee';
update member set memno = 7 where name = '김구';
select * from member;
update member set address2 = '700-1' where memno = 7;

create table emp01(
empno number(4),
ename varchar2(10),
hiredate date);
--1.emp_seq 시퀀스 만들기 1,1,1,1,100000
--2.table 생성 - table name =>emp 01 //empno 숫자 크기4 ename 문자열 크기 10 hiredate date
--3. nextval을 사용하여 3개의 데이터 삽입
insert into emp01 values(
emp_seq.nextval,'홍길동',sysdate);
insert into emp01 values(
emp_seq.nextval,'이순신',sysdate);
insert into emp01 values(
emp_seq.nextval,'유관순',sysdate);
select * from emp01;

select * from employees order by employee_id;

select count(*) from employees;

select sum(salary) from employees;

select avg(salary) from employees;

select min(salary) from employees;

select emp_name,salary from employees where salary=(select min(salary) from employees);

select max(salary) from employees;

select department_id from employees;

select max(salary) from employees where department_id = 50;

select emp_name,salary from employees 
where department_id = 50 and 
salary = (select max(salary) from employees where department_id =50);

select count(*) from employees;

select emp_name,commission_pct from employees;

select count(commission_pct) from employees;
--count는 현재값이 있는것만 나온다.

--평균월급 보다 많이 받는사람을 출력하시오
select emp_name,salary from employees where salary>(select avg(salary) from employees);

select count(*) from employees where commission_pct is null ;

select max(salary),min(salary),max(salary)-min(salary) from employees;

select abs(-20) as "절대값" from dual;

create table numData(
num number(3),
varch varchar2(3),
num_varch varchar2(3),
varch_num number(3));

insert into numdata values(
100,'100','300',400);

commit;

update numdata set varch='200' where num = 100;

select * from numdata;

select num,varch_num,num+varch_num from numdata;

select num,varch,varch+num from numdata;

update numdata set varch = 'v200';

alter table numdata modify varch varchar2(4);

select num,varch,num+varch from employees;

select salary as "달러기준",to_char( salary*1250,'L999,999,999' )as "원화기준" from employees;
--$달러표시는 ->달러표시 L은 나라의 원화표시(한글 OS체제 때문에)

--연봉 + 커미션 금액, 1000단위표시 -달라표시 넣고
--(연봉 + 커미션금액)*1250 1000단위

select to_char(salary*12+(salary*nvl(commission_pct,0))*12,'$999,999,999') as "달러",
to_char((salary*12+(salary*nvl(commission_pct,0))*12)*1250,'L999,999,999') as "원화" from employees order by "원화" desc; 

select hire_date from employees;
select to_char(hire_date,'yyyy"년"MM"월"dd"일" pm hh"시"mi"분"ss"초"') from employees;

select to_char(bdate,'yyyy-mm-dd pm hh24:mi:ss dy"요일"') from board;

insert into board values(
board_seq.nextval,'공지사항 제목','내일은 수업이 계속진행됩니다.',
'관리자',board_seq.currval,0,0,sysdate,'4.jpg');

commit ;

select to_char(bdate,'yyyy-mm-dd pm hh24:mi:ss dy"요일"') from board;

select sysdate-to_date('19960322','yyyymmdd') from dual;

select hire_date,floor((sysdate - hire_date)/365) as day from employees order by day;