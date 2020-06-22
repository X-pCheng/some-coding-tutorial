%% ʹ�����Ȩֵ����ֵ
%�½�BP����
%FANN_SEL
net_FSEL=newff(P_train,T_train,[16 16],{'logsig','tansig','purelin'},'traingdm');
%�������������ѵ��������ѵ��Ŀ�ꡢ�������ʡ�ѧϰ���ʡ����ܺ���
net_FSEL.trainParam.epochs=3000;
net_FSEL.trainParam.max_fail=15;
net_FSEL.trainParam.goal=0.001;
net_FSEL.trainParam.mc=0.8;
net_FSEL.trainParam.lr=0.1;
net_FSEL.performFcn='sse';%sse(SEL��ʧ),saeƽ���������(AEL)
%ѵ������
net_FSEL=train(net_FSEL,P_train,T_train);
%��������
T_test_FSEL=sim(net_FSEL,P_test);
disp('1.FANN_SELʹ�����Ȩֵ����ֵ');
disp('������Ԥ����');
%disp(T_test_FSEL);
%�������������ݵĵ�������
err_FSELM=T_test_FSEL-T_test;      
%AAEƽ���������
err_FAEE=sum(abs(err_FSELM))/length(err_FSELM);
%MAPEƽ�����԰ٷֱ����
err_FMAPE=sum(abs(err_FSELM)./T_test)*100.0/length(err_FSELM);
%MSE�������
err_FMSE=sum(err_FSELM.^2)/length(err_FSELM);
%���������MaxAE
err_FMaxAE=max(abs(err_FSELM));
%R-square
err_FRS=sum(err_FSELM.^2);
err_FSEL=[err_FAEE err_FMAPE err_FMSE err_FMaxAE err_FRS];
disp('FANN_SEL������Ԥ��������:');
disp('      AAE      MAPE      MSE      MaxAE    R_square');
disp(err_FSEL);
plot(1:length(T_test),T_test,1:length(T_test),T_test_FSEL);
legend('ԭ����','FANNԤ��');
title('��150��������Ԥ��Ա�');
grid on;