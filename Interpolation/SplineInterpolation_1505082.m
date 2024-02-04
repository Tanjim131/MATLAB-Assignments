function output = SplineInterpolation_1505082(x,y)

m = length(x);
n = length(y);

if(m ~= n)
    error('Invalid Dimension');
end

matrix = zeros(3 * (m - 1));
constant = zeros(3 * (m - 1) - 1 , 1);
row = 1;
col = 1;

for i = 1 : m
    for j = 1:2
        matrix(row,col) = x(i) * x(i);
        matrix(row,col + 1) = x(i);
        matrix(row,col + 2) = 1;
        
        constant(row,1) = y(i);
        
        row = row + 1;
        col = col + 3;
        
        if(i == 1 || i == n) 
            break;
        end
        
    end 
    col = col - 3;
end

col = 1;

for i = 2 : n - 1
    matrix(row,col) = 2 * x(i);
    matrix(row,col + 1) = 1;
    matrix(row,col + 3)= -2 * x(i);
    matrix(row,col + 4) = -1;
    
    row = row + 1;
    col = col + 3;
end

matrix = matrix(1:3*(m - 1) - 1,2 : 3 * (m - 1));

solve = linsolve(matrix,constant);

output = zeros(m - 1,3);

k = 1;

for i = 1 : m - 1
    for j = 1 : 3
        if(i == 1 && j == 1) 
            continue;
        end
        output(i,j) = solve(k); 
        k = k + 1;
    end
end

end
