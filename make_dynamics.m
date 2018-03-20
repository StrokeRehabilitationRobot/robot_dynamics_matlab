clear all
syms q0(t) q1(t) q2(t) q0_temp q1_temp q2_temp mass

q = [q0(t),q1(t),q2(t)]
dq = diff(q,t);
q_temp = [q0_temp,q1_temp,q2_temp];
assume([q,q_temp,dq], 'real');

%assume(q0(t), 'real');
%assume(q1(t), 'real');
% Joint states, in degrees
l = [0.07, 0.15, 0.21, 0.16];

% DH_theta = [0, deg2rad(90), q(1), q(2), q(3)+ deg2rad(90)]'; % Theta angles 
% DH_d     = [l(1), 0, l(2), 0, 0]'; % Displacements d in mm
% DH_a     = [0, 0, 0, l(3), l(4)]'; % Displacements a in mm
% DH_alpha = [deg2rad(-45), 0, deg2rad(-90), 0, 0]'; % rotations alpha


DH_theta = [ q(1), q(2), q(3)+ deg2rad(90)]'; % Theta angles 
DH_d     = [l(1), 0, 0]'; % Displacements d in mm
DH_a     = [0, l(3), l(4)]'; % Displacements a in mm
DH_alpha = [deg2rad(-90), 0,  0]'; % rotations alpha



%T = eye(4); % start with an Identity matrix seed to multiply subsequent transformations by
T= dhparam2matrix(DH_theta(1), DH_d(1), DH_a(1), DH_alpha(1));
for i=2:length(DH_d)
    
    T_local = dhparam2matrix(DH_theta(i), DH_d(i), DH_a(i), DH_alpha(i));
    T(:,:,i) = T(:,:,i-1) * T_local;

end

disp("The total transformation can be represented by:");
disp(vpa(T(:,:,end)));

for i=1:length(DH_a)
    
    FK = T(1:3,4,i)
    FK = subs(FK,q,q_temp);
    J(:,:,i) = jacobian(FK, q_temp);
    J(:,:,i) = subs(J(:,:,i), q_temp,q)
    
end
 

J(:,:,end)
m_matrix = mass*eye(3)
g = 9.81

M = transpose(J(:,:,1))*m_matrix*J(:,:,1);
V = mass*g*T(3,4,1);

for i=2:length(J)
    
    M = M + transpose(J(:,:,i))*m_matrix*J(:,:,i);
    V = V + mass*g*T(3,4,i);

end

dq = diff(q)';
K = 0.5*dq'*M*dq
syms q0 q1 q2 dq0 dq1 dq2
q_fix = [q0,q1,q2];
dq_fix = [dq0,dq1,dq2];
V2 = subs(V,q,q_fix)
G_fix = [diff(V2,q0);diff(V2,q1); diff(V2,q2)]
dL = functionalDerivative(K-V,q);
CG = subs(dL, [diff(q,t,2)] ,[0,0,0]);
G = subs(CG, [diff(q,t)], [0,0,0]);
C = subs(dL-G,[diff(q,t,2)] ,[0,0,0]);
C_fix = subs(C, diff(q,t),dq_fix)
C_fix = subs(C_fix, q,q_fix);
G_fix = subs(G, [q],q_fix)
M_fix = subs(M,[q],q_fix) 
M_fix = subs(M_fix,[diff(q,t)],dq_fix) 

matlabFunction(M_fix, "File", "getM")
matlabFunction(G_fix, "File", "getG")
matlabFunction(C_fix, "File", "getC")
