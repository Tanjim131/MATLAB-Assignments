function [point,value] = GoldenSection_1505082(func,xl,xu,expected_error,maxiter)

% func - passing function as parameter 
% func - f(x) = -3x^2 + 21.6x + 5;
% finding maximum value in [0,10] range 
% xl - lower bound - 0
% xu - upper bound - 10
% expected error - 0.5%
% maximum iterations - 10,000

iter = 0; % initializing the iteration value 
error = 100; % initially setting error to 100 percent 
phi = (1 + sqrt(5))/2; %Golden Ratio

while(iter <= maxiter)
    if(abs(error) < expected_error)
        break;
    end
       
    d = (phi - 1) * (xu - xl);
    x1 = xl + d; % finding the two points 
    x2 = xu - d;
    
    if(func(x1) > func(x2)) 
        xopt = x1;
        xl = x2;
    else
        xopt = x2;
        xu = x1;
    end
    
    iter = iter + 1; % incrementing iteration 
    
    if(xopt ~= 0) % checking if xopt is zero or not 
        error = (2 - phi) * ((xu - xl) / xopt) * 100; % updating error
    end
    
end

point = xopt;
value = func(xopt); % final answer