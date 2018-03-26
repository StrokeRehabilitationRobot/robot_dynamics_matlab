clear all;
close all;
clc;

IC_q = [0; 0; 0];
IC_pos = FK(IC_q(1), IC_q(2), IC_q(3));
wall_x = 100;
wall_y = 10;

K_wall = 100;
B_wall = 0;

mass = 1;
K = 50;
D = 500;
dt = 0.001;
set_param('robot_dynamics','AlgebraicLoopSolver','LineSearch')
sim('robot_dynamics')


% l = [0.07, 0.15, 0.21, 0.16];
% figure 
% h = plot3([0],[ 0 ],[ 0]);
% axis([-1 1 -1 1 -1 1]); hold on; grid on;
% for index=1:length(angles)
% 
%     %Alexandra's Re-calculated DH params, March 21
%     DH_theta = [0, deg2rad(90) + angles(index,1), angles(index,2), angles(index,3), deg2rad(90)]'; % Theta angles 
%     DH_d = [l(1), l(2), 0, 0, 0]'; % Displacements d in mm
%     DH_a = [0, 0, l(3), l(4), 0]'; % Displacements a in mm
%     DH_alpha = [deg2rad(-45), deg2rad(-90), 0, 0, deg2rad(90)]'; % rotations alpha
%     
% 
%     %T = eye(4); % start with an Identity matrix seed to multiply subsequent transformations by
%     T= dhparam2matrix(DH_theta(1), DH_d(1), DH_a(1), DH_alpha(1));
%     for i=2:length(DH_d)
%         T_local = dhparam2matrix(DH_theta(i), DH_d(i), DH_a(i), DH_alpha(i));
%         T(:,:,i) = T(:,:,i-1) * T_local;
%     end
% 
%     for i=1:length(T(1,1,:))
%         plotx(i) = T(1,4,i);
%         ploty(i) = T(2,4,i);
%         plotz(i) = T(3,4,i);
%     end
%  
%         x = [ 0 plotx];
%         y = [ 0 ploty];
%         z = [ 0 plotz];
%         %plot([ 0 O1(i,1) O2(i,1)],[ 0 O1(i,2) O2(i,2)] )
%         set(h,'XData',x, 'YData',y, 'ZData',z)
%         refreshdata(h)
% 
%      pause(.1)
% end
% 
