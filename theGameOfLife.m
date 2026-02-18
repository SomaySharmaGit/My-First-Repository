clc, clearvars


%This project was also guided by AI, but less so than the heatFlow. I used
%the kernel method, expanded for diagonals. AI was used to check the logic,
%but the ideas were mainly mine (obviously not the rules for the game of
%life) 

bounds = 50;

X = rand(bounds,bounds);

decision = 0.85;
upMask = (X>decision);
lowMask = (X <= decision);

X(lowMask) = floor(X(lowMask));
X(upMask) = ceil(X(upMask));

neighbor = zeros(bounds,bounds);

for i =  1:500

neighbor(2:end-1, 2:end-1) = X(3:end, 2:end-1) ... 
    + X(1:end-2, 2:end-1)... 
    + X(2:end - 1, 3:end)... 
    + X(2:end - 1, 1:end-2)... 
    + X(1:end-2, 1:end-2)... 
    + X(3:end, 3:end)...
    + X(1:end-2, 3:end)...
    + X(3:end, 1:end-2)...
;





death = (neighbor < 2 | neighbor > 3);
life = (neighbor == 2 & X == 1);
birth = (neighbor == 3 & X == 0);

X(death) = 0;
X(life) = 1;
X(birth) = 1;

imagesc(X);

drawnow();
pause(0.05);
end