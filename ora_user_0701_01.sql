--insert into student2
--values
--(5,'�豸',100,100,100,300,300/3.0,0);

select * from student2;

--commit;
--insert into student values(1,'�̼���',100,100,100,300,300/3.0,0);
--insert into student values(2,'ȫ�浿',90,90,90,270,270/3.0,0);
--insert into student values(3,'������',80,80,85,245,245/3.0,0);
--insert into student values(4,'������',70,75,75,220,220/3.0,0);
--insert into student values(5,'�豸',100,100,100,100,300/3.0,0);

--drop table student;
--create table student(
--stuno number(5),
--name varchar2(20),
--kor number(3),
--eng number(3),
--math number(3),
--total number(3),
--avg number(5,2),
--rank number(3));

desc student;

select * from student;
--commit;

--rollback;

select * from student;

--delete from student
where stuno=3;

select * from student;

--delete from student
where stuno = 5;

select * from student;

rollback;

select * from student;

--delete from student
where stuno = 1;

select * from student;

commit;

select * from student;

--delete from student
where stuno=5;

rollback;

select * from student;

--insert into student values(1,'�̼���',100,100,100,(100+100+100),(100+100+100)/3.0,0);
commit;
select * from student;

select * from student order by stuno asc;


--create table student2 (
stuno number(3),
name varchar2(20),
kor number(3),
eng number(3),
math number(3),
total number(3),
avg number(5,2),
rank number(3));

select * from student;

--insert into student2 values(
6,'������',100,50,90,(100+50+90),(100+50+90)/3.0,0);

commit;

select * from student2;

--insert into student 
select * from student;
rollback;
select * from student where total>250;

select * from student;

--update student set total = 300 where total=100;
commit;
select * from student;

select * from student;

--update student set kor=92,eng=92 where stuno=2;
select * from student;

--update student set total=kor+eng+math,avg=(kor+eng+math)/3.0 where stuno=2;

select * from student;
commit;

--update student set name='�̼���' where name = '�̼���';
--update student set name='�̰���' where name = '������';
--update student set kor = 75,total = kor+eng+math, avg=(kor+eng+math)/3.0 where name = '������';
--update student set math = 95,total=kor+eng+math, avg=(kor+eng+math)/3.0 where name = '�豸';
--update student set name = 'ȫ����' where name = 'ȫ�浿';
select * from student;
--update student set math = 100,total=kor+eng+math,avg=(kor+eng+math)/3.0 where name = '�̼���';
select * from student;

rollback;

--update student set name = '�̼���' where name = '�̼���';
--update student set name = '�̰���' where name = '������';
--update student set eng = 70, total = (kor+eng+math), avg = (kor+eng+math)/3.0 where name = '������';
--update student set math = 95, total = (kor+eng+math), avg = (kor+eng+math)/3.0 where name = '�豸';
--update student set name = 'ȫ����' where name = 'ȫ�浿';
select * from student;

--insert into student values
(6,'ȫ����',80,81,88,(80+81+88),(80+81+88)/3.0,0);
--insert into student values(7,'ȫ���',90,91,99,(90+91+99),(90+91+99)/3.0,0);
--insert into student values(8,'������',100,100,91,(100+100+91),(100+100+91)/3.0,0);
--insert into student values(9,'������',99,99,50,(99+99+50),(99+99+50)/3.0,0);
--insert into student values(10,'�����',100,100,100,(100+100+100),(100+100+100)/3.0,0);
select * from student order by stuno asc;
commit;
select * from student2;
select * from student;

--insert into student
select * from student2 where stuno=12;

--insert into student
values (12,'��ȫ��',100,100,100,300,100,0);

commit;
rollback;
select * from student order by stuno;

select * from student2;

--delete from student2 s
where rowid >
(select min(rowid) from student2 s2 where s.name = s2.name);

rollback;

select * from student order by stuno;
--delete student where eng = 50;
commit;

--update student set name = '������' where stuno =3;

select * from tab;

desc student;

insert into student(stuno,name,kor,eng,math) values(13,'�����',100,100,100);
commit;

select * from student order by stuno;

desc student;

clear scr;

alter table student add stuDate date default sysdate;--�÷��߰��ϴ� ���
--alter table ���̺��̸� add �÷��� Ÿ�� 

alter table student drop column stuDate;

select * from student;

desc student;

select * from student;

insert into student (stuno,name,kor) values(14,'������',100);

select * from student order by stuno;

update student set total = kor+eng+math, avg = (kor+eng+math)/3.0, rank = 0 where stuno=13;
commit;

select * from student order by stuno;

update student set eng = 100 ;

select * from student;

rollback;

select * from student order by stuno;

commit;

select * from student order by stuno;

update student set studate = '2021-05-05' where stuno = 14;

rollback;

commit;

alter table student modify(rank number(4)); 
--alter table ���̺�� modify (�÷��� ������Ÿ��(����));

desc student;

update student set rank=null ;

alter table student rename column rank to sturank;

select * from student;

desc student;

alter table student rename column sturank to rank;

desc student;

alter table student modify (rank number(3));

desc student;

update student set rank = 0 ;

select * from student;

commit;

rollback;

update student set eng =100,math=100,total=kor+eng+math,avg=(kor+eng+math)/3.0 where stuno =14;

--�÷��� total,avg,rank ->stutotal,stuavg,sturank

alter table student rename column total to stutotal;

alter table student rename column sturank to stuavg;

alter table student rename column rank to sturank;

desc student;

alter table student modify (sturank number(5));

desc student;

alter table student add tel number(20);

alter table student drop column tel;

desc student;

update student set sturank = null;

alter table student modify (sturank number(4));

alter table student rename column stutotal to total;
alter table student rename column sturank to rank;
alter table student rename column stuavg to avg;

desc student;

alter table student drop column studate;

desc student;

rollback;

alter table student add studate date default sysdate;

select * from student;

update student set rank=0;
select * from student;

object[] o = select * from student order by stuno;

ArrayList<Student> list = new ArrayList<Student>();
select count(*) as count from student;

for(int i=0; i<count; i++){
    Student s = (Student)o[i];
    int stuno = s.getStuno;
    String name = s.getName;
    Student  s = new Student(stuno,name);
    list.add(s);
}
--jsp 
<%
for(int i=0; i<list.size();i++){
    Student s = list.get(i);
   out.println( s.getStuno());
}
%>

select stuno,name,kor,eng,total-math as total_out_math from student;












