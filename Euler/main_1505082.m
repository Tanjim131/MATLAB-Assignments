dydx = @(x) (x^3 - 5 * x^2 - x + 6);
xrange = [0 4];
yinit = 1;
h = 0.5;

x = 0 : 0.5 : 4;
p = length(x);
y = zeros(p);
analytical = @(x) ( (1/4) * (x.^4) - (5/3) * (x.^3) - (1/2) * (x.^2) + 6 * x + 1 );

y = analytical(x);

plot(x,y,'r');

grid on;
hold on;


[x y] = Euler_1505082(dydx,xrange,yinit,h);

plot(x,y,'b');

[x y] = Heun_1505082(dydx,xrange,yinit,h);

plot(x,y,'g');

[x y] = Midpoint_1505082(dydx,xrange,yinit,h);

plot(x,y,'m');

[x y] = Ralston_1505082(dydx,xrange,yinit,h);

plot(x,y,'k');