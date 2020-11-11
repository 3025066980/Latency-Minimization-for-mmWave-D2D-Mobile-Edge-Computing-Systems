load d1d2result2.mat

W=100e6; %����
L=10e6; %Ҫ����ı�����
Fe=6400e6; %��Ե�������������
FL=900e6; %���ؼ������������
alpha=0.1; %����ѹ����

x=300:300:1800;
for i=1:6
    
    FL=x(i)*1e6;
    for j=1:50

k1=L/(W*uplinkrate(j,3));
ke=L/Fe;
k2=alpha*L/(W*downlinkrate(j,3));
kL=L/FL;
k3=alpha*L/(W*d2dlinkrate(j,3));
[rho(j,i),optime(j,i),condition(j,i)]=best_partition(k1,ke,k2,kL,k3);
localtime(j,i)=kL+k3;
edgetime(j,i)=k1+ke+k2;
[optime1(j,i)]=rho_partition(k1,ke,k2,kL,k3,0.5);


    end
end

optimal_rho=mean(rho);

size=14
linesize=1.5
set(gca,'fontsize',size-3)
set(gca,'Xcolor','k')
xlabel('F_L (Mbps)','fontsize',size)
ylabel('Offloading ratio','fontsize',size)
set(gca,'XLim',[300 1800]);
set(gca,'xTick',x)


time_plot=line(x,optimal_rho(1:6));
set(time_plot,'color','b')
set(time_plot,'linestyle','-')
set(time_plot,'linewidth',linesize)
set(time_plot,'marker','o')
grid on
box on