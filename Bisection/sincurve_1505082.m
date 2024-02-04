function y = sincurve_1505082( x , n )

%plots a sin curve given x and number of iterations n

y = 0; % intialize
counter = 1; % for power 
check = 1; % for number of iterations 
sign = -1; % plus minus 
new = x; % new term 

while check <= n
    y = y + new;
    check = check + 1;
    counter = counter .* (2 .* check - 1) .* (2 .* check - 2);
    new = (x.^(2.*check-1) .* sign) / counter ;
    sign = sign .* (-1);
    disp(y);
    end
end

