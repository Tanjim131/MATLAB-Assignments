function mid = bisection_1505082( func, low , high , expectederror, maxiterations )

% bisection method

iterations = 0;
error = 100; 
prev = low;

while(iterations < maxiterations )
    if( abs(error) < expectederror ) 
       break;
    end 
    
    mid = (low + high)/2;
    
    if( func(low) * func(mid) < 0)
        high = mid;
    else 
        low = mid;
    end
    
    error = ( mid - prev ) / mid * 100;
    prev = mid;
    iterations = iterations + 1;
    end
end 