%Testing the final code
fun = @(z) (2.*z-4)./(z.^2-4.*z+5);
vector_field(@cpol,3,0,3,0);
[A,B,C,D]=quad([-3, 3], [3, 3], [3, -3], [-3, -3]);
%New rectangles
S={A,B,C,D}; %Defining a cell
S_new={};
ind_s_new=1;
for i=1:length(S)
    x=S{i}; %The matrix with ith index
    vertices={};
    for j=1:4
        vertices{1,j}=x(j,:);
    end
    %boundary(@cpol,vertices{1},vertices{2},vertices{3},vertices{4})
    if boundary(@cpol,vertices{1},vertices{2},vertices{3},vertices{4})=='No roots on the boundary'
        if abs(winding_number(fun,vertices{1},vertices{2},vertices{3},vertices{4}))~=1
            S_new{ind_s_new}=x;
            ind_s_new=ind_s_new+1;
        else
            end
    else
        disp('Assumption not satisfied Root present')
        boundary(@cpol,vertices{1},vertices{2},vertices{3},vertices{4})
    end
   
end
S_new;
%Final code that runs in a loop, Comment out the below part if you need to
%check only for one interation
Switch=0;
%Apply the same operation in iterations on S_new
while Switch==0
    S_new=S_new(~cellfun('isempty',S_new))
    for i=1:length(S_new)
        x=S_new{i};
        S_new{i}=[];
        vertices={};
        for j=1:4
            vertices{1,j}=x(j,:);
        end
    [A,B,C,D]=quad(vertices{1},vertices{2},vertices{3},vertices{4});
    if boundary(@cpol,vertices{1},vertices{2},vertices{3},vertices{4})=='No roots on the boundary'
        if abs(winding_number(fun,vertices{1},vertices{2},vertices{3},vertices{4}))~=1
            S_new{ind_s_new}=x;
            ind_s_new=ind_s_new+1;
        else
            end
    else
        disp('Assumption not satisfied Root present')
        boundary(@cpol,vertices{1},vertices{2},vertices{3},vertices{4})
    end
    end
   %Operating the switch
   for i=1:length(S_new)
       if isempty(S_new{i})==1
           Switch=1;
       else 
            Switch=0;
       end
   end
end