function [ res ] = boundary( f,a,b,c,d )
%BOUNDARY Checks if there are zeroes on the boundary of the recatngle
%   Takes in vertices of the rectangle in the previously mentioned
%   orientation
%    a+-----------------------+b
%     |                        |
%     |                        |
%     |                        |
%     |                        |
%     |                        |
%    d+-----------------------+c
S=[a,b;b,c;c,d;d,a]; %like a stack
A=['y','x','y','x']
for i=1:length(S)
    x=S(i,:);
    a=x(1,2);
    b=x(3,4);
    ax=A(i);
    if bisection(f,a,b,ax)== 0
        res='No roots on the boundary'
    else
        res=bisection(f,a,b,ax)
    end
end
end

