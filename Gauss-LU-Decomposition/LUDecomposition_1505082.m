function out = LUDecomposition_1505082(A,B)

[m,n]=size(A);

if(m ~= n)
    fprintf('Invalid Dimension\n');
    return ;
end

L=eye(n); P=L; U=A;

for i = 1 : m - 1
    [pivot,k]=max(abs(U(i:m,i))); %largest element in a column
                                  % k -> row of largest element
                                  % pivot -> largest element 
                                  
    k = k + i - 1; % to counteract starting index 'i'
    if k ~= i
        % interchange rows i and k in U
        U([i k],:) = U([k i],:);
        
        % interchange rows i and k in P
        P([i k],:) = P([k i],:);
        
        if i >= 2
            temp=L(i,1:i-1);
            L(i,1:i-1)=L(k,1:i-1);
            L(k,1:i-1)=temp;
        end
        
    end
    
    %Decomposition into L and U
    for j = i + 1 : m
        L(j,i)=U(j,i)/U(i,i);
        U(j,:)=U(j,:) - L(j,i) * U(i,:);
    end
    
end 

fprintf('After Decomposition\n');

L
U

if(rank(L) < min(m,n)) % checking for singular matrix 
    fprintf('No Unique Solution\n');
    return ;
end 

B = P * B; % [P]{B} -> before implementing the forward substitution 
           % the permutation matrix is used to re-order the right hand side
           % vector to reflect the pivots

           
L = [L B]; % taking the augmented matrix 

[x,y] = size(L); %Dimension of augmented Matrix 

d = zeros(x,1); %Initializing Matrix d
d(1) = L(1,y); 

%Forward Substitution start [L]{d} = [B]
for i = 2 : 1 : x 
    sum = 0;
    for j = i - 1 : -1 : 1
        sum = sum + L(i,j) * d(j);
    end
    d(i) = (L(i,y) - sum)/L(i,i);
end
% Forward Substitution done 

fprintf('After Forward Substitution\n');

d

%Backward Substitution start [U]{x} = [d]
U = [U,d];
[p,q] = size(U); 

if(rank(U) < min(p,q))
    fprintf('No Unique Solution\n');
    return;
end

U(p,q) = U(p,q)/U(p,p);
U(p,p) = 1;

out = zeros(p,1);
out(p) = U(p,q);

for i = p - 1 : -1 : 1
    sum = 0;
    
    for j = i + 1 : p
        sum = sum + U(i,j) * out(j);
    end
    
    out(i) = (U(i,q) - sum)/U(i,i);
end
    
fprintf('After Backward Substitution\n');

out 
           
end