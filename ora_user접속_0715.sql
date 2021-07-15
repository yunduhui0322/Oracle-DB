create table mem(
id varchar2(20),
pw varchar2(30),
name varchar2(10),
gender varchar2(6),
job varchar2(10),
hobby varchar(40));

select * from mem;
drop table member2;
create table member2(
id varchar2(30),
pw varchar2(30),
name varchar2(30),
nickname varchar2(50),
gender varchar2(6),
tel varchar2(15),
address1 varchar2(200),
address2 varchar2(200),
hobby varchar2(30));

insert into member2 values(
'aaa','1111','홍길동','길동스','male','010-1111-1111','서울시 구로구 구로1동','100-1','swim,run');
commit;
delete member2 where id = 'kkk';
select * from member2;
commit;
update member2 set id = 'bbb' where id = 'bbbbb';
delete member2 where id = 'ggg';
commit;
desc member2;