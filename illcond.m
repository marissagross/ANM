function[y1,y2,abserr,relerr,icond]=illcond(d)

A=ones(9,9);
for j=1:9
    A(j,j)=d;
end
b=(1:9)';

y1=A\b;

A(5,3)=A(5,3)*1.02;
y2=A\b;

for j=1:9
    abserr=(abs(y1-y2));
    relerr=norm(y1-y2)/norm(y1);
end
icond=cond(A);
end