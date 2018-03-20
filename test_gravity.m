u = []

for theta=linspace(0,2*pi,100)
    G = getG(theta,0,0);
    M = getM(theta,0,0);
    temp = G;
    u = [u;temp'];
end
plot(linspace(0,2*pi,100),u(:,1))