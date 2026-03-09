clc, clearvars

x = linspace(-10,10,100);

y = sin(x);

n = 4;


reduced = zeros(n,n+1);
values = linspace(-10,10,n);
outputs = sin(2*values);


reduced(:,1)=1;
reduced(:,n+1) = outputs;


for i=1:n
<<<<<<< HEAD
    outputs(i) = sin(1.5*values(i));

=======
    for j=2:n
        if(mod(j,2)==0)
            reduced(i,j) = cos((j/2) * values(i));
        else
            reduced(i,j) = sin((j-1)/2 * values(i));
        end
    end
>>>>>>> 80b482049a77861e0f30d0808a49987f97e88eb6
end


R = rref(reduced);

constants = R(:,n+1)';

temp = linspace(-20,20,1000);
y = approx(constants, n, temp);
plot(temp,y);
hold();
plot(values,outputs);

<<<<<<< HEAD
outputs;



=======
>>>>>>> 80b482049a77861e0f30d0808a49987f97e88eb6
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



