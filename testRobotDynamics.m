clear all

K_wall = 10;
B_wall = 10;
mass = 10;
K = 10;
D = 10;
dt = 0.01;
sim('robot_dynamics')

syms q0 q1 q2 'real'; % Joint states, in degrees
syms l0 l1 l2 l3 'real'; % Joint lengths, in cm

q = [q0, q1, q2];
l = [l0, l1, l2, l3];

q = [q0, q1, q2];
l = [l0, l1, l2, l3];


for angle=angles

    DH_theta = [0, deg2rad(90), angle(1), angle(2), angle(3)+ deg2rad(90)]'; % Theta angles 
    DH_d = [l(1), 0, l(2), 0, 0]'; % Displacements d in mm
    DH_a = [0, 0, 0, l(3), l(4)]'; % Displacements a in mm
    DH_alpha = [deg2rad(-45), 0, deg2rad(-90), 0, 0]'; % rotations alpha

    %T = eye(4); % start with an Identity matrix seed to multiply subsequent transformations by
    T= dhparam2matrix(DH_theta(1), DH_d(1), DH_a(1), DH_alpha(1));
    for i=2:length(DH_d)
        T_local = dhparam2matrix(DH_theta(i), DH_d(i), DH_a(i), DH_alpha(i));
        T(:,:,i) = T(:,:,i-1) * T_local;
    end
    
    plot_arm(T)
    pause(0.1)


end


% 
% 
