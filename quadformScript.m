a1=1; 
b1=1.8; 
c1=-.740;
[root1_1,root1_2] = quadform(a1,b1,c1);

a2=1; 
b2=-12.000358024268123; 
c2=36.00214817704637;
[root2_1,root2_2] = quadform(a2,b2,c2);

fprintf('The root of the first quadratic is %f \n',root1_1); %because b1>0
fprintf('The root of the second quadratic is %f \n',root2_2); %because b2<0