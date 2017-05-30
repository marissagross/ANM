function[c,n] = BisectionMethod(f,a,b,tol)
%Bisection Method
%Function to find the roots

ya=f(a);    %where a is the left end of the guess
yb=f(b);    %where b is the right end of the guess

    if (ya*yb>0)
        disp('You have chosen a bad interval')
        return
    end
    
    maxiter=1+floor(log((b-a)/tol)/(log(2)));
    
    for n=1:maxiter
        c=((a+b)/2);
        yc=f(c);
        if (yc==0)
            return
        elseif (yc*yb<0)
            a=c;    %omit left half
        else 
            b=c;    %omit right half
            yb=yc;
        end
    end
         
end