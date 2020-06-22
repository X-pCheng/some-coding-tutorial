clear;
clc;
%% 数据预处理
load data;
pre_d=60;                   %利用过去60天数据来进行预测
n_test=150;                 %样本外测试数据个数
ER_UE1=ER_UE(1:end);
n=length(ER_UE1);
n1=n-pre_d;                 %形成的数据个数
%构建数据集
P=ones(pre_d,n1);          
T=ones(1,n1);         
for i=1:n1
    P(:,i)=ER_UE(i:i+pre_d-1);
    T(i)=ER_UE(i+pre_d-1);
end
hiddennum=[8 8];                %隐藏层神经元数
P_train=P(:,1:n1-n_test);         %训练集输入数据
T_train=T(1:n1-n_test);           %训练集输出数据
P_test=P(:,n1-n_test+1:end);      %测试集输入数据
T_test=T(n1-n_test+1:end);        %测试集输出数据
inputnum=size(P_train,1);         %输入层神经元个数
outputnum=size(T_train,1);        %输出层神经元个数
w1num=inputnum*hiddennum(1);      %输入层到1st隐藏层的权值个数
w2num=hiddennum(1)*hiddennum(2);  %1st隐藏层到2nd隐藏层的权值个数
w3num=outputnum*hiddennum(2);     %2nd隐藏层到输出层权值个数
N=w1num+w2num+w3num+sum(hiddennum)+outputnum;
%% 定义遗传算法参数
NIND=100;                          %种群大小
MAXGEN=10;                         %最大遗传代数
PRECI=10;                         %个体长度
GGAP=0.9;                        %代沟
px=0.7;                           %交叉概率
pm=0.01;                          %变异概率
trace=zeros(N+1,MAXGEN);          %寻优结果初始值
FieldD=[repmat(PRECI,1,N);repmat([-1;1],1,N);repmat([1;0;1;1],1,N)];%区域描述器
Chrom=crtbp(NIND,PRECI*N);        %创建任意离散随机种群（二进制）
%% 优化
gen=1;                            %代计数器
X=bs2rv(Chrom,FieldD);            %计算初始种群的十进制转换
ObjV=Objfun(X,P_train,T_train,hiddennum,P_test,T_test);%计算目标函数值
while gen<=MAXGEN
    fprintf('第%d代\n',gen);
    FitnV=ranking(ObjV);                     %分配适应度
    SelCh=select('sus',Chrom,FitnV,GGAP);    %选择
    SelCh=recombin('xovsp',SelCh,px);        %重组
    SelCh=mut(SelCh,pm);                     %变异
    X=bs2rv(SelCh,FieldD);                   %子代个体的二进制转换到十进制
    ObjVSel=Objfun(X,P_train,T_train,hiddennum,P_test,T_test);  %计算子代的目标函数值
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);           %将子代重插入到父代，得到新种群
    X=bs2rv(Chrom,FieldD);
    %获取每代的最优解及其序号，I为个体的序号
    [Y,I]=min(ObjV);
    trace(1:N,gen)=X(I,:);
    trace(end,gen)=Y;
    gen=gen+1;                                                   %代计数器增加
end 
%% 画进化图
figure(1);
plot(1:MAXGEN,trace(end,:));
grid on;
xlabel('遗传代数');
ylabel('误差的变化');
title('进化过程');
bestX=trace(1:end-1,end);
XT=bestX';
bestErr=trace(end,end);
fprintf(['最优初始权值和阈值：\nX=',num2str(XT),'\n最小误差err=',num2str(bestErr'),'\n']);
