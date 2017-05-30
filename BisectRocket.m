function[c,n] = BisectRocket(f,a,b,tol)
%Bisection Method
%used to find the time it takes for a rocket to reach
%velocity of 750 m/s
 
ya=f(a);
yb=f(b);
 
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
