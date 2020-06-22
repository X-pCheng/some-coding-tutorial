create database XX�Ƶ�ͷ���Ϣ����ϵͳ
on
primary
(name=XX�Ƶ�ͷ���Ϣ����ϵͳ_dat,
filename='C:\database\XX�Ƶ�ͷ���Ϣ����ϵͳ.mdf',
size=100,
maxsize=500,
filegrowth=5)
log on 
(name=XX�Ƶ�ͷ���Ϣ����ϵͳ_log,
filename='C:\database\XX�Ƶ�ͷ���Ϣ����ϵͳ_log.ldf',
size=5,
maxsize=100,
filegrowth=1)
go
use XX�Ƶ�ͷ���Ϣ����ϵͳ
go
create table �ͻ�Ԥ������
(Ԥ��������� int primary key identity(100001,1),
�ͻ����� varchar(50) not null,
�ͻ����֤�� varchar(50),
Ԥ���������� char(20) default('��׼�����׷�'),
Ԥ���������� int default(1) check(Ԥ����������>0),
Ԥ��ʱ�� datetime default(getdate()),
�ͻ���ϵ�绰 varchar(30) not null)
go
use XX�Ƶ�ͷ���Ϣ����ϵͳ
go
create table �ͻ���Ϣ��
(���� varchar(50) not null,
���֤�� varchar(50) not null,
�Ա� char(10),
��ϵ�绰 varchar(30) not null,
ʱ�� datetime,
��ע varchar(100))
go
use XX�Ƶ�ͷ���Ϣ����ϵͳ
go
create table �ͻ���ס����
(   ��ס����  int primary key identity(200001,1),
    ����   char(6)  not null,
    �ͻ����� varchar(50) not null,
	�ͻ����֤�� varchar(50) not null,
    �Ա� char(10),
	��������    char(20)  not null,
    �������ͱ��   char(3)  not null,
    ����   numeric(8,2)  default(460),
    �ͻ���ϵ�绰 varchar(30) not null,
    ��סʱ��   datetime  default(getdate()) not null)
go
use XX�Ƶ�ͷ���Ϣ����ϵͳ
create table ��������_���۱�
(�������� char(20) default('��׼�����׷�') primary key,
�������ͱ�� char(3) default('1'), 
���� numeric(8,2) default(460),
��� char(50),
�ܷ����� int not null check(�ܷ�����>=0),
ʣ�෿���� int not null check(ʣ�෿����>=0))
go

insert into ��������_���۱�(��������,�������ͱ��,����,���,�ܷ�����,ʣ�෿����)
values
('��׼�����׷�','1',460,'28-36ƽ����',15,15),
('��׼˫���׷�','2',720,'40-46ƽ����',20,20),
('���ϰ��ͷ�','3',1060,'50-58ƽ����',8,8),
('�����׷�','4',1888,'72-84ƽ����',6,6),
('�����׷�','5',3888,'106-120ƽ����',4,4),
('��ͳ�׷�','6',6666,'268-298ƽ����',2,2)
go
use XX�Ƶ�ͷ���Ϣ����ϵͳ
go
create table �ͷ���Ϣ��
(���� char(6) primary key,
�������� char(20) default('��׼�����׷�'),
����ֻ��� char(20) not null unique,
����״̬ char(20) not null default('�շ�'),
constraint pri_lb foreign key(��������) references ��������_���۱�(��������),
check(����״̬='�շ�' or ����״̬='����ס'))
 go

insert into �ͷ���Ϣ��(����,��������,����ֻ���)
values
('201','��׼�����׷�','201'),
('202','��׼�����׷�','202'),
('203','��׼�����׷�','203'),
('204','��׼�����׷�','204'),
('205','��׼�����׷�','205'),
('206','��׼�����׷�','206'),
('207','��׼�����׷�','207'),
('208','��׼�����׷�','208'),
('209','��׼�����׷�','209'),
('210','��׼�����׷�','210'),
('211','��׼�����׷�','211'),
('212','��׼�����׷�','212'),
('213','��׼�����׷�','213'),
('214','��׼�����׷�','214'),
('215','��׼�����׷�','215')
go

insert into �ͷ���Ϣ��(����,��������,����ֻ���)
values
('301','��׼˫���׷�','301'),
('302','��׼˫���׷�','302'),
('303','��׼˫���׷�','303'),
('304','��׼˫���׷�','304'),
('305','��׼˫���׷�','305'),
('306','��׼˫���׷�','306'),
('307','��׼˫���׷�','307'),
('308','��׼˫���׷�','308'),
('309','��׼˫���׷�','309'),
('310','��׼˫���׷�','310'),
('401','��׼˫���׷�','401'),
('402','��׼˫���׷�','402'),
('403','��׼˫���׷�','403'),
('404','��׼˫���׷�','404'),
('405','��׼˫���׷�','405'),
('406','��׼˫���׷�','406'),
('407','��׼˫���׷�','407'),
('408','��׼˫���׷�','408'),
('409','��׼˫���׷�','409'),
('410','��׼˫���׷�','410')
go

insert into �ͷ���Ϣ��(����,��������,����ֻ���)
values
('501','���ϰ��ͷ�','501'),
('502','���ϰ��ͷ�','502'),
('503','���ϰ��ͷ�','503'),
('504','���ϰ��ͷ�','504'),
('505','���ϰ��ͷ�','505'),
('506','���ϰ��ͷ�','506'),
('507','���ϰ��ͷ�','507'),
('508','���ϰ��ͷ�','508')
go

insert into �ͷ���Ϣ��(����,��������,����ֻ���)
values
('601','�����׷�','601'),
('602','�����׷�','602'),
('603','�����׷�','603'),
('604','�����׷�','604'),
('605','�����׷�','605'),
('606','�����׷�','606')
go

insert into �ͷ���Ϣ��(����,��������,����ֻ���)
values
('701','�����׷�','701'),
('702','�����׷�','702'),
('703','�����׷�','703'),
('704','�����׷�','704'),
('801','��ͳ�׷�','801'),
('802','��ͳ�׷�','802')
go
use XX�Ƶ�ͷ���Ϣ����ϵͳ
go
create table �˷���
(�˷����� int primary key identity(300001,1),
 ���� char(6) not null,
 �ͻ����� varchar(50),
 ���֤�� varchar(50) ,
 �ͻ���ϵ�绰 varchar(30),
 ��סʱ�� datetime  ,
 �˷�ʱ�� datetime  default(getdate()) not null,
 ���ѽ�� numeric(8,2))
 go
  use XX�Ƶ�ͷ���Ϣ����ϵͳ
 go
 create trigger back_room on �˷���
 for insert
 as
 declare cur_back_room cursor
 global scroll dynamic
 for 
 select ���� from inserted
 open cur_back_room
 declare @cuname char(50),@cinum char(50),@rztime datetime
 declare @roomn char(10)
 fetch next from cur_back_room
 into @roomn
 while @@FETCH_STATUS=0
 begin
 select top 1 @cuname=�ͻ�����,@cinum=�ͻ����֤��,@rztime=��סʱ��  
 from �ͻ���ס���� where @roomn=���� order by ��סʱ�� desc
 declare @telcum char(20)
 select top 1 @telcum=�ͻ���ϵ�绰 from �ͻ���ס���� 
 where �ͻ����֤��=@cinum order by ��סʱ�� desc
 declare @days int,@unitp int
 select top 1 days=datediff(day,��סʱ��,�˷�ʱ��) from �˷��� 
 where ����=@roomn order by �˷�ʱ�� desc
 select @unitp=���� from ��������_���۱� where ��������=(select �������� from �ͷ���Ϣ�� where ����=@roomn)
 update �˷���
 set �ͻ�����=@cuname,���֤��=@cinum,��סʱ��=@rztime,
 �ͻ���ϵ�绰=@telcum,���ѽ��=@days*@unitp where 
 �˷�ʱ��=(select top 1 �˷�ʱ�� from �˷��� where @roomn=���� order by �˷�ʱ�� desc)
 and @roomn=����
 update �ͷ���Ϣ��
 set ����״̬='�շ�' where ����=@roomn
 update ��������_���۱�
 set ʣ�෿����=ʣ�෿����+1 where ��������=(select �������� from �ͷ���Ϣ�� where ����=@roomn)
 insert into �ͻ���Ϣ��(����,���֤��,ʱ��,��ϵ�绰,��ע)
 values(@cuname,@cinum,@rztime,@telcum,'�˷�')
 fetch next from cur_back_room
 into @roomn
 end
 close cur_back_room
 deallocate cur_back_room
 go
 use XX�Ƶ�ͷ���Ϣ����ϵͳ
go
create trigger ruzhukehu on �ͻ���ס����
for insert
as
declare @���� varchar(50),@���֤�� varchar(50),@�Ա� char(10),@ʱ�� datetime,@��ϵ�绰 varchar(30),@��ע varchar(100)
set @��ע='������ס'
declare cur_rukehu cursor
global scroll dynamic
for 
select �ͻ�����,�ͻ����֤��,�Ա�,��סʱ��,�ͻ���ϵ�绰 from inserted
open cur_rukehu
fetch next from cur_rukehu
into @����,@���֤��,@�Ա�,@ʱ��,@��ϵ�绰
while @@FETCH_STATUS=0
begin
insert into �ͻ���Ϣ��(����,���֤��,�Ա�,ʱ��,��ϵ�绰,��ע)
values(@����,@���֤��,@�Ա�,@ʱ��,@��ϵ�绰,@��ע)
fetch next from cur_rukehu
into @����,@���֤��,@�Ա�,@ʱ��,@��ϵ�绰
end
close cur_rukehu
deallocate cur_rukehu
go
use XX�Ƶ�ͷ���Ϣ����ϵͳ
go
create trigger room_rest on �ͻ���ס����
for insert 
as
declare @roomkind char(20),@roomnum char(20),@roomstate char(20)
declare cur_room_rest cursor
global scroll dynamic
for 
select ����,�������� from inserted
open cur_room_rest
fetch next from cur_room_rest
into @roomnum,@roomkind
while @@FETCH_STATUS=0
begin
select @roomstate=����״̬ from �ͷ���Ϣ�� where ����=@roomnum																
update ��������_���۱�
set ʣ�෿����=ʣ�෿����-1 where ��������=@roomkind 
declare @lastroomnum int
set @lastroomnum=(select ʣ�෿���� from ��������_���۱� where ��������=@roomkind)
if @lastroomnum<0
print @roomkind+'��������'
fetch next from cur_room_rest
into @roomnum,@roomkind
end
close cur_room_rest
deallocate cur_room_rest
go
use XX�Ƶ�ͷ���Ϣ����ϵͳ
go
 create trigger room_state_2 on �ͻ���ס����
 for insert
 as
 declare cur_room_state cursor
 global scroll dynamic
 for
 select ���� from inserted
 open cur_room_state
 declare @roomnum char(10)
 fetch next from cur_room_state
 into @roomnum
 while @@FETCH_STATUS=0
 begin
 update �ͷ���Ϣ��
 set ����״̬='����ס' where ����=@roomnum
 fetch next from cur_room_state
 into @roomnum
 end
 close cur_room_state
 deallocate cur_room_state
go
use XX�Ƶ�ͷ���Ϣ����ϵͳ
go
create trigger yudingkehu on �ͻ�Ԥ������
for insert
as
declare @���� varchar(50),@���֤�� varchar(50),@ʱ�� datetime,@��ϵ�绰 varchar(30),@��ע varchar(100)
set @��ע='Ԥ���ͷ�'
declare cur_yuke cursor
global scroll dynamic
for 
select �ͻ�����,�ͻ����֤��,Ԥ��ʱ��,�ͻ���ϵ�绰 from inserted
open cur_yuke
fetch next from cur_yuke
into @����,@���֤��,@ʱ��,@��ϵ�绰
while @@FETCH_STATUS=0
begin
insert into �ͻ���Ϣ��(����,���֤��,ʱ��,��ϵ�绰,��ע)
values(@����,@���֤��,@ʱ��,@��ϵ�绰,@��ע)
fetch next from cur_yuke
into @����,@���֤��,@ʱ��,@��ϵ�绰
end
close cur_yuke
deallocate cur_yuke
go