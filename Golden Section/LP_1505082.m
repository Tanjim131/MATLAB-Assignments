function [Aug,val] = LP_1505082(A,B,C)

if(any(B) < 0)
    fprintf('Elements of B cannot be negative\n');
    return ;
end 

[m,n] = size(A);
[i,j] = size(B);
X = eye(m);
Y = zeros(m,1);
if m ~= i
    fprintf('Invalid Dimesion\n');
    return ;
end
A = [Y A X B];
[m,n] = size(A);
D = zeros(1,n);
D(1,1) = 1;
[p,q] = size(C);
for i = 1 : q
    D(i + 1) = -1*C(i);
end
Aug = [D ; A]; % initial tableau
[m,n] = size(Aug);

while any(Aug(1,:) < 0)   
    [value,col] = min(Aug(1,:)); % value is the minimum value , col is the column in row 
     A(:,col) = Aug(2:m,col);
     A(:,n) = A(:,n)./A(:,col);
     data = A(:,n);
    [upperbound,row] = check(data); % upperbound is the value , row is the row 
                                    % in which upperbound resides 
    row = row + 1;
    Aug(row,:) = Aug(row,:)./Aug(row,col);
    
    for i = 1 : m
        if i ~= row
            Aug(i,:) = Aug(i,:) - Aug(i,col) * Aug(row,:);
        end
    end
    A(:,n) = Aug(2:m,n);

end 
val = Aug(1,n); 
end 

function [min,row] = check(A)
    [x,y] = size(A);
    min = inf;
    row = -1;
    for i = 1 : x
        if( A(i,y) >= 0 & min > A(i,y))
            min = A(i,y);
            row = i;
        end
    end
end