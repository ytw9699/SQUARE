INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL,ADDRESS,ZIPCODE,ACCOUNT,PROFILE_IMG,JUMIN,PHONE_NUM,STATUS,reg_date,DOT_SUM,AUTHORITY)
VALUES ('a6',1,'a','a','a','a',1,'a',1,1,1,sysdate,1,1)

INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL,ADDRESS,ZIPCODE,ACCOUNT,PROFILE_IMG,JUMIN,PHONE_NUM,STATUS,reg_date,DOT_SUM)
VALUES ('a6',1,'a','a','a','a',1,'a',1,1,1,'2018-04-10',1)

drop table MEMBER

INSERT INTO board(board_author,board_subject,board_content,board_upload,line_num,board_num,board_up,board_down,board_dot,board_singo,board_readcount,board_status,board_regdate)
VALUES ('test','2','b','b',2,2,2,2,2,2,2,2,sysdate)


insert into DOT_CHARGE(DC_NUM,DC_ID,DC_VALUE,DC_STATUS,DC_DATE)
values(2,'9',100,0,sysdate)

insert into DOT_EXCHANGE(DE_NUM,DE_ID,DE_VALUE,DE_STATUS,DE_DATE)
values(1,'2',100,0,sysdate)
======================================================================

select TO_CHAR(REG_DATE,'YYYY-MM-DD')
FROM MEMBER;

SELECT REG_DATE FROM MEMBER

select to_char(reg_date, 'YYYY/MM/DD, HH24:MI:SS')
FROM MEMBER

집합함수 <> 단일행함수는 한 행만
select * from emp

select sum(sal) from emp--합계--14개의값 합계

select count(*)from emp--전부

select count(comm)from emp--3개,11개의 null값을 안가져옴,count함수의 주의점

select sum(comm)/14 from emp
select sum(comm)/3 from emp
select avg(comm) from emp--null값은 포함되지 않음

select deptno, avg(sal) from emp--부서번호를 기준으로 해서 평균을 뽑아낸다,이거안하면 클래스에서 연산해줘야함..
group by deptno

select deptno, avg(sal) from emp
group by deptno
having avg(sal) > 2000--2000보다 큰걸로 조건

select * from recyclebin

delete 

truncate

select deptno, avg(sal) from emp
group by deptno
having avg(sal) > 2000

drop table emp02 purge

create table emp0199
as select * from emp

select * from tab 

desc emp--디벨로퍼에서만

drop table emp02 purge--완전삭제

create table emp0199--테이블 그대로 복사
as select * from emp

select * from recyclebin--삭제된정보가들어있음

rename emp98 to emp100;--테이블 이름 수정

alter table emp add(job2 varchar2(10)); --칼럼추가
alter table emp modify(job2 varchar2(30)); --수정
alter table emp drop column job2;--삭제

truncate table emp99--모든행 완전 삭제
delete from emp99--모든행 완전 삭제--하지만 커밋안하면 롤백가능,그래서 많은 자원이소모..
delete from emp 99 where 특정행;

desc user_tables

select * from user_tables

show user

select * from user_constraints

select * from user_constraints where table_name='ITEM_DETAIL'


select * from emp;--14
select * from dept;--8

select * from emp, dept;

select e.empno,e.ename,e.deptno,d.dname from emp e, dept d
where e.deptno = d.deptno;

select e.empno,e.ename,e.deptno,d.dname from emp e, dept d
where e.deptno = d.deptno and ename='SCOTT';

select * from salgrade;

select e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal >= s.LOSAL and e.sal <= s.hisal

select e.empno,e.ename,e.deptno,d.dname from emp e, dept d
where e.deptno(+) = d.deptno;

select e.empno,e.ename,e.deptno,d.dname from emp e, dept d
where e.deptno = d.deptno(+);

select e.ename, e2.ename
from emp e, emp e2
where e.mgr =e2.empno;


select e.empno,e.ename,e.deptno,d.dname
from emp e inner join dept d
on e.deptno = d.deptno;

select e.empno,e.ename,e.deptno,d.dname
from emp e cross join dept d

select empno,ename,dname
from emp inner join dept 
using(DEPTNO);

select empno,ename,dname
from emp NATURAL join dept 

select * from emp

select * from dept

select dname from dept where deptno=20;

select deptno from emp where ename='SCOTT';

select dname from dept where deptno=(select deptno from emp where ename='SCOTT')--서브쿼리

select * from emp;

select empno, ename, sal from emp
where sal > 3000

select empno, ename, sal from emp
where deptno = (select deptno from emp where ename ='SMITH')

select empno, ename, sal from emp
where deptno in (select distinct deptno from emp where sal >= 3000)--distinct는 중복을 제거, in은 or연산

select ename, sal from emp where sal > all (select sal from emp where deptno = 30);--all은 and조건 2850이라는 최대값보다 결국 큰거가져와라

select ename, sal from emp where sal > any (select sal from emp where deptno = 30);--any은 모두


select * from emp88;

create table emp88
as select * from emp

drop table emp88 purge;


create table emp88
as select empno, ename from emp;

create table emp88
as select * from emp where 1=0;

insert into emp88
select * from emp;

update dept01 set loc =(select loc from dept01 where deptno = 30) where deptno=10;--업데이트

update dept01 set(dname,loc) = (select dname, loc from dept01 where deptno = 40) where deptno = 20;--업데이트

delete from emp888 where deptno =(select deptno from dept where dname = 'SALES');--삭제
















