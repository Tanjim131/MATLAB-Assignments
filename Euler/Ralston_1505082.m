function [outx,outy] = Ralston_1505082(dydx,xrange,yinit,h)


xi = xrange(1);
xf = xrange(2);

if ~(xf > xi)
    error('Upper Limit Must be greater than the lower limit');
end

outx = xi : h : xf;
n = length(outx);
[p q] = size(outx);
outy = zeros(p,1);
outy(1,1) = yinit;

for i = 1 : n - 1
    y1 = dydx( outx(i) );
    y2 = dydx( outx(i)+(3*h/4) );
    
    outy(i + 1) = outy(i) + ( h/3 ) * (y1 + 2*y2);
end

outx = outx';
outy = outy';

end 