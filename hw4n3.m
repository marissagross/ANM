%M'(t)-Jin(t)+lamda*M(t)=0

K1=0.1233;      K2=0.00532;
lam1=0.0059;    lam2=0.00059;
a=4000;         b=8000;
tspan=[a,b];    t0=3689.21;
M0=400;

f1 = @(t,M) ((K1*exp(-K2*(t-t0)))-(lam1*M));
f2 = @(t,M) ((K1*exp(-K2*(t-t0)))-(lam2*M));

options=odeset('AbsTol',1e-10,'RelTol',1e-10);

[T1,M1]=ode45(f1,tspan,M0,options); %lamda=0.0059
[T2,M2]=ode45(f2,tspan,M0,options); %lamda=0.00059

figure(1)
plot(T1,M1,'g',T2,M2,'b')
legend('Lamda=0.0059','Lamda=0.00059')
title('ode45')