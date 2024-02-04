function x = Gauss_1505082(A,B)

% solve the system of linear equations
% Gaussian Elimination Method

A = [A,B];
[m,n] = size(A); % m is row , n is column 

if(m ~= n - 1) 
    fprintf('Invalid Dimension\n');
    return;
end 

for i = 1 : m - 1
    p = i; % storing the value of the row in case if the pivot is null 
    % partial pivoting start 
    [pivot,k]=max(abs(A(i:m,i)));
    k = k + i - 1;
    if k ~= i
        %interchange rows i and k in A
        A([i k],:) = A([k i],:);
    end 
    % partial pivoting done 
    % but we haven't checked if the pivot is null or not 
    while( A(p,i) == 0 )
        if(p == m + 1)
           fprintf('No Unique Solution\n');
           return;
        end
        p = p + 1;
    end
    
    %forward elimination start
    
    for j = i + 1 : m
        A(j,:) = A(j,:) - A(i,:) * (A(j,i)/A(i,i)); 
    end
    
    %forward elimination done upto row m - 1 
end

if(rank(A) < min(m,n))
    fprintf('No Unique Solution\n');
    return;
end 

A(m,n) = A(m,n) / A(m,m);
A(m,m) = 1 ; % forward elimination done 

A % printing Matrix A after forward elimination 

x = zeros(m,1); % this is my output matrix

x(m) = A(m,n); % storing last co-efficient

for i = m - 1: -1 : 1
    sum = 0;
    for j = i + 1 : m
        sum = sum + A(i,j) * x(j); % getting sum to subtract 
    end
    x(i) = (A(i,n) - sum)/A(i,i); % finding out co-efficeint xi
end

x % priting resultant Matrix after backward substitution  

end 