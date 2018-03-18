
clear all; close all; clc;

syms q0 q1 q2 'real'; % Joint states, in degrees
syms l0 l1 l2 l3 'real'; % Joint lengths, in cm

q = [q0, q1, q2];
l = [l0, l1, l2, l3];

DH_theta = [0, deg2rad(90), q(1), q(2), q(3)+ deg2rad(90)]'; % Theta angles 
DH_d = [l(1), 0, l(2), 0, 0]'; % Displacements d in mm
DH_a = [0, 0, 0, l(3), l(4)]'; % Displacements a in mm
DH_alpha = [deg2rad(-45), 0, deg2rad(-90), 0, 0]'; % rotations alpha

%T = eye(4); % start with an Identity matrix seed to multiply subsequent transformations by
T= dhparam2matrix(DH_theta(1), DH_d(1), DH_a(1), DH_alpha(1));
for i=2:length(DH_d)
    T_local = dhparam2matrix(DH_theta(i), DH_d(i), DH_a(i), DH_alpha(i));
    T(:,:,i) = T(:,:,i-1) * T_local;
end
disp("The total transformation can be represented by:");
disp(vpa(T(:,:,end)));


var1 = {l0, l1, l2, l3};
var2 = {0.07, 0.15, 0.21, 0.16};
DH_d = subs(DH_d, var1, var2);
DH_a = subs(DH_a, var1, var2);
for i=1:length(DH_a)
    T_eval(:,:,i) = subs(T(:,:,i), var1, var2);
end


for i=1:length(DH_a)
    FK = T_eval(1:3,4,i);
    J(:,:,i) = vpa(jacobian(FK, [q0,q1,q2]'),3);
end
 
mass = 1;
J(:,:,end)
m_matrix = mass*eye(3)
g = [0;0;-9.81];

M = transpose(J(:,:,1))*m_matrix*J(:,:,1);
G = transpose(J(:,:,1))*g;
for i=2:length(J)
    M = M + transpose(J(:,:,i))*m_matrix*J(:,:,i);
    G = G + transpose(J(:,:,i))*g;
end
matlabFunction(M, "File", "getM")
matlabFunction(G, "File", "getG")
matlabFunction(J(:,:,end), "File", "getJ")






