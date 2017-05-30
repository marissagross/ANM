A=0.440329759502821;
B=0.390969933736812;

f=@(x) (1./x);
g=@(x) (A.*exp(-x)+B);

x=0:0.01:5;
x0=2;
x1=3;
x2=4;

c=abs(f(2.5)-(g(2.5)));

fprintf('The actual error at x=2.5 is %6.5f \n',c)

plot(x,f(x),x,g(x),'k')
hold on
plot(x0,f(x0),'o')
hold on
plot(x1,f(x1),'o')
hold on
plot(x2,f(x2),'o')
xlabel('x-values')
ylabel('y-values')
title('Linear Least Squares')
legend('f(x)','g(x)','Data Points')
axis([0 5 0 1])


