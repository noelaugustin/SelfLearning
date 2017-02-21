%%initial values
m=1;
k=1;
eps=0.01;
d=0.1;
p=1;
u0=10;
du0=0;
wn=sqrt(k/m);
wd=wn*sqrt(1-eps*eps);
t=0:999;
t=t/100;
u=[];
stc1=(p/k)*(1-(d)^2)/(((1-(d)^2)^2)+(2*eps*d)^2);
stc2=(p/k)*(2*d*eps)/(((1-(d)^2)^2)+(2*eps*d)^2);

for i=1:(999+1)
    %%transient
    tr1=u0*cos(wd*t(i))*exp(-eps*wn*t(i));
    tr2=((du0+u0*eps*wn)/wd)*sin(wd*t(i))*exp(-eps*wn*t(i));
    
    %%steady
    st1=stc1*sin(d*wn*t(i));
    st2=stc2*cos(d*wn*t(i));
    
    u=[u,tr1+tr2+st1-st2];
end
plot(t,u);




