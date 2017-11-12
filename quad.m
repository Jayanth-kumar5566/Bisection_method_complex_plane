function [A,B,C,D] = quad( a,b,c,d )
%QUAD Quadrasects the given rectangles into four congruent rectangles
%    a+-----------e------------+b
%     |                        |
%     |                        |
%    h|           i           f|
%     |                        |
%     |                        |
%    d+-----------g------------+c
% a,b,c,d are vectors contating the coordinates of the vertexes
%convetion of naming a rectangle clockwise vetex, starting from left top
%most corner.
e=(a+b)./2;
f=(b+c)./2;
g=(d+c)./2;
h=(a+d)./2;
i=(e+g)./2;
A=[a;e;i;h];
B=[e;b;f;i];
C=[i;f;c;g];
D=[h;i;g;d];
end

