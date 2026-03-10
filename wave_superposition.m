clc, clearvars

sum = zeros(1,100);
n = 10;

angularFrequency =  rand(1,n)*10;
phaseShift = rand(1,n)*5;
phaseShift = zeros(1,n);
amplitude = rand(1,n)*10;

perfectSquare = 1;
while 1 
   
    if (perfectSquare+1)^2 > n
        perfectSquare = perfectSquare+1;
        break
    end
     perfectSquare = perfectSquare+1;
    
    
end
disp(perfectSquare);

figure;

for i=1:n
    x = linspace(1,100);
    y = amplitude(i) * sin(angularFrequency(i) * x + phaseShift(i));
    subplot(perfectSquare,perfectSquare,i);
    plot(x,y);
    sum(1,:) = sum(1,:) + y;
end

figure;
x = linspace(1,100);
plot(x,sum);


reduced = zeros(n,n+1);
reduced(:,1)=1;
reduced(:,n+1) = amplitude;

for i=1:n
    for j=2:n
        if(mod(j,2)==0)
            reduced(i,j) = cos((j/2) * angularFrequency(i));
        else
            reduced(i,j) = sin((j-1)/2 * angularFrequency(i));
        end
    end
end

R = rref(reduced);

constants = R(:,n+1)';

temp = linspace(min(angularFrequency),max(angularFrequency),1000);
y = approx(constants, n, temp);
figure;
plot(temp,y);
hold("on");
plot(angularFrequency,amplitude, '.')




function r = approx(constants, n, space)
    r = zeros(1,length(space)) + constants(1);
    for i=1:n
        if(mod(i,2) == 0)
           r = r + (constants(i) .* cos(i/2 .* space));
        else
           r = r + (constants(i) .* sin((i-1)/2 .* space));
        end
    end
end

%%a
