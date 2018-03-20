%solve inverse kinematics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function q  = IK(px,py,pz)
    L1 = 0.07;
    L2 = 0.15;
    L3 = 0.21;
    L4 = ((pz - L1)^2 + px^2+py^2)^(0.5);
    T1 = atan2(py,px); %Theta 1 equation
    T2 = atan2(pz-L1, (px^2+py^2)^(0.5)) + acos((L2^2+L4^2-L3^2)/(2*L2*L4)); %Theta 2 equation
    T3 = acos((L2^2+L3^2-L4^2)/(2*L2*L3))-pi/2;%theta 3 equation
    %add safety if statements
    A1 = T1;
    A2 = T2;
    A3 = T3;
    
    q = [A1,A2,A3];
end