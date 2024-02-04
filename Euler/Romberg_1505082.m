function out = Romberg_1505082(func,low,high,expected_error,max_iter)

n = 1;
I(1,1) = trapezoidal_1505082(func,low,high,n);

true_value = 25.83333333333333;

iterations = 0;
error = 100;

while(iterations < max_iter)
    if(error <= expected_error) 
        break;
    end
    
    iterations = iterations + 1;
    n = 2^iterations;
    I(iterations + 1,1) = trapezoidal_1505082(func,low,high,n);
    
    for i = 2 : iterations + 1
        j = 2 + iterations - i;
        
        I(j,i) = (4^(i - 1)*I(j + 1,i - 1) - I(j,i - 1))/(4^(i - 1) - 1);
    end
    
    error = abs(true_value - I(1,iterations + 1))/(true_value) * 100;
end

out = I(1,iterations + 1);

end