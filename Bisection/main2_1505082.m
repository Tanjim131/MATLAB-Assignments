for i = 1 : 50
   b(i) = errorcurve_1505082(1.5,i);
end
a = 1 : 1 : 50;
plot(a,b,'r')
xlabel('Iteration Number')
ylabel('Relative Approximation Error')
legend('Relative approx. error vs Iteration No.')
grid
