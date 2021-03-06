hold on
l = [0.07, 0.15, 0.21, 0.16];
DH_d = [l(1), 0, l(2), 0, 0]'; % Displacements d in mm
DH_a = [0, 0, 0, l(3), l(4)]'; % Displacements a in mm
figure 
h = plot3([0],[ 0 ],[ 0])
axis([-2 2 -2 2]);
theta = linspace(0,0.5*pi,100);
for index=1:length(theta)

   DH_theta = [ theta(index), 0, 0+ deg2rad(90)]'; % Theta angles 
DH_d     = [l(1), 0, 0]'; % Displacements d in mm
DH_a     = [0, l(3), l(4)]'; % Displacements a in mm
DH_alpha = [deg2rad(-90), 0,  0]'; % rotations alpha

    %T = eye(4); % start with an Identity matrix seed to multiply subsequent transformations by
    T= dhparam2matrix(DH_theta(1), DH_d(1), DH_a(1), DH_alpha(1));
    for i=2:length(DH_d)
        T_local = dhparam2matrix(DH_theta(i), DH_d(i), DH_a(i), DH_alpha(i));
        T(:,:,i) = T(:,:,i-1) * T_local;
    end

    
    for i=1:length(T(1,1,:))
        plotx(i) = T(1,4,i);
        ploty(i) = T(2,4,i);
        plotz(i) = T(3,4,i);
    end
    
  
        x = [ 0 plotx];
        y = [ 0 ploty];
        z = [ 0 plotz];
        %plot([ 0 O1(i,1) O2(i,1)],[ 0 O1(i,2) O2(i,2)] )
        set(h,'XData',x, 'YData',y, 'ZData',z)
        refreshdata(h)


     pause(.1)
end
