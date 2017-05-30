f = @(x) x.*(exp(x.^2));
x = 3;
exactderiv = (exp(x.^2).*((2*x.^2)+1));
h1 = .01; h2 = .001;
d1 = FD2(f,x,h1); d2 = FD2(f,x,h2);
d3 = CD2(f,x,h1); d4 = CD2(f,x,h2);

fprintf('The approximate derivative with forward difference at x=%1.0f using h=%1.2f is %10.4e\n',x,h1,d1);
fprintf('The approximate derivative with forward difference at x=%1.0f using h=%1.3f is %e\n',x,h2,d2);
fprintf('The approximate derivative with central difference at x=%1.0f using h=%1.2f is %e\n',x,h1,d3);
fprintf('The approximate derivative with central difference at x=%1.0f using h=%1.3f is %e\n',x,h2,d4);
fprintf('The error with h=%1.2f for forward difference is %e\n',h1,abs(exactderiv-d1));
fprintf('The error with h=%1.3f for forward difference is %e\n',h2,abs(exactderiv-d2));
fprintf('The error with h=%1.2f for central difference is %e\n',h1,abs(exactderiv-d3));
fprintf('The error with h=%1.3f for central difference is %e\n',h2,abs(exactderiv-d4));
