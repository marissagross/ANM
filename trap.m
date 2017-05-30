function s = trap(f,a,b)
n=1;
h=(b-a)/(n+1);
s=0;

for k=1:n
    x=a+h*k;
    s=s+f(x);
end
s=h*(f(a)+f(b))/2+h*s;
