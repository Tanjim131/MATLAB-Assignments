function output = NDDP_1505082(x,y)

n = length(x);
m = length(y);

if(n ~= m)
    error('Invalid Dimension');
end

table = zeros(m,m);

for i = 1 : m
    table(i,1) = y(i);
end 

for k = 2 : m
    for j = 1 : (n - k + 1)
        table(j,k) = (table(j + 1,k - 1) - table(j,k - 1))/ (x(j + k - 1) - x(j));
    end
end

output = zeros(1,m);

for i = 1 : m
    output(i) = table(1,i);
end

end

