load d3result4.mat

W=100e6; %����
L=10e6; %Ҫ����ı�����
Fe=6400e6; %��Ե�������������
FL=900e6; %���ؼ������������
alpha=0.2; %����ѹ����

avguplinkrate=mean(uplinkrate);
avgdownlinkrate=mean(downlinkrate);
avgd2dlinkrate=mean(d2dlinkrate);
    
x=0:10:50;
for i=1:6
 
k1=L/(W*avguplinkrate(1));
ke=L/Fe;
k2=alpha*L/(W*avgdownlinkrate(1));
kL=L/FL;
k3=alpha*L/(W*avgd2dlinkrate(i));
[rho(i),optime(i),condition(i)]=best_partition(k1,ke,k2,kL,k3);  
end

plot(rho)

