function Obj = Objfun(X,P,T,hiddennum,P_Test,T_Test)
%%用来分别求解种群中各个个体的目标值
%X：所有个体的初始值和阈值
%P：训练样本输入
%T：训练样本输出
%hiddennum：隐藏层神经元数
%P_Test：测试样本输入
%T_Test：测试样本期望输出
%Obj：所有个体预测样本预测误差的范数
[M,~]=size(X);
Obj=zeros(M,1);
for i=1:M
    Obj(i)=Bpfun(X(i,:),P,T,hiddennum,P_Test,T_Test);
end
