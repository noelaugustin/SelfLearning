m=1;
u=zeros(1000);
k=1;
zeta=0.01;
P=1;
u0=1
u=[];
duo=0;

wn=power((k/m),0.5);
wf=2;
n=2;
wd=wn*power(1-(zeta*zeta),0.5);
for t=1:1:10
  a=(exp(-zeta*wn*t)*(u(1)*cos(wd*t)+(((duo+u0*zeta*wn)*sin(wd*t))/wd));
  b=(P/k)*((1-power((wf/wn),2))*sin(wf*t)/(power((1-power((wf/wd),2)),2)+power((2*zeta*wf/wd),2)));
  c=(P/k)*((2*zeta*(wf/wn)*cos(wf*t))/(power((1-power((wf/wd),2)),2)+power((2*zeta*wf/wd),2)));
  u=[u,a+b-c];
  
end
plot(u);
  

