clc; clear all; close all;

dt = 0.01;

K = 650*eye(3);
D = 100*eye(3);
A = eye(6);
A(1:3,4:6) = dt*eye(3);
B = zeros(6,3);
B(4:6,1:3) = dt*eye(3);

mass = 10;
state = [0,0,0,0,0,0]';
desired_state = [0.3, 0.3, 0.3, 0,0,0]';

deadline = 0.5; % seconds
tf = 1; %seconds
trange = (0:dt:tf);

force = zeros(length(trange), 3);
error = zeros(length(trange), 3);
pos = zeros(length(trange), 3);
% force_tip = zeros(length(trange), 3);
% force_base = zeros(length(trange), 3);
% pos = zeros(length(trange), 3);
for i = 1:length(trange)
    e = desired_state(1:3) - state(1:3);
    de = desired_state(4:6) - state(4:6);
    error(i,:) = e;
    force(i,:) = K*e + D*de;
%     force_base = [1, 0, 0];
%     R = GetRotationMatrix(state(1), state(2), state(3));
%     force_tip = R*force_base;
    xdd = force(i,:)/mass;
    state = A*state + B*xdd';
    pos(i,:) = state(1:3)';

end


figure('Name', 'PD Control');
subplot(3,1,1);
%plot(trange, error(:,1));hold on;
plot(trange, desired_state(1)*ones(1,length(trange))); hold on;
plot(trange, pos(:,1));
plot(trange, zeros(length(trange)));
legend('des_x','pos_x'); xlabel('time');
axis([0, tf, -0.1, 0.5]);
title('X-axis');

subplot(3,1,2);
%plot(trange, error(:,2));hold on;
%plot(trange, force(:,2));
plot(trange, desired_state(2)*ones(1,length(trange))); hold on;
plot(trange, pos(:,2));
plot(trange, zeros(length(trange)));
legend('des_y','pos_y'); xlabel('time');
axis([0, tf, -0.1, 0.5]);
title('Y-axis');

subplot(3,1,3);
%plot(trange, error(:,3));hold on;
%plot(trange, force(:,3));
plot(trange, desired_state(3)*ones(1,length(trange))); hold on;
plot(trange, pos(:,3));
plot(trange, zeros(length(trange)));
legend('des_z','pos_z'); xlabel('time');
axis([0, tf, -0.1, 0.5]);
title('Z-axis');