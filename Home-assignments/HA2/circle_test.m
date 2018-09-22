function [r, dr, ddr] = circle_test(t)
r = [sin(t); cos(t)];
dr = [cos(t); -sin(t)];
ddr = [-sin(t); -cos(t)];
endfunction