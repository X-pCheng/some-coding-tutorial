create database XX酒店客房信息管理系统
on
primary
(name=XX酒店客房信息管理系统_dat,
filename='C:\database\XX酒店客房信息管理系统.mdf',
size=100,
maxsize=500,
filegrowth=5)
log on 
(name=XX酒店客房信息管理系统_log,
filename='C:\database\XX酒店客房信息管理系统_log.ldf',
size=5,
maxsize=100,
filegrowth=1)
go
use XX酒店客房信息管理系统
go
create table 客户预订订单
(预订订单编号 int primary key identity(100001,1),
客户姓名 varchar(50) not null,
客户身份证号 varchar(50),
预订房间类型 char(20) default('标准单人套房'),
预订房间数量 int default(1) check(预订房间数量>0),
预订时间 datetime default(getdate()),
客户联系电话 varchar(30) not null)
go
use XX酒店客房信息管理系统
go
create table 客户信息表
(姓名 varchar(50) not null,
身份证号 varchar(50) not null,
性别 char(10),
联系电话 varchar(30) not null,
时间 datetime,
备注 varchar(100))
go
use XX酒店客房信息管理系统
go
create table 客户入住订单
(   入住单号  int primary key identity(200001,1),
    房号   char(6)  not null,
    客户姓名 varchar(50) not null,
	客户身份证号 varchar(50) not null,
    性别 char(10),
	房间类型    char(20)  not null,
    房间类型编号   char(3)  not null,
    单价   numeric(8,2)  default(460),
    客户联系电话 varchar(30) not null,
    入住时间   datetime  default(getdate()) not null)
go
use XX酒店客房信息管理系统
create table 房间类型_单价表
(房间类型 char(20) default('标准单人套房') primary key,
房间类型编号 char(3) default('1'), 
单价 numeric(8,2) default(460),
面积 char(50),
总房间数 int not null check(总房间数>=0),
剩余房间数 int not null check(剩余房间数>=0))
go

insert into 房间类型_单价表(房间类型,房间类型编号,单价,面积,总房间数,剩余房间数)
values
('标准单人套房','1',460,'28-36平方米',15,15),
('标准双人套房','2',720,'40-46平方米',20,20),
('无障碍客房','3',1060,'50-58平方米',8,8),
('行政套房','4',1888,'72-84平方米',6,6),
('豪华套房','5',3888,'106-120平方米',4,4),
('总统套房','6',6666,'268-298平方米',2,2)
go
use XX酒店客房信息管理系统
go
create table 客房信息表
(房号 char(6) primary key,
房间类型 char(20) default('标准单人套房'),
房间分机号 char(20) not null unique,
房间状态 char(20) not null default('空房'),
constraint pri_lb foreign key(房间类型) references 房间类型_单价表(房间类型),
check(房间状态='空房' or 房间状态='已入住'))
 go

insert into 客房信息表(房号,房间类型,房间分机号)
values
('201','标准单人套房','201'),
('202','标准单人套房','202'),
('203','标准单人套房','203'),
('204','标准单人套房','204'),
('205','标准单人套房','205'),
('206','标准单人套房','206'),
('207','标准单人套房','207'),
('208','标准单人套房','208'),
('209','标准单人套房','209'),
('210','标准单人套房','210'),
('211','标准单人套房','211'),
('212','标准单人套房','212'),
('213','标准单人套房','213'),
('214','标准单人套房','214'),
('215','标准单人套房','215')
go

insert into 客房信息表(房号,房间类型,房间分机号)
values
('301','标准双人套房','301'),
('302','标准双人套房','302'),
('303','标准双人套房','303'),
('304','标准双人套房','304'),
('305','标准双人套房','305'),
('306','标准双人套房','306'),
('307','标准双人套房','307'),
('308','标准双人套房','308'),
('309','标准双人套房','309'),
('310','标准双人套房','310'),
('401','标准双人套房','401'),
('402','标准双人套房','402'),
('403','标准双人套房','403'),
('404','标准双人套房','404'),
('405','标准双人套房','405'),
('406','标准双人套房','406'),
('407','标准双人套房','407'),
('408','标准双人套房','408'),
('409','标准双人套房','409'),
('410','标准双人套房','410')
go

insert into 客房信息表(房号,房间类型,房间分机号)
values
('501','无障碍客房','501'),
('502','无障碍客房','502'),
('503','无障碍客房','503'),
('504','无障碍客房','504'),
('505','无障碍客房','505'),
('506','无障碍客房','506'),
('507','无障碍客房','507'),
('508','无障碍客房','508')
go

insert into 客房信息表(房号,房间类型,房间分机号)
values
('601','行政套房','601'),
('602','行政套房','602'),
('603','行政套房','603'),
('604','行政套房','604'),
('605','行政套房','605'),
('606','行政套房','606')
go

insert into 客房信息表(房号,房间类型,房间分机号)
values
('701','豪华套房','701'),
('702','豪华套房','702'),
('703','豪华套房','703'),
('704','豪华套房','704'),
('801','总统套房','801'),
('802','总统套房','802')
go
use XX酒店客房信息管理系统
go
create table 退房表
(退房表编号 int primary key identity(300001,1),
 房号 char(6) not null,
 客户姓名 varchar(50),
 身份证号 varchar(50) ,
 客户联系电话 varchar(30),
 入住时间 datetime  ,
 退房时间 datetime  default(getdate()) not null,
 消费金额 numeric(8,2))
 go
  use XX酒店客房信息管理系统
 go
 create trigger back_room on 退房表
 for insert
 as
 declare cur_back_room cursor
 global scroll dynamic
 for 
 select 房号 from inserted
 open cur_back_room
 declare @cuname char(50),@cinum char(50),@rztime datetime
 declare @roomn char(10)
 fetch next from cur_back_room
 into @roomn
 while @@FETCH_STATUS=0
 begin
 select top 1 @cuname=客户姓名,@cinum=客户身份证号,@rztime=入住时间  
 from 客户入住订单 where @roomn=房号 order by 入住时间 desc
 declare @telcum char(20)
 select top 1 @telcum=客户联系电话 from 客户入住订单 
 where 客户身份证号=@cinum order by 入住时间 desc
 declare @days int,@unitp int
 select top 1 days=datediff(day,入住时间,退房时间) from 退房表 
 where 房号=@roomn order by 退房时间 desc
 select @unitp=单价 from 房间类型_单价表 where 房间类型=(select 房间类型 from 客房信息表 where 房号=@roomn)
 update 退房表
 set 客户姓名=@cuname,身份证号=@cinum,入住时间=@rztime,
 客户联系电话=@telcum,消费金额=@days*@unitp where 
 退房时间=(select top 1 退房时间 from 退房表 where @roomn=房号 order by 退房时间 desc)
 and @roomn=房号
 update 客房信息表
 set 房间状态='空房' where 房号=@roomn
 update 房间类型_单价表
 set 剩余房间数=剩余房间数+1 where 房间类型=(select 房间类型 from 客房信息表 where 房号=@roomn)
 insert into 客户信息表(姓名,身份证号,时间,联系电话,备注)
 values(@cuname,@cinum,@rztime,@telcum,'退房')
 fetch next from cur_back_room
 into @roomn
 end
 close cur_back_room
 deallocate cur_back_room
 go
 use XX酒店客房信息管理系统
go
create trigger ruzhukehu on 客户入住订单
for insert
as
declare @姓名 varchar(50),@身份证号 varchar(50),@性别 char(10),@时间 datetime,@联系电话 varchar(30),@备注 varchar(100)
set @备注='办理入住'
declare cur_rukehu cursor
global scroll dynamic
for 
select 客户姓名,客户身份证号,性别,入住时间,客户联系电话 from inserted
open cur_rukehu
fetch next from cur_rukehu
into @姓名,@身份证号,@性别,@时间,@联系电话
while @@FETCH_STATUS=0
begin
insert into 客户信息表(姓名,身份证号,性别,时间,联系电话,备注)
values(@姓名,@身份证号,@性别,@时间,@联系电话,@备注)
fetch next from cur_rukehu
into @姓名,@身份证号,@性别,@时间,@联系电话
end
close cur_rukehu
deallocate cur_rukehu
go
use XX酒店客房信息管理系统
go
create trigger room_rest on 客户入住订单
for insert 
as
declare @roomkind char(20),@roomnum char(20),@roomstate char(20)
declare cur_room_rest cursor
global scroll dynamic
for 
select 房号,房间类型 from inserted
open cur_room_rest
fetch next from cur_room_rest
into @roomnum,@roomkind
while @@FETCH_STATUS=0
begin
select @roomstate=房间状态 from 客房信息表 where 房号=@roomnum																
update 房间类型_单价表
set 剩余房间数=剩余房间数-1 where 房间类型=@roomkind 
declare @lastroomnum int
set @lastroomnum=(select 剩余房间数 from 房间类型_单价表 where 房间类型=@roomkind)
if @lastroomnum<0
print @roomkind+'余量不足'
fetch next from cur_room_rest
into @roomnum,@roomkind
end
close cur_room_rest
deallocate cur_room_rest
go
use XX酒店客房信息管理系统
go
 create trigger room_state_2 on 客户入住订单
 for insert
 as
 declare cur_room_state cursor
 global scroll dynamic
 for
 select 房号 from inserted
 open cur_room_state
 declare @roomnum char(10)
 fetch next from cur_room_state
 into @roomnum
 while @@FETCH_STATUS=0
 begin
 update 客房信息表
 set 房间状态='已入住' where 房号=@roomnum
 fetch next from cur_room_state
 into @roomnum
 end
 close cur_room_state
 deallocate cur_room_state
go
use XX酒店客房信息管理系统
go
create trigger yudingkehu on 客户预订订单
for insert
as
declare @姓名 varchar(50),@身份证号 varchar(50),@时间 datetime,@联系电话 varchar(30),@备注 varchar(100)
set @备注='预订客房'
declare cur_yuke cursor
global scroll dynamic
for 
select 客户姓名,客户身份证号,预订时间,客户联系电话 from inserted
open cur_yuke
fetch next from cur_yuke
into @姓名,@身份证号,@时间,@联系电话
while @@FETCH_STATUS=0
begin
insert into 客户信息表(姓名,身份证号,时间,联系电话,备注)
values(@姓名,@身份证号,@时间,@联系电话,@备注)
fetch next from cur_yuke
into @姓名,@身份证号,@时间,@联系电话
end
close cur_yuke
deallocate cur_yuke
go