%Y(k) is 3rd order Taylor Series 
%Exact
x = a:.0001:b;
y = ((1./(19.*x)) - (524288./(19.*x.^20))); % this is a vector of values, not a function

% course solution
h = .01;
a = 2;
b = 10;
X1 = a:h:b;
M = length(X1);
ya = 0;
Y1 = zeros(1,M);
Y1(2) = ya;
for k=1:M-1
   f = (1/(X1(k)^2) - (20*Y1(k))/X1(k));
   fx = (-2/X1(k)^3 + (20*Y1(k))/X1(k)^2);
   fxx = (6/X1(k)^4 - (40*Y1(k)/X1(k)^3));
   fy = (-20/X1(k));
   fxy = (20/X1(k)^2);
   fyy = 0;
   d0 = Y1(k);
   d1 = f;
   d2 = fx + f*fy;
   d3 = fxx + fxy*f + (fx+fy*f)*fy + f*(fxy+fyy*f);
   Y1(k+1) = d0 + h*d1 + .5*h^2*d2 + h^3*d3/6;
end

%fine solution
h = .001;
a = 2;
b = 10;
X2 = a:h:b;
M = length(X2);
ya = 0;
Y2 = zeros(1,M);
Y2(2) = ya;
for k=1:M-1
   f = (1/(X2(k)^2) - (20*Y2(k))/X2(k));
   fx = (-2/X2(k)^3 + (20*Y2(k))/X2(k)^2);
   fxx = (6/X2(k)^4 - (40*Y2(k)/X2(k)^3));
   fy = (-20/X2(k));
   fxy = (20/X2(k)^2);
   fyy = 0;
   d0 = Y2(k);
   d1 = f;
   d2 = fx + f*fy;
   d3 = fxx + fxy*f + (fx+fy*f)*fy + f*(fxy+fyy*f);
   Y2(k+1) = d0 + h*d1 + .5*h^2*d2 + h^3*d3/6;
end

%finer solution
%Y(k) is 3rd order Taylor Series
h = .0001;
a = 2;
b = 10;
X3 = a:h:b;
M = length(X3);
ya = 0;
Y3 = zeros(1,M);
Y3(2) = ya;
for k=1:M-1
   f = (1/(X3(k)^2) - (20*Y3(k))/X3(k));
   fx = (-2/X3(k)^3 + (20*Y3(k))/X3(k)^2);
   fxx = (6/X3(k)^4 - (40*Y3(k)/X3(k)^3));
   fy = (-20/X3(k));
   fxy = (20/X3(k)^2);
   fyy = 0;
   d0 = Y3(k);
   d1 = f;
   d2 = fx + f*fy;
   d3 = fxx + fxy*f + (fx+fy*f)*fy + f*(fxy+fyy*f);
   Y3(k+1) = d0 + h*d1 + .5*h^2*d2 + h^3*d3/6;
end

% plot exact and 3 approximations
figure(1)
plot(x,y,'k',X1,Y1,'b',X2,Y2,'g',X3,Y3,'r')
legend('Exact','Coarse','Fine','Finer')
title('The Taylor Method with 3 meshes')


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
title('Taylor Method Relative Errors')

