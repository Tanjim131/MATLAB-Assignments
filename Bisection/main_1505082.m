x = -2*pi : 0.2 : 2*pi;
y = sin(x)
plot(x,y,'r')
hold on
y1 = sincurve_1505082(x,1);
plot(x,y1,'b')
y2 = sincurve_1505082(x,3);
plot(x,y2,'g')
y3 = sincurve_1505082(x,5);
plot(x,y3,'k')
y4 = sincurve_1505082(x,20);
plot(x,y4,'m')
xlabel('value of x in radian');
ylabel('Corresponding sin function value');
legend('sin(x) graph')
set(gca,'XTick',-2*pi : pi/2 : 2*pi)
set(gca,'XTickLabel',{'-2pi','-3pi/2','-pi','-pi/2','0','pi/2','pi','3pi/2','2pi'})
