%% 使用优化后的权值与阈值
%新建BP网络
%GANN_SEL
net_GSEL=newff(P_train,T_train,hiddennum,{'logsig','tansig','purelin'},'trainlm');
%设置网络参数：训练次数、训练目标、动量速率、学习速率、性能函数
net_GSEL.trainParam.epochs=1000;
net_GSEL.trainParam.max_fail=15;
net_GSEL.trainParam.goal=0.001;
%net_GSEL.trainParam.mc=0.8;
net_GSEL.trainParam.lr=0.1;
net_GSEL.performFcn='sse';%sse(SEL损失),sae平均绝对误差(AEL)
%BP神经网络初始权值和阈值
XT=bestX';
w1=XT(1:w1num);
B1=XT(w1num+1:w1num+hiddennum(1));
w2=XT(w1num+hiddennum(1)+1:w1num+hiddennum(1)+w2num);
B2=XT(w1num+hiddennum(1)+w2num+1:w1num+hiddennum(1)+w2num+hiddennum(2));
w3=XT(w1num+hiddennum(1)+w2num+hiddennum(2)+1:w1num+hiddennum(1)+w2num+hiddennum(2)+w3num);
B3=XT(w1num+hiddennum(1)+w2num+hiddennum(2)+w3num+1:w1num+hiddennum(1)+w2num+hiddennum(2)+w3num+outputnum);
net_GSEL.iw{1,1}=reshape(w1,hiddennum(1),inputnum);
net_GSEL.lw{2,1}=reshape(w2,hiddennum(2),hiddennum(1));
net_GSEL.lw{3,2}=reshape(w3,outputnum,hiddennum(2));
net_GSEL.b{1}=reshape(B1,hiddennum(1),1);
%训练网络
net_GSEL=train(net_GSEL,P_train,T_train);
%测试网络
T_test_GSEL=sim(net_GSEL,P_test);
disp('1.GANN_SEL使用优化后的权值与阈值');
disp('样本外预测结果');
%disp(T_test_GSEL);
%所有样本外数据的的误差矩阵
err_GSELM=T_test_GSEL-T_test;      
%AAE平均绝对误差
err_GAEE=sum(abs(err_GSELM))/length(err_GSELM);
%MAPE平均绝对百分比误差
err_GMAPE=sum(abs(err_GSELM)./T_test)*100.0/length(err_GSELM);
%MSE均方误差
err_GMSE=sum(err_GSELM.^2)/length(err_GSELM);
%最大绝对误差MaxAE
err_GMaxAE=max(abs(err_GSELM));
%R-square
err_GRS=sum(err_GSELM.^2);
err_GSEL=[err_GAEE err_GMAPE err_GMSE err_GMaxAE err_GRS];
disp('GANN_SEL样本外预测仿真误差:');
disp('      AAE      MAPE      MSE      MaxAE    R_square');
disp(err_GSEL);
plot(1:length(T_test),T_test,1:length(T_test),T_test_GSEL);
legend('原数据','GANN预测');
title('后150天样本外预测对比');
grid on;