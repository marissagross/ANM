function s = ctrap(f,a,b,n)
h=(b-a)/(n);
s=0;

for k=1:(n-1)
    x=a+h*k;
    s=s+f(x);
end
s=h*(f(a)+f(b))/2+h*s;
