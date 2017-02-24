%% Assignment 3
m=100;                                                                     %%mass
k=100;                                                                     %%stiffness
e=0.02;                                                                    %%damping ratio
wn=sqrt(k/m);                                                              %%natural frequency
c=2*wn*m*e;                                                                %%damping coefficient
g=0.5;                                                                     %%method coefficients
b=1/6;
t= 1:2688;                                                                 %%time till the samples have been taken
t= t*2/100;
dt=0.02;                                                                   %%time increment given
u=[];
v=[];                                                                      %%arrays to store the values of displacement, 
a=[];                                                                      %%velocity and acceleration
dp=[];                                                                     %%this is the elcentro data
K=m/(b*dt^2)+c*g/(b*dt)+k;
filename='elcentro.xlsx';                                                  %%this file has the data in it
p=xlsread(filename);    
u(1)=0;
v(1)=0;
a(1)=(m*p(1)-c*v(1)-k*u(1))/m;                                              %%initial conditions

for i=1:2687                                                               %%this loop updates and appends the value of 
    dp(i)=m*p(i+1)-m*p(i)+v(i)*(m/(b*dt)+c*g/b)+a(i)*(m*0.5/b+dt*(g*0.5/b-1)*c);
    u(i+1)=u(i)+dp(i)/K;                                                   %% displacement, velocity and accelration
    v(i+1)=g/(b*dt)*(u(i+1)-u(i))-g/b*v(i)+dt*(1-g*0.5/b)*a(i)+v(i);       %% and appends to the respective arrays
    a(i+1)=a(i)+(u(i+1)-u(i))/(b*dt^2)-v(i)/(b*dt)-a(i)*0.5/b;
end


figure
subplot(2,2,1)
plot(t,u);
title('displacement');
subplot(2,2,2)
scatter(t,v,'+');                                                          %%plotting three graphs
title('velocity');
subplot(2,2,3)
scatter(t,a,'*');
title('acceleration');