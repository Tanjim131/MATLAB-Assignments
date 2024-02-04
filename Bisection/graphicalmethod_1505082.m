f = 0.001 : 0.001 : 0.01;
Re = 20000;
g = @(f) -1./sqrt(f) + 4 .* log10(Re.*sqrt(f)) - 0.4;
ans = bisection_1505082(g,0.001,0.01,0.5,10000);
fprintf('Value of f from bisetion method is : %0.20f\n',ans);
ans = falseposition_1505082(g,0.001,0.01,0.5,10000);
fprintf('Value of f from falseposition method is : %0.20f\n', ans);
g = -1./sqrt(f) + 4 .* log10(Re.*sqrt(f)) - 0.4;
plot(f,g)
xlabel('Range of fanning factor f');
ylabel('Corresponding value of function of f');
legend('graph of g(f)');
grid on
