function dy = rhs_projectileB(t,y)

global l;

dy = zeros(2,1);

dy(1) = y(2);

dy(2) = -y(1)+l*y(1)*1/(sqrt(([y(1)^2]+1)));
end