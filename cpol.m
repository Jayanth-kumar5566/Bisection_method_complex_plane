function [ res ] = cpol( a )
%This is the function that evaluvates the complex polynomial
%   z^2-4z+5
% input a- is a vector [x y]
z=a(1)+i*a(2);
res=z^2-4*z+5;
end

