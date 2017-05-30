function [c,k] = newton(f,fprime,xone,tol,maxiter)
%This function uses Newton's method to find roots

xk=xone;

for k=1:maxiter
    xkplus1=xk-(f(xk)/fprime(xk));
    abserr=abs(xkplus1-xk);
    relerr=abserr/(abs(xkplus1)+eps);
    
    if (abserr<tol) && (relerr<tol)
        c=xkplus1;
        return
    end
    xk=xkplus1;
end
c=xkplus1;
end

