function [ dxdy] = orbitfun(t,x)
G=6.672e-11;
M=5.94e+24;
dxdy=[x(2)-300;
-G*M*x(1)/sqrt((x(1)^2+x(3)^2)^3);
x(4); 
-G*M*x(3)/sqrt((x(1)^2+x(3)^2)^3)];
end