function hw2n2

f = @(x) (sin((x.^3) +1));
x = 1.3;
h1 = .01; h2 = .001;
d1 = FD2(f,x,h1); d2 = FD2(f,x,h2);
d3 = CD2(f,x,h1); d4 = CD2(f,x,h2);

fprintf('The approximate derivative with forward difference at x=%1.0f using h=%1.2f is %10.6e\n',x,h1,d1);
fprintf('The approximate derivative with forward difference at x=%1.0f using h=%1.3f is %10.6e\n',x,h2,d2);
fprintf('The approximate derivative with central difference at x=%1.0f using h=%1.2f is %10.6e\n',x,h1,d3);
fprintf('The approximate derivative with central difference at x=%1.0f using h=%1.3f is %10.6e\n',x,h2,d4);

%------------------------------------------
function d = FD2(f,x,h)
d = (f(x+h)-f(x-h))/(2*h);
end

function d = CD2(f,x,h)
d = (-3*f(x)+4*f(x+h)-f(x+(2*h)))/(2*h);
end
%------------------------------------------
end