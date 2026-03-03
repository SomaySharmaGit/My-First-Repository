clc, clearvars

x = linspace(-10,10,100);

y = sin(x);

n = 40;

a = zeros(1,n+1);
b = zeros(1+n);

reduced = zeros(n,n+1);



values = linspace(-10,10,n);

outputs =  zeros(1,n);

for i=1:n
    outputs(i) = sin(2*values(i));

end


for i=1:n
    for j=1:n+1
        if(j == 1)
            reduced(i,j) = 1; %%Column
        elseif (j==n+1)
            reduced(i,j) = outputs(i); 
        elseif (mod(j,2) == 0)
            reduced(i,j) = cos((j/2) * values(i)); %% Cos col 
        else
            reduced(i,j) = sin((j-1)/2 * values(i)); %% Sin col 
        end
    end
end    

R = rref(reduced);
disp(R);


constants = R(:,n+1)';
disp(constants);

temp = linspace(-20,20,1000);
y = approx(constants, n, temp);
plot(temp,y);
hold();
plot(values,outputs);

outputs



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



