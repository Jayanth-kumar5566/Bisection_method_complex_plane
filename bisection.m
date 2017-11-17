function [ root ] = bisection( f,a,b,ax)
%a,b are the vertices 
%ax denotes the axis that is constant through the line
% returns root is there exists a root if not returns 0

if ax=='x'
    range=[a(2),b(2)];
    dum=a(1);
    low=range(1);
    high=range(2);
    mid=(high+low)/2;
    count=0;
    while abs(feval(f,[dum,mid]))>=0.01 & count<=10000
        count=count+1;
        v1=feval(f,[dum,low]);
        v2=feval(f,[dum,mid]);
        v3=feval(f,[dum,high]);
        if [sign(real(v1)),sign(imag(v1))]==[sign(real(v2)),sign(imag(v2))]
            low=mid;
        elseif [sign(real(v2)),sign(imag(v2))]==[sign(real(v3)),sign(imag(v3))]
            high=mid;
        end
        mid=(high+low)/2;
        mid_2=b(1);
    end 
elseif ax=='y'
    range=[a(1),b(1)];
    dum=a(2);
    low=range(1);
    high=range(2);
    mid=(high+low)/2;
    count=0;
    while abs(feval(f,[mid,dum]))>=0.01 & count<=10000
        count = count+1;
        %if sign(real(feval(f,[low,dum])))==sign(real(feval(f,[mid,dum])))
        v1=feval(f,[low,dum]);
        v2=feval(f,[mid,dum]);
        v3=feval(f,[high,dum]);
        if [sign(real(v1)),sign(imag(v1))]==[sign(real(v2)),sign(imag(v2))]
            low=mid;
        elseif [sign(real(v2)),sign(imag(v2))]==[sign(real(v3)),sign(imag(v3))]
            high=mid;
        end
        mid=(high+low)/2;
        mid_2=b(2);
    end
end
if count>=10000     
    root=0;        %Just a proxy to account for finiteness of while loop
else
    if ax=='y'
        root=mid+mid_2*i;
    else
        root=mid_2+mid*i;
    end
end
end

%Note for intervals such as [-x y] need to check