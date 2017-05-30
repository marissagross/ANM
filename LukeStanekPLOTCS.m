%Preamble
close all
clc

%Luke Stanek - modified
%ANM Final Exam #3 Cubic Splines

%Creating matrix with system of equations to determine coefficients of
%interpolating ploynomial.

%System of equations
A = [1 2 4 8 0 0 0 0;
    1 3 9 27 0 0 0 0;
    0 0 0 0 1 3 9 27;
    0 0 0 0 1 4 16 64;
    0 1 6 27 0 -1 -6 -27;
    0 0 2 18 0 0 -2 -18;
    0 1 4 12 0 -1 -8 -48;
    0 0 2 12 0 0 -2 -24;];

%Solution vector
b = [.5 .333 .333 .25 0 0 0 0]';

%Solving the system
a = A\b;

%Domain for each piece of cubic spline
x1 = 2:.01:3;
x2 = 3:.01:4;

%The three interpolating cubic splines
s1 = a(1) + a(2)*x1 + a(3)*x1.^2 +a(4)*x1.^3;
s2 = a(5) + a(6)*x2 + a(7)*x2.^2 +a(8)*x2.^3;


%Original domain
x = 1:.01:5;

%Original f(x)
f =@(x) (1./x);

%Plot Results
p=plot(x1,s1,'k','Markerfacecolor','k');
set(p,'Color','blue')
hold on
j=plot (x2,s2,'k','Markerfacecolor','k');
set(j,'Color','red')
hold on
m=plot(x,f(x),'k');
set(m,'Color','green')
xlabel('x-values')
ylabel('y-values')
title('Cubic Spline Interpolation')
legend('S1(x)','S2(x)','Data Points')
axis([0 5 0 1])

c = abs(f(2.5)-(a(1) + a(2)*(2.5) + a(3)*(2.5).^2 +a(4)*(2.5).^3));

fprintf('The coefficients are:\n')
for i = 1:8
    
    fprintf('a(%d) = %6.5f\n',i,a(i))
    
end

fprintf('The actual error at x=2.5 is %6.5f \n',c)

