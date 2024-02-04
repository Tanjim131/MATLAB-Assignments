function xr = falseposition_1505082( func, low , high , expectederror, maxiterations )

% false position method

flow = func (low);
fhigh = func (high);

iterations = 0;
error = 100;
prev = low;

while ( iterations < maxiterations )
    if ( abs(error) < expectederror )
        break;
    end
    
    xr = high - ( fhigh * ( high - low ) / ( fhigh - flow ) );
    
    fxr = func(xr);
    
    if (sign(fxr) == sign(flow))
        low = xr;
        flow = fxr;
    else 
        high = xr;
        fhigh = fxr;
    end
    
    error = ((xr - prev) / xr) * 100;
    prev = xr;
    iterations = iterations + 1;
  end
end
