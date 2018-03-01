%% Impulse Response Functions
load('fyj1.mat'); % the .mat contains all the data
capital=zeros(1,20);
tech=zeros(1,20);
cons=zeros(1,20);
GDP=zeros(1,20);
invest=zeros(1,20);
jr=1:2:39;
jc=0;
epsl=[0;sigmagamma];

for j=jr
    jc=jc+1;
    Mfact=M^(j-1)*epsl;
    capital(jc)=Mfact(1);
    tech(jc)=Mfact(2);
    PMfact=PAI*Mfact;
    cons(jc)=PMfact(1);
    GDP(jc)=PMfact(2);
    invest(jc)=PMfact(3);
end

figure(1);
plot(jr,capital,'-g.','MarkerSize',15);
hold on;
plot(jr,tech,'-ms');
plot(jr,cons,'-bd');
plot(jr,GDP,'-c*','MarkerSize',7);
plot(jr,invest,'-ro');
title('Impulse Response Functions','fontsize',10);
xlabel('Quarter','fontsize',10);
ylabel('Percentage Deviation Trend','fontsize',10);
set(gca,'Fontsize',10);
legend({'Capital','Technology','Consumption','GDP','Investment'},'fontsize',10,'Location','northeast');
hold off;

%% Simulation
jr=1:2:199;
jc=0;
Msum=zeros(2,2);
r=randn(1,100);

for j=jr
    jc=jc+1;
    epsl=[0;sigmagamma*r(jc)];
    Mfact=M^(j-1);
    Msum=Msum+Mfact;
    PMfact=PAI*Msum*epsl;
    cons(jc)=PMfact(1);
    GDP(jc)=PMfact(2);
    invest(jc)=PMfact(3);
end

figure(2);
plot(jr,cons,'-bd','MarkerSize',4);
hold on;
plot(jr,GDP,'-g*','MarkerSize',4);
plot(jr,invest,'-ro','MarkerSize',4);
title('Simulation of Business Cycles','fontsize',10);
xlabel('Quarter','fontsize',10);
ylabel('Percentage Deviation Trend','fontsize',10);
set(gca,'Fontsize',10);
legend({'Consumption','GDP','Investment'},'fontsize',10,'Location','northeast');
hold off;
