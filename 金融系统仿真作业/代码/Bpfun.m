function err = Bpfun(x,P,T,hiddennum,P_Test,T_Test)
%x:һ������ĳ�ʼȨֵ����ֵ
%P:ѵ����������
%T:ѵ���������
%hiddennum:���ز���Ԫ��
%P_Test:������������
%T_Test:���������������
%err:Ԥ��������Ԥ�����ķ���
inputnum=size(P,1);     %�������Ԫ����
outputnum=size(T,1);    %�������Ԫ����
%�½�BP����
net=newff(P,T,hiddennum,{'logsig','tansig','purelin'},'trainlm');
%�������������ѵ��������ѵ��Ŀ�ꡢ�������ʡ�ѧϰ���ʡ����ܺ���
net.trainParam.epochs=1000;
net.trainParam.max_fail=15;
net.trainParam.goal=0.001;
%net.trainParam.mc=0.8;
net.trainParam.lr=0.1;
net.performFcn='sse';%sse(SEL��ʧ),saeƽ���������(AEL)
%BP�������ʼȨֵ����ֵ
w1num=inputnum*hiddennum(1);      %����㵽1st���ز��Ȩֵ����
w2num=hiddennum(1)*hiddennum(2);  %1st���ز㵽2nd���ز��Ȩֵ����
w3num=outputnum*hiddennum(2);     %2nd���ز㵽�����Ȩֵ����
w1=x(1:w1num);
B1=x(w1num+1:w1num+hiddennum(1));
w2=x(w1num+hiddennum(1)+1:w1num+hiddennum(1)+w2num);
B2=x(w1num+hiddennum(1)+w2num+1:w1num+hiddennum(1)+w2num+hiddennum(2));
w3=x(w1num+hiddennum(1)+w2num+hiddennum(2)+1:w1num+hiddennum(1)+w2num+hiddennum(2)+w3num);
B3=x(w1num+hiddennum(1)+w2num+hiddennum(2)+w3num+1:w1num+hiddennum(1)+w2num+hiddennum(2)+w3num+outputnum);
net.iw{1,1}=reshape(w1,hiddennum(1),inputnum);
net.lw{2,1}=reshape(w2,hiddennum(2),hiddennum(1));
net.lw{3,2}=reshape(w3,outputnum,hiddennum(2));
net.b{1}=reshape(B1,hiddennum(1),1);
net.b{2}=reshape(B2,hiddennum(2),1);
net.b{3}=reshape(B3,outputnum,1);
%ѵ������
net=train(net,P,T);
%��������
Y=sim(net,P_Test);
errM=Y-T_Test;
err=sum(errM.^2)/length(errM);
end