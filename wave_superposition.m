clc, clearvars

figure;
list = zeros(1,100);
for i = 1:10
    x=linspace(-40,40);
    y=sin((rand()* x) + rand()) * rand();
    subplot(2,5,i);
    plot(x,y);
    list(1,:) = list(1,:) + y;
end
figure;
x = linspace(-40,40);
plot(x,list);