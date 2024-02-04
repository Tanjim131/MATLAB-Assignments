function y = NewtonPolynomial_1505082(arr,value,poly)

x = 1;
y = poly(1);
len = length(poly);

for i = 1 : len - 1
    x = x * (value - arr(i));
    y = y + x * poly(1,i + 1);
end

end