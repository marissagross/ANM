function [c] = actualerror(x)
f = @(x) sqrt(x+1);
T3 = @(x) 1+(x/2)-(x^2/8)+(x^3/16);
c = abs(f(x)-T3(x));
end

