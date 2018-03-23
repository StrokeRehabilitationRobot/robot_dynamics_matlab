function [ x_new ] = remap( x, in_min, in_max, out_min, out_max )
%REMAP Summary of this function goes here
%   Detailed explanation goes here

    x_temp = (x - in_min) * (out_max - out_min) /(in_max - in_min) + out_min;
    high_clamp = max(out_min, out_max);
    low_clamp = min(out_min, out_max);
    x_new = max(low_clamp, min(x_temp, high_clamp));
end

