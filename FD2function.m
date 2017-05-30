function d = FD2(f,x,h)
d = (f(x+h)-f(x-h))/(2*h);
end

