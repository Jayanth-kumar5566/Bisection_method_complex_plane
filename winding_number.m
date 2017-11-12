function [ res ] = winding_number(fun,a,b,c,d)
%WINDING_NUMBER Finds the winding number of the function fun
% fun must be defined as eg: fun = @(z) (2.*z-4)./(z.^2-4.*z+5)   
% a,b,c,d are the vertices of the square to contour integrate see quad
% note the a,b,c,d are in complex form eg:a=0+1*i
C = [c b a];
q2 = integral(fun,d,d,'Waypoints',C);
res=1/(2*pi*i)*q2
end

