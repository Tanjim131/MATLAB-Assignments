x = 0 : 10;

y = (40 - 5 * x) /2 ;
plot(x,y,'r');
grid on
hold on

y1 = (60 - 6*x)/6;

plot(x,y1,'k');

y2 = (32 - 2 *x)/4;

plot(x,y2,'b');

p = 4;
q = 6;
txt1 = ('\leftarrow Maximum value = 72 [ at (4,6) ]');
text(p,q,txt1);
plot(p,q,'r*');

xlabel('X Axis');
ylabel('Y Axis');

xlim([0 10]);
ylim([0 15]);

title('Graphical Solution');
set(gca,'XTick',(0:1:10));
set(gca,'YTick',(0:1:15));