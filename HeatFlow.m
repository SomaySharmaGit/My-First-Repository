clc, clearvars

%This project was guided by AI. I did this to learn about heat flow. I want
%to eventually do fluid dynamics and I am building up to it with this

L = 1; 
nx = 50;
dx = L/(nx-1);

dt = 0.005;
nt = 1000;

a = 0.02;

r = (a * dt)/ (dx^2);
fprintf('The stability ratio is %f', r);

u = zeros(1,nx);
u(1) = 100;

v = zeros(nx,nx);
v(1, :) = 100;

for t = 1:nt
    v(2:end-1, 2:end-1) = v(2:end-1, 2:end-1) + r * ( ...
        v(2:end-1,3:end) ... %Left
        + v(2:end-1,1:end-2) ... %East
        + v(1:end-2, 2:end-1) ... %Down
        + v(3:end, 2:end-1) ... %Up
        - 4 *v(2:end-1, 2:end-1));
    imagesc(v);
    title(['Frame: ', num2str(t)]);
    drawnow;

end

% for t = 1:nt
%     u(2:end-1) = u(2:end-1) + r * (u(3:end) - 2*u(2:end-1) + u(1:end-2));
% 
% 
%     plot(u,'LineWidth', 2);
%     axis([0 nx 0 100]);
%     title(['Timestep: ', num2str(t)]);
%     ylabel('Temp');
%     xlabel('Position');
%     drawnow;
% end 
    


