% define the problem: function f and domain
f = @(x,y) (1/x^2 - (20*y)/x);
a = 2; b = 10;

% exact solution, using a fine grid
x = a:.0001:b;
y = ((1./(19.*x)) - (524288./(19.*x.^20))); % this is a vector of values, not a function

% coarse solution
h = .01;
ya = 0;
[X1,Y1]=ABM(f,a,b,ya,h);

% fine solution
h = .001;
ya = 0;
[X2,Y2]=ABM(f,a,b,ya,h);

% finer solution
h = .0001;
ya = 0;
[X3,Y3]=ABM(f,a,b,ya,h);

% plot exact and 3 approximations
figure(1)
plot(x,y,'k',X1,Y1,'b',X2,Y2,'g',X3,Y3,'r')
legend('Exact','Coarse','Fine','Finer')
title('The Adams-Bashforth-Moulton Method with 3 meshes')


%plot errors
y1ex = 1./(19*X1)-524288./(19*X1.^20);
relerr1 = abs(y1ex-Y1)./(abs(y1ex)+eps);
y2ex = 1./(19*X2)-524288./(19*X2.^20);
relerr2 = abs(y2ex-Y2)./(abs(y2ex)+eps);
y3ex = 1./(19*X3)-524288./(19*X3.^20);
relerr3 = abs(y3ex-Y3)./(abs(y3ex)+eps);
figure(2)
plot(X1,relerr1,':',X2,relerr2,'--',X3,relerr3,'-.')
legend('[X1,Y1]','[X2,Y2]','[X3,Y3]')
title('Adams-Bashforth-Moulton Method Relative Errors')

