function [outx,outy] = Euler_1505082(dydx,xrange,yinit,h)

xi = xrange(1);
xf = xrange(2);

if ~(xf > xi)
    error('Upper Limit Must be greater than the lower limit');
end

outx = xi : h : xf;
n = length(outx);

if ( outx(n) < xf )
    outx(n + 1) = xf;
    n = n + 1;
end

outy = yinit * ones(n,1);

for i = 1 : n - 1
    outy(i + 1) = outy(i) +  dydx ( outx(i) ) *  ( outx ( i + 1 ) - outx(i) );
end

outx = outx';

end

