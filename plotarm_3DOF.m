function plotarm_3DOF( DH_theta, DH_d, DH_alpha, DH_a)
% Plot a 3 DOF arm as a stick model
% The model defined below is for the IRB 120 robot. The joint states are
% used in the model as the theta parameters.

workspace = eval(1.1*max(sum(DH_d), sum(DH_a)));
% Initializing figure
h = figure();           % Open (create) a figure environment
axes;               % Add an axes environment to the figure
hold on;            % Hold on to the objects in the axes
axis equal;         % Set the aspect ratios of the coordinates to be equal
box on; grid on;    % Put a box around axes and display the grid lines
view(3);            % View the graph in 3D

axis([-workspace, workspace, -workspace, workspace, -workspace, workspace]); % Set axes limits
title({'Robo-Sim'}); % Add title
xlabel('X-Axis (mm)') % x-axis label
ylabel('Y-Axis (mm)') % y-axis label
zlabel('Z-Axis (mm)') % z-axis label
% Using the joint states, calculate the forward kinematics of the link
% positions.
T = eye(4);
    for i=1:length(DH_d)
        T_local = dhparam2matrix(DH_theta(i), DH_d(i), DH_a(i), DH_alpha(i));
        T = T * T_local;
        plotx(i) = T(1,4);
        ploty(i) = T(2,4);
        plotz(i) = T(3,4);
    end
    
% Plot the robot links
robot = plot3([0; plotx'],...
              [0; ploty'],...
              [0; plotz'], '-ok', 'LineWidth', 2);
          
% Plot the x-vector of the end-effector pose
xvector = plot3([plotx(end); plotx(end) + T(1,1)*0.1],...
                [ploty(end); ploty(end) + T(2,1)*0.1],...
                [plotz(end); plotz(end) + T(3,1)*0.1], '-r', 'LineWidth', 1);
% Label the x-vector
text(plotx(end) + T(1,1)*0.1 + 0.05, ploty(end) + T(2,1)*0.1 + 0.05,...
     plotz(end) + T(3,1)*0.1 + 0.05, 'x');

% Plot the y-vector of the end-effector pose
yvector = plot3([plotx(end); plotx(end) + T(1,2)*0.1],...
                [ploty(end); ploty(end) + T(2,2)*0.1],...
                [plotz(end); plotz(end) + T(3,2)*0.1], '-g', 'LineWidth', 1);
% Label the y-vector
text(plotx(end) + T(1,2)*0.1 + 0.05, ploty(end) + T(2,2)*0.1 + 0.05,...
     plotz(end) + T(3,2)*0.1 + 0.05, 'y');

% Plot the z-vector of the end-effector pose
zvector = plot3([plotx(end); plotx(end) + T(1,3)*0.1],...
                [ploty(end); ploty(end) + T(2,3)*0.1],...
                [plotz(end); plotz(end) + T(3,3)*0.1], '-b', 'LineWidth', 1);
% Label the z-vector
text(plotx(end) + T(1,3)*0.1 + 0.05, ploty(end) + T(2,3)*0.1 + 0.05,...
     plotz(end) + T(3,3)*0.1 + 0.05, 'z');
end

