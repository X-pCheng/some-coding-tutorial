use XX�Ƶ�ͷ���Ϣ����ϵͳ
go
Insert into �ͻ�Ԥ������
Values
('����','N12301','��׼�����׷�',1,GETDATE(),'15285167001'),
('����','N12302','��׼˫���׷�',1,GETDATE(),'15285167002'),
('������','N12303','�����׷�',1,GETDATE(),'15285167003'),
('֣��','N12304','�����׷�',1,GETDATE(),'15285167004'),
('������','N12305','��׼˫���׷�',1,GETDATE(),'15285167005')
go
select * from �ͻ�Ԥ������ order by Ԥ��ʱ�� desc
go
Select * from �ͻ���Ϣ�� order by ʱ�� desc
go
insert into �ͻ���ס����
Values
('309','����', 'N12302 ','��','��׼˫���׷�','2',720,'15285167002',GETDATE()),
/*Ԥ����*/
('702','֣��', 'N12304 ','Ů','�����׷�','5',3888,'15285167004',GETDATE()),
/*Ԥ����*/
('205','���','N12306','Ů','��׼�����׷�','1',460,'15285167006',GETDATE())
/*δԤ��ֱ�Ӱ�����ס*/
go
select * from �ͻ���ס���� order by ��סʱ�� desc
go
Select * from �ͻ���Ϣ�� order by ʱ�� desc
go
select * from �ͷ���Ϣ�� where ����='309'
select * from �ͷ���Ϣ�� where ����='702'
select * from �ͷ���Ϣ�� where ����='205'
go
select ��������,�������ͱ��,����,ʣ�෿���� from ��������_���۱�
go
Insert into �˷���(����)
Values('702'),('205')
go
select * from �˷��� order by �˷�ʱ�� desc
go
Select * from �ͻ���Ϣ�� where ��ע='�˷�'
go
select * from �ͷ���Ϣ�� where ����='702'
union
select * from �ͷ���Ϣ�� where ����='205'
go
select ��������,�������ͱ��,����,ʣ�෿���� from ��������_���۱�
go