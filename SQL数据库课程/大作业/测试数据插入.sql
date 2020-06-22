use XX酒店客房信息管理系统
go
Insert into 客户预订订单
Values
('王丽','N12301','标准单人套房',1,GETDATE(),'15285167001'),
('张武','N12302','标准双人套房',1,GETDATE(),'15285167002'),
('李世娜','N12303','行政套房',1,GETDATE(),'15285167003'),
('郑莉','N12304','豪华套房',1,GETDATE(),'15285167004'),
('许晴雯','N12305','标准双人套房',1,GETDATE(),'15285167005')
go
select * from 客户预订订单 order by 预订时间 desc
go
Select * from 客户信息表 order by 时间 desc
go
insert into 客户入住订单
Values
('309','张武', 'N12302 ','男','标准双人套房','2',720,'15285167002',GETDATE()),
/*预订过*/
('702','郑莉', 'N12304 ','女','豪华套房','5',3888,'15285167004',GETDATE()),
/*预订过*/
('205','李凤','N12306','女','标准单人套房','1',460,'15285167006',GETDATE())
/*未预订直接办理入住*/
go
select * from 客户入住订单 order by 入住时间 desc
go
Select * from 客户信息表 order by 时间 desc
go
select * from 客房信息表 where 房号='309'
select * from 客房信息表 where 房号='702'
select * from 客房信息表 where 房号='205'
go
select 房间类型,房间类型编号,单价,剩余房间数 from 房间类型_单价表
go
Insert into 退房表(房号)
Values('702'),('205')
go
select * from 退房表 order by 退房时间 desc
go
Select * from 客户信息表 where 备注='退房'
go
select * from 客房信息表 where 房号='702'
union
select * from 客房信息表 where 房号='205'
go
select 房间类型,房间类型编号,单价,剩余房间数 from 房间类型_单价表
go