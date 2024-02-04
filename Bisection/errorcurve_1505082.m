function error = errorcurve_1505082( x , n )

% function for generating relative approximation error

y = x; % intialize
prev = y;
error = 100;
counter = 3; % for power 
check = 2; % for number of iterations 
sign = -1; % plus minus 

while check <= n
    prev = y;
    y = y + sign * (x.^counter)/factorial(counter);
    error = ((y - prev)/y) * 100;
    counter = counter + 2;
    sign = sign * (-1) ;
    check = check + 1;
    end
end

