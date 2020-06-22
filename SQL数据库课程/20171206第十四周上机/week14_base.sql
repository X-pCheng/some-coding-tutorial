CREATE DATABASE edu
ON  PRIMARY 
( NAME = 'educ_data', 
  FILENAME = 'c:\database\educ_data.mdf' , 
  SIZE = 3MB , 
  MAXSIZE = 100MB , 
  FILEGROWTH = 1MB)
 LOG ON 
( NAME = 'educ_log', 
  FILENAME = 'c:\database\educ_log.ldf' , 
  SIZE = 3MB , 
  MAXSIZE = 100MB , 
  FILEGROWTH = 10% 
  )
  go
  
use edu
go

create table department(
dno char(6) primary key,
dname char(8) not null,
dhome varchar(40),
dzipcode char(6),
dtel varchar(40)
)
GO

create table student(
sno char(8) not null primary key,
sname char(8) not null,
sex char(2),
[native] char(20),
birthday datetime,
pno char(4),
dno char(6),
classno char(4),
entime datetime,
home varchar(40),
tel varchar(40)
)

GO

create table course(
cno char(10) primary key,
cname char(20) not null,
cpno char(10),
experiment tinyint,
lecture tinyint,
semester tinyint,
credit tinyint,
stulimits int
)
GO

create table student_course(
sno char(8),
cno char(10),
score tinyint,
primary key(sno,cno),
)
GO
