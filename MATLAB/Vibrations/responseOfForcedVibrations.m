%%initial values
m=1;                                                                        %%mass of the body
k=1;                                                                        %%stiffness
eps=0.01;                                                                   %%damping ratio
d=0.1;                                                                      %%ratio of force freq to the natural freq
p=1;                                                                        %%amplitude of the ezcitation force
u0=1;                                                                       %%initial displacement
du0=0;                                                                      %%initial velocity
wn=sqrt(k/m);                                                               %%natural frequency
wd=wn*sqrt(1-eps*eps);                                                      %%frequency of damped oscillation
t=0:9999;                                                                   %%time array is 
t=t/100;                                                                    %%created
u=[];                                                                       %%blank array is made to store the displacement

darray=0:199                                                                %% array to store 
darray=darray/100                                                           %%the value over which d varies
resp=[]
for j=1:200                                                                %% this loop changes the value of d, and hence the force frequency
    u=[];                                                                  %%the array is cleaned everytime the response is to be noted
    d=darray(j)
    stc1=(p/k)*(1-(d)^2)/(((1-(d)^2)^2)+(2*eps*d)^2);
    stc2=(p/k)*(2*d*eps)/(((1-(d)^2)^2)+(2*eps*d)^2);
    for i=1:(9999+1)                                                       %% this for loop makes an iteration for a particular value of d
        %%transient
        tr1=u0*cos(wd*t(i))*exp(-eps*wn*t(i));                             %% which is created by the previous for loop         
        tr2=((du0+u0*eps*wn)/wd)*sin(wd*t(i))*exp(-eps*wn*t(i));

        %%steady
        st1=stc1*sin(d*wn*t(i));
        st2=stc2*cos(d*wn*t(i));

        u=[u,tr1+tr2+st1-st2];                                              %%total displacment
    end
    
    resp=[resp,max(u)/(p/k)];                                              %% response is the ratio between maximum displacment and the p/k value
    
end
plot(darray,resp);                                                          %%plot the d versus response graph                                 




