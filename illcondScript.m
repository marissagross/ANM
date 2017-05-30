diag=1.01;

[y1,y2,abserr,relerr,icond]=illcond(diag);

fprintf('y1: \n')
fprintf('%5.5f\n',y1)
fprintf('\ny2: \n')
fprintf('%5.5f\n',y2)
fprintf('\n')
fprintf('Absolute Error %5.5f \n',abserr)
fprintf('Relative Error %5.5f \n',relerr)
fprintf('The conditioning is %5.5f \n',icond)