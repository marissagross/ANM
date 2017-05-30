function [X,Y]=ABM(f,a,b,ya,h)

X=a:h:b;
Y=zeros(1,length(X));
Y(1)=ya;
    %RK4 
    for k=1:3
        F1 = f(X(k),Y(k));
        F2 = f(X(k)+h/2,Y(k)+(h/2)*F1);
        F3 = f(X(k)+h/2,Y(k)+(h/2)*F2);
        F4 = f(X(k+1),Y(k)+h*F3);
        
        Y(k+1)=Y(k)+(h/6)*(F1+2*F2+2*F3+F4);
    end 
    %Predictor/Corrector
    for k=4:length(X)-1
        fkm3 = f(X(k-3),Y(k-3));
        fkm2 = f(X(k-2),Y(k-2));
        fkm1 = f(X(k-1),Y(k-1));
        fk = f(X(k),Y(k));
        %predictor
        p = Y(k)+(h/24)*(-9*fkm3+37*fkm2-59*fkm1+55*fk);
        X(k+1) = X(k)+h;
        fp = f(X(k+1),p);
        %corrector
        Y(k+1) = Y(k)+(h/24)*(fkm2-5*fkm1+19*fk+9*fp);
    end 
end

