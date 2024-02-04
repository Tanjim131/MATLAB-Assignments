clear;
trainx = input('');
trainy = input('');
testx = input('');
testy = input('');

trainx = trainx';
trainy = trainy';
testx = testx';
testy = testy';

scatter(trainx,trainy,'k','filled');
grid on;
hold on;
scatter(testx,testy,'g','filled');

xlabel('Value of x');
ylabel('Value of f(x) = y');

len = length(trainx);

option = input('Press 1 for Newton Interpolation Or 2 for Quadratic Spline Interpolation\n');

for i = 2 : len
    tx = linspace(1,len,i);
    tx = round(tx);
    
    tmpx = trainx(tx);
    tmpy = trainy(tx);
    
    sct = scatter(tmpx,tmpy,'r','filled');
    error = 0;
    
    if(option == 1)
        poly = NDDP_1505082(tmpx,tmpy);
        
        x = trainx;
        
        for j = 1 : length(trainx)
           y(j) = NewtonPolynomial_1505082(tmpx,x(j),poly);
        end
        
        for j = 1 : length(testx)
            approxy = NewtonPolynomial_1505082(tmpx,testx(j),poly);
         
            error = error + abs(testy(j) - approxy)/abs(testy(j));
        end
    else
        matrix = SplineInterpolation_1505082(tmpx,tmpy);
        
        x = trainx(1) : .1 : trainx(len);
      
        for j = 1 : length(x)
            y(j) = SplinePolynomial_1505082(tmpx,x(j),matrix);
        end
        
        for j = 1 : length(testx)
            approxy = SplinePolynomial_1505082(tmpx,testx(j),matrix);
            error = error + abs(testy(j) - approxy)/abs(testy(j));
        end
    end
    
    tempplot = plot(x,y,'b');
    
    xlabel('Value of x');
    ylabel('Value of f(x) = y');
    
    hold on;
    
    fprintf('Error associated with %d order polynomial is %f\n',i - 1,(100 * error) / length(testx));
    
    pause(2);
    
    if(i ~= len)
        delete(sct);
        delete(tempplot);
    end
end 