function [F] = wallDistance(state,K,B )
%WALLDISTANCE Summary of this function goes here
%   Detailed explanation goes here

    wall_x = remap(50,-0.1,0.1,0,900);
    wall_y = remap(50,0.6,1.9,0,540);
    
    dist_x = abs(state(1)-wall_x);
    dist_y = abs(state(3)-wall_y);
    l_nom = 10;
    Fx = 0;
    Fy = 0;
    Fz = 0;
    
    if dist_x <= d
        Fx = K* max(l_nom - dist_x, 0) + B*state(4);
    end
    
    if dist_y <= d
        Fy = K* max(l_nom - dist_y, 0) + B*state(5);
    end    
   
    F = [Fx;Fy;Fz];
       

end

