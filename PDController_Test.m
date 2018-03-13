clc; clear all; close all;

dt = 0.01;

% These parameters are for the relationship between the end effector and
% the player
K1 = 1850*eye(3);
D1 = 200*eye(3);

K2 = 5000*eye(3);
D2 = 250*eye(3);

A = eye(6);
A(1:3,4:6) = dt*eye(3);
B = zeros(6,3);
B(4:6,1:3) = dt*eye(3);

mass = 10;
state = [0,0,0,0,0,0]';
desired_state = [0.3, 0.3, 0.3, 0,0,0]';
wall_loc = [0.2,0.2,0.2]';
%wall_loc = [2,2,2]';

wall_depth = 0.05;

deadline = 0.5; % seconds
tf = 1; %seconds
trange = (0:dt:tf);

force = zeros(length(trange), 3);
error = zeros(length(trange), 3);
pos = zeros(length(trange), 3);
vel = zeros(length(trange), 3);
% force_tip = zeros(length(trange), 3);
% force_base = zeros(length(trange), 3);
% pos = zeros(length(trange), 3);
for i = 1:length(trange)
    e = desired_state(1:3) - state(1:3);
    de = desired_state(4:6) - state(4:6);
    error(i,:) = e;
    ee_force = K1*e + D1*de;
    wallForce = getForceWall(K2, D2, state(1:3), state(4:6), wall_depth, wall_loc);
    force(i,:) = ee_force - wallForce;
%     force_base = [1, 0, 0];
%     R = GetRotationMatrix(state(1), state(2), state(3));
%     force_tip = R*force_base;
    xdd = force(i,:)/mass;
    state = A*state + B*xdd';
    pos(i,:) = state(1:3)';
    vel(i,:) = state(4:6)';

end

workspace  = 1.1*desired_state(1:3);
figure('Name', 'PD Control');
subplot(3,2,1);
%plot(trange, error(:,1));hold on;
plot(trange, desired_state(1)*ones(1,length(trange))); hold on;
plot(trange, wall_loc(1)*ones(1,length(trange)));
plot(trange, pos(:,1));
plot(trange, zeros(length(trange)));
legend('des_x','wall','pos_x'); xlabel('time');
axis([0, tf, 0, workspace(1)]);
title('X-axis');

subplot(3,2,3);
%plot(trange, error(:,2));hold on;
%plot(trange, force(:,2));
plot(trange, desired_state(2)*ones(1,length(trange))); hold on;
plot(trange, wall_loc(2)*ones(1,length(trange)));
plot(trange, pos(:,2));
plot(trange, zeros(length(trange)));
legend('des_y','wall','pos_y'); xlabel('time');
axis([0, tf, 0, workspace(2)]);
title('Y-axis');

subplot(3,2,5);
%plot(trange, error(:,3));hold on;
%plot(trange, force(:,3));
plot(trange, desired_state(3)*ones(1,length(trange))); hold on;
plot(trange, wall_loc(3)*ones(1,length(trange)));
plot(trange, pos(:,3));
plot(trange, zeros(length(trange)));
legend('des_z','wall','pos_z'); xlabel('time');
axis([0, tf, 0, workspace(3)]);
title('Z-axis');

subplot(3,2,[2,4]);
plot(trange, force(:,:));  hold on;
legend;
title('Forces');

subplot(3,2,6);
plot(trange, vel(:,:));  hold on;
legend;
title('Velocities');