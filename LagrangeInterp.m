x=1:.01:5;
f=@(x) (1./x);

x0=2; yo=f(x0);
x1=3; y1=f(x1);
x2=4; y2=f(x2);

L20=@(x) (((x-x1).*(x-x2))/((x0-x1).*(x0-x2)));
L21=@(x) (((x-x0).*(x-x2))/((x1-x0).*(x1-x2)));
L22=@(x) (((x-x0).*(x-x1))/((x2-x0).*(x2-x1)));

P2=@(x) ((yo.*L20(x))+(y1.*L21(x))+(y2.*L22(x)));

plot(x,f(x),x,P2(x),'k')
hold on 
plot(x0,f(x0),'o')
hold on
plot(x1,f(x1),'o')
hold on
plot(x2,f(x2),'o')
xlabel('x-values')
ylabel('y-values')
title('Lagrange Interpolation')
legend('f(x)','P2(x)','Data Points')
axis([0 5 0 1])


