function [c,k] = secant(f,xo,xone,tol,maxiter)
%This function uses secant method to find roots
 
xkminus1=xo;
xk=xone;
 
    xkminus1=xk;
for k=1:maxiter
    xkplus1=(xk)-((xk-xkminus1)*(f(xk)))/(f(xk)-f(xkminus1));
    abserr=abs(xkplus1-xk);
    rel=abserr/(abs(xkplus1)+eps);
    
    if (abserr<tol) && (rel<tol)
        c=xkplus1;
        return
    end
    xk=xkplus1;
end
c=xkplus1;
end
