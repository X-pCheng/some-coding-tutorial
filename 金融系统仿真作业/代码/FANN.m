%% 使用随机权值与阈值
%新建BP网络
%FANN_SEL
net_FSEL=newff(P_train,T_train,[16 16],{'logsig','tansig','purelin'},'traingdm');
%设置网络参数：训练次数、训练目标、动量速率、学习速率、性能函数
net_FSEL.trainParam.epochs=3000;
net_FSEL.trainParam.max_fail=15;
net_FSEL.trainParam.goal=0.001;
net_FSEL.trainParam.mc=0.8;
net_FSEL.trainParam.lr=0.1;
net_FSEL.performFcn='sse';%sse(SEL损失),sae平均绝对误差(AEL)
%训练网络
net_FSEL=train(net_FSEL,P_train,T_train);
%测试网络
T_test_FSEL=sim(net_FSEL,P_test);
disp('1.FANN_SEL使用随机权值与阈值');
disp('样本外预测结果');
%disp(T_test_FSEL);
%所有样本外数据的的误差矩阵
err_FSELM=T_test_FSEL-T_test;      
%AAE平均绝对误差
err_FAEE=sum(abs(err_FSELM))/length(err_FSELM);
%MAPE平均绝对百分比误差
err_FMAPE=sum(abs(err_FSELM)./T_test)*100.0/length(err_FSELM);
%MSE均方误差
err_FMSE=sum(err_FSELM.^2)/length(err_FSELM);
%最大绝对误差MaxAE
err_FMaxAE=max(abs(err_FSELM));
%R-square
err_FRS=sum(err_FSELM.^2);
err_FSEL=[err_FAEE err_FMAPE err_FMSE err_FMaxAE err_FRS];
disp('FANN_SEL样本外预测仿真误差:');
disp('      AAE      MAPE      MSE      MaxAE    R_square');
disp(err_FSEL);
plot(1:length(T_test),T_test,1:length(T_test),T_test_FSEL);
legend('原数据','FANN预测');
title('后150天样本外预测对比');
grid on;