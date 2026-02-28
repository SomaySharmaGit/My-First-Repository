clc, clearvars

figure;
list = zeros(1,100);

angularFrequency = rand(1,10);
phaseShift = rand(1,10);
amplitude = rand(1,10);

for i = 1:10
    x=linspace(-40,40);
    y=sin((angularFrequency(i)* x) +  phaseShift(i)) * amplitude(i);
    subplot(2,5,i);
    plot(x,y);
    list(1,:) = list(1,:) + y;
end
figure;
x = linspace(-40,40);
plot(x,list);


