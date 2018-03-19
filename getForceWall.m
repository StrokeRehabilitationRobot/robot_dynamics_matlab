function F = getForceWall(K, B, X, dX, d, W)

dist_to_wall = abs(X-W);
if dist_to_wall <= d
    F = K* max(d - dist_to_wall, 0) + B*dX
else 
    F = 0;
end

end
