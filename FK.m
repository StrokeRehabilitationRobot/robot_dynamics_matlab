function [ FK ] = FK( angles )
%

    syms q0 q1 q2 'real'; % Joint states, in degrees
    syms l0 l1 l2 l3 'real'; % Joint lengths, in cm

    q = [q0, q1, q2];
    l = [l0, l1, l2, l3];

    DH_theta = [0, deg2rad(90), q(1), q(2), q(3)+ deg2rad(90)]'; % Theta angles 
    DH_d = [l(1), 0, l(2), 0, 0]'; % Displacements d in mm
    DH_a = [0, 0, 0, l(3), l(4)]'; % Displacements a in mm
    DH_alpha = [deg2rad(-45), 0, deg2rad(-90), 0, 0]'; % rotations alpha


    T = eye(4); % start with an Identity matrix seed to multiply subsequent transformations by
    for i=1:length(DH_d)
        T_local = dhparam2matrix(DH_theta(i), DH_d(i), DH_a(i), DH_alpha(i));
        T = T * T_local;
    end
    disp("The total transformation can be represented by:");
    disp(vpa(T));


    var1 = {l0, l1, l2, l3};
    var2 = {0.07, 0.15, 0.21, 0.16};
    DH_d = subs(DH_d, var1, var2);
    DH_a = subs(DH_a, var1, var2);
    T = subs(T, var1, var2);

    var1 = {q0, q1, q2};
    var2 = {angles(1),angles(2),angles(3)};%{0.44, -0.84, 1.64-pi/2};


    FK = double(subs(T(1:3,4),var1,var2))


 
end

