function T = dhparam2matrix( theta, d, a, alpha )
% Converts DH parameters to transformation matrix T. Angles should be in
% radians here, or symbolic values
% Given DH parameters $d$, $\theta$, $a$, and $\alpha$, there is a
% transformation matrix $T = Trans_d \bullet Rot_{\theta} \bullet Trans_a
% \bullet Rot_{\alpha}$, where $Trans_d = \pmatrix{1 & 0 & 0 & 0 \cr 
% 0 & 1 & 0 & 0 \cr 0 & 0 & 1 & d \cr 0 & 0 & 0 & 1}$, $Rot_\theta = 
% \pmatrix{cos \theta & -sin \theta & 0 & 0 \cr sin \theta & cos \theta & 0 & 0 \cr 
% 0 & 0 & 1 & 0 \cr 0 & 0 & 0 & 1}$ , $Trans_a = \pmatrix{1 & 0 & 0 & a \cr 
% 0 & 1 & 0 & 0 \cr 0 & 0 & 1 & 0 \cr 0 & 0 & 0 & 1}$, and $Rot_\alpha = 
% \pmatrix{1 & 0 & 0 & 0 \cr 0 & cos \alpha & -sin \alpha & 0 \cr 
% 0 & sin \alpha & cos \alpha & 0 \cr 0 & 0 & 0 & 1}$
    Trans_d = [1, 0, 0, 0;
               0, 1, 0, 0;
               0, 0, 1, d;
               0, 0, 0, 1];
    Rot_theta = [cos(theta), -sin(theta), 0, 0;
                 sin(theta),  cos(theta), 0, 0;
                          0,           0, 1, 0;
                          0,           0, 0, 1];
    Trans_a = [1, 0, 0, a;
               0, 1, 0, 0;
               0, 0, 1, 0;
               0, 0, 0, 1];

   Rot_alpha = [1,          0,            0, 0;
                0, cos(alpha),  -sin(alpha), 0;
                0, sin(alpha),   cos(alpha), 0;
                0,          0,            0, 1];


    T = Trans_d * Rot_theta * Trans_a * Rot_alpha;

end

