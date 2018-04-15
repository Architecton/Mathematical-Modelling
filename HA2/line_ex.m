function [r, dr, ddr] = line_ex(s)
	r = [s; 2 - s];
	dr = [1; -1];
	ddr = [0; 0];
endfunction