function out = trapezoidal_1505082(func,low,high,n)

h = (high - low)/n;
out = 0;

for i = low : h : high
    out = out + 0.5 * (func(i) + func(i + h)) * h;
end

end 