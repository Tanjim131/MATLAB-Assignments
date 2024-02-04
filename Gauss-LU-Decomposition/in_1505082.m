n = input('Enter the dimension of Matrix A = \n');

for i = 1 : n
    %for j = 1 : n
        %fprintf('Enter the value of element (%d,%d) of Matrix A : \n',i,j);
        fprintf('Enter input of row %d\n',i);
        A(i,:) = input('\');
    %end
end

for i = 1 : n
    fprintf('Enter the value of element (%d,1) of Matrix B: \n',i);
    B(i) = input('');
end

B = B';