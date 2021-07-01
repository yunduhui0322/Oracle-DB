create table student(
stuNo number(5),
name varchar2(20),
kor number(3),
eng number(3),
math number(3),
total number(3),
avg number(5,2),
rank number(3)
);

select * from tab;

desc student;

grant select,insert,delete,update on student to ora_user;

commit;

insert into student
(stuno,name,kor,eng,math,total,avg,rank) values
(1,'ȫ�浿',100,100,100,(100+100+100),(100+100+100)/3.0,0);