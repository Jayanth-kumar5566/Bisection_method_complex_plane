function [] = vector_field(f,a,b,c,d)
%f is the polynomial or the vector field
%a,b,c,d is the rectangle or the domain where the root is present
% here a,b,c,d are only single numbers not a tuple
% plots the vector field on the domain

% Note we assume a square to begin with instead of a rectangle

x=d:0.1:c;
y=d:0.1:a;
[X,Y]=meshgrid(x,y);
%plot(X,Y,'o')
U=[];
V=[];
for j=1:length(X)
    for i=1:length(X)
        z=feval(f,[X(j,i),Y(j,i)]);
        U=[U real(z)];
        V=[V imag(z)];
    end
end
U=vec2mat(U,length(X));
V=vec2mat(V,length(X));
quiver(X,Y,U,V)
end

%Implementation
%vector_field(@cpol,3,0,3,0)