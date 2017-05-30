function I = gaussQuad(f,a,b,A,W)

N=length(A);
T=zeros(1,N);
T=((a+b)/2)+((b-a)/2)*A;
I=((b-a)/2)*sum(W.*f(T));