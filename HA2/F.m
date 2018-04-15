function [r, dr, ddr] = F(t)
r = [sin(t); cos(t)];
dr = [cos(t); -sin(t)];
ddr = [-sin(t); -cos(t)];
endfunction