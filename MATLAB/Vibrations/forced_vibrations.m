%%initial values
m=1;                                                                        %% m is the mass of the body
k=1;                                                                        %%k is the stiffness
eps=0.02;                                                                    %% eps is the damping ratio
d=.1;                                                                        %% d is the ratio of force freq to the natural freq
p=1;                                                                        %% p is the amplitude of the exictation force
u0=10;                                                                      %% u0 is the initial displacement
du0=0;                                                                      %%du0 is the initial velocity
wn=sqrt(k/m);                                                               %%wn is the natural frequency
wd=wn*sqrt(1-eps*eps);                                                      %%wd is the damped frequency
t=0:99999;                                                                  %% in the two steps , the array corresponding  
t=t/100;                                                                    %% to the time value is made
u=[];                                                                       %% an empty array is made to store the values of displacment
stc1=(p/k)*(1-(d)^2)/(((1-(d)^2)^2)+(2*eps*d)^2);                           %% steady state term no.1
stc2=(p/k)*(2*d*eps)/(((1-(d)^2)^2)+(2*eps*d)^2);                           %% steady state term no. 2

for i=1:(99999+1)
    %%transient
    tr1=u0*cos(wd*t(i))*exp(-eps*wn*t(i));                                  %%transient term no.1
    tr2=((du0+u0*eps*wn)/wd)*sin(wd*t(i))*exp(-eps*wn*t(i));                %%transient term no.2
    
    %%steady
    st1=stc1*sin(d*wn*t(i));
    st2=stc2*cos(d*wn*t(i));
    
    u=[u,tr1+tr2+st1-st2];                                                  %%total displacment is appended to the array u
end
plot(t,u);                                                                  %% plotted 




