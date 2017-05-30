function [c,n] = fixpoint(g,xo,tol,maxiter)
%fixpoint is a funtion to find the roots using
%roots using the fixed point method

cn=xo;  %where xo is initial guess

    for n=1:maxiter
        cnplus1=g(cn);
        abserr=abs(cnplus1-cn);
        rel=abserr/(abs(cnplus1)+eps);
        if (abserr<tol)&&(rel<tol)
            c=cnplus1;
            return
        end
        cn=cnplus1;
    end
    c=cnplus1;

end

