function [ res ] = winding_number(fun,a,b,c,d)
%WINDING_NUMBER Finds the winding number of the function fun
% fun must be defined as eg: fun = @(z) (2.*z-4)./(z.^2-4.*z+5)   
% fun is f'(z)/f(z) 
% a,b,c,d are the vertices of the square to contour integrate see quad
% note the a,b,c,d are in a=[x y]
a=a(1)+i*a(2);
b=b(1)+i*b(2);
c=c(1)+i*c(2);
d=d(1)+i*d(2);
C = [c b a];
q2 = integral(fun,d,d,'Waypoints',C);
res=1/(2*pi*i)*q2;
end

