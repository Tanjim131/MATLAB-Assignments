function output = SplinePolynomial_1505082(arr,value,matrix)

len = length(arr);

low = 1;
high = len;

while(high - low > 1)
    mid = floor((low + high)/2);
    if(arr(mid) > value)
        high = mid;
    elseif(arr(mid) < value)
        low = mid;
    elseif(arr(mid) == value)
        low = mid;
        break;
    end
end

if(value <= arr(1))
    low = 1;
elseif(value >= arr(len))
    low = len - 1;
end
    
output = matrix(low,1) * value * value + matrix(low,2) * value + matrix(low,3);

end    