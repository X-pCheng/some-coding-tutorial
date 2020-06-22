function err = Bpfun(x,P,T,hiddennum,P_Test,T_Test)
%x:一个个体的初始权值和阈值
%P:训练样本输入
%T:训练样本输出
%hiddennum:隐藏层神经元数
%P_Test:测试样本输入
%T_Test:测试样本期望输出
%err:预测样本的预测误差的范数
inputnum=size(P,1);     %输入层神经元个数
outputnum=size(T,1);    %输出层神经元个数
%新建BP网络
net=newff(P,T,hiddennum,{'logsig','tansig','purelin'},'trainlm');
%设置网络参数：训练次数、训练目标、动量速率、学习速率、性能函数
net.trainParam.epochs=1000;
net.trainParam.max_fail=15;
net.trainParam.goal=0.001;
%net.trainParam.mc=0.8;
net.trainParam.lr=0.1;
net.performFcn='sse';%sse(SEL损失),sae平均绝对误差(AEL)
%BP神经网络初始权值和阈值
w1num=inputnum*hiddennum(1);      %输入层到1st隐藏层的权值个数
w2num=hiddennum(1)*hiddennum(2);  %1st隐藏层到2nd隐藏层的权值个数
w3num=outputnum*hiddennum(2);     %2nd隐藏层到输出层权值个数
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
%训练网络
net=train(net,P,T);
%测试网络
Y=sim(net,P_Test);
errM=Y-T_Test;
err=sum(errM.^2)/length(errM);
end