function Obj = Objfun(X,P,T,hiddennum,P_Test,T_Test)
%%�����ֱ������Ⱥ�и��������Ŀ��ֵ
%X�����и���ĳ�ʼֵ����ֵ
%P��ѵ����������
%T��ѵ���������
%hiddennum�����ز���Ԫ��
%P_Test��������������
%T_Test�����������������
%Obj�����и���Ԥ������Ԥ�����ķ���
[M,~]=size(X);
Obj=zeros(M,1);
for i=1:M
    Obj(i)=Bpfun(X(i,:),P,T,hiddennum,P_Test,T_Test);
end
