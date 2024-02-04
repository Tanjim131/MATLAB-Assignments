m = input('Enter the number of input variables =\n');
n = input('Enter the number of constraint equations = \n');

for i = 1 : n
    %for j = 1 : n
        %fprintf('Enter the value of element (%d,%d) of Matrix A : \n',i,j);
        fprintf('Enter input of row %d\n',i);
        A(i,:) = input('\');
    %end
end

fprintf('Enter the input of constants of constraint equations\n');

%for i = 1 : n
    %fprintf('Enter the input of column %d\n',i);
    B(:,1) = input('\');
%end

fprintf('Enter the co-efficients of objective function\n');
C(1,:) = input('\');

[tableau,Max_value] = LP_1505082(A,B,C)


