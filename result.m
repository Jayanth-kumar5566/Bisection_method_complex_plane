% fun = @(z) (2.*z-4)./(z.^2-4.*z+5);
% C = [3 3+3i 3i];
% q2 = integral(fun,0+0i,0+0i,'Waypoints',C);
% winding_number=1/(2*pi*i)*q2