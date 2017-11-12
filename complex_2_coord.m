function [ res ] = complex_2_coord( z )
%COMPLEX_2_COORD converts complex numvber into coordinate form
%   z=x+iy 
% res=[x,y]
res=[real(z) imag(z)];
end

