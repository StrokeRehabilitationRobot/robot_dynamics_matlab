function [ x_new ] = remap( x, in_min, in_max, out_min, out_max )
%REMAP Summary of this function goes here
%   Detailed explanation goes here

    x_temp = (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
    x_new = max(0, min(x_temp, out_max));
end

