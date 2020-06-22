clear;
clc;
%% ����Ԥ����
load data;
pre_d=60;                   %���ù�ȥ60������������Ԥ��
n_test=150;                 %������������ݸ���
ER_UE1=ER_UE(1:end);
n=length(ER_UE1);
n1=n-pre_d;                 %�γɵ����ݸ���
%�������ݼ�
P=ones(pre_d,n1);          
T=ones(1,n1);         
for i=1:n1
    P(:,i)=ER_UE(i:i+pre_d-1);
    T(i)=ER_UE(i+pre_d-1);
end
hiddennum=[8 8];                %���ز���Ԫ��
P_train=P(:,1:n1-n_test);         %ѵ������������
T_train=T(1:n1-n_test);           %ѵ�����������
P_test=P(:,n1-n_test+1:end);      %���Լ���������
T_test=T(n1-n_test+1:end);        %���Լ��������
inputnum=size(P_train,1);         %�������Ԫ����
outputnum=size(T_train,1);        %�������Ԫ����
w1num=inputnum*hiddennum(1);      %����㵽1st���ز��Ȩֵ����
w2num=hiddennum(1)*hiddennum(2);  %1st���ز㵽2nd���ز��Ȩֵ����
w3num=outputnum*hiddennum(2);     %2nd���ز㵽�����Ȩֵ����
N=w1num+w2num+w3num+sum(hiddennum)+outputnum;
%% �����Ŵ��㷨����
NIND=100;                          %��Ⱥ��С
MAXGEN=10;                         %����Ŵ�����
PRECI=10;                         %���峤��
GGAP=0.9;                        %����
px=0.7;                           %�������
pm=0.01;                          %�������
trace=zeros(N+1,MAXGEN);          %Ѱ�Ž����ʼֵ
FieldD=[repmat(PRECI,1,N);repmat([-1;1],1,N);repmat([1;0;1;1],1,N)];%����������
Chrom=crtbp(NIND,PRECI*N);        %����������ɢ�����Ⱥ�������ƣ�
%% �Ż�
gen=1;                            %��������
X=bs2rv(Chrom,FieldD);            %�����ʼ��Ⱥ��ʮ����ת��
ObjV=Objfun(X,P_train,T_train,hiddennum,P_test,T_test);%����Ŀ�꺯��ֵ
while gen<=MAXGEN
    fprintf('��%d��\n',gen);
    FitnV=ranking(ObjV);                     %������Ӧ��
    SelCh=select('sus',Chrom,FitnV,GGAP);    %ѡ��
    SelCh=recombin('xovsp',SelCh,px);        %����
    SelCh=mut(SelCh,pm);                     %����
    X=bs2rv(SelCh,FieldD);                   %�Ӵ�����Ķ�����ת����ʮ����
    ObjVSel=Objfun(X,P_train,T_train,hiddennum,P_test,T_test);  %�����Ӵ���Ŀ�꺯��ֵ
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);           %���Ӵ��ز��뵽�������õ�����Ⱥ
    X=bs2rv(Chrom,FieldD);
    %��ȡÿ�������Ž⼰����ţ�IΪ��������
    [Y,I]=min(ObjV);
    trace(1:N,gen)=X(I,:);
    trace(end,gen)=Y;
    gen=gen+1;                                                   %������������
end 
%% ������ͼ
figure(1);
plot(1:MAXGEN,trace(end,:));
grid on;
xlabel('�Ŵ�����');
ylabel('���ı仯');
title('��������');
bestX=trace(1:end-1,end);
XT=bestX';
bestErr=trace(end,end);
fprintf(['���ų�ʼȨֵ����ֵ��\nX=',num2str(XT),'\n��С���err=',num2str(bestErr'),'\n']);
