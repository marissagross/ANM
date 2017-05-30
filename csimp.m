function s = csimp(f,a,b,n)
h=(b-a)/(2*(n));
s1=0;
s2=0;

for k=1:n
    x=a+h*(2*k-1);
    s1=s1+f(x);
end

for k=1:(n-1)
    x=a+h*2*k;
    s2=s2+f(x);
end

s=h*(f(a)+f(b)+4*s1+2*s2)/3;