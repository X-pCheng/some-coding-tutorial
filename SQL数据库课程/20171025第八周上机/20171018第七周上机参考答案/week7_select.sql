--- q1
select dtel
from department
where dname='���ѧԺ'


--- q2

select tname,birthday
from teacher
where sex='��'
order by birthday desc


--- q3

select teacher.tname,teacher.title,teacher_course.*
from teacher, teacher_course
where teacher.tno = teacher_course.tno

go

--- q4

select course.cno,cname,count(*) ѡ������
from student_course,course
where student_course.cno = course.cno
group by course.cno,cname


go

--- q5

select student.*
from student,department
where department.dno = student.dno and
	  dname = '���ѧԺ'

go


--- q6

select student.*
from student,department
where student.dno = department.dno and
	dname = '����ѧԺ' and 
    birthday < (
	select max(birthday)
	from student,department
	where student.dno = department.dno and
		dname = '����ѧԺ'
)

go


--- q7

select tname,dname
from teacher A,department B
where A.dno = B.dno and 
	tno not in (
		select distinct tno
		from teacher_course)


--- q8

select title,count(tno)
from teacher A,department B
where A.dno = B.dno and
      dname = '���ѧԺ'
group by title


--- q9

select *
from student
where sno in (
	select sno
	from student_course
	group by sno
	having count(cno)>=3
)

--- q10

select sno as ��� ,sname as ���� , '��ʦ' as ��� from student
where year(getdate())-year(birthday)<30 and sex='Ů'
union
select tno,tname , 'ѧ��'  from teacher
where sex='Ů' and year(getdate())-year(birthday)<23


--- q11

SELECT '90~100' AS ����������,COUNT(*) AS ���� FROM student_course WHERE score>=90	    UNION
SELECT '80~89' AS ����������,COUNT(*) AS ���� FROM student_course WHERE score >=80 AND score <90	UNION
SELECT '70~79' AS ����������,COUNT(*) AS ���� FROM student_course WHERE score >=70 AND score <80	UNION
SELECT '60~69' AS ����������,COUNT(*) AS ���� FROM student_course WHERE score >=60 AND score <70	UNION
SELECT '60 ����' AS ����������,COUNT(*) AS ���� FROM student_course WHERE score <60  ORDER BY 1 DESC


--- q12

select cname,avg(score)
from student A,student_course B,course C ,department D
where A.sno = B.sno and
	B.cno =C.cno and
	A.dno = D.dno and
    dname = '���ѧԺ'
group by B.cno,cname




