function [r, dr, ddr] = G(s)
	r = [s; 2 - s];
	dr = [1; -1];
	ddr = [0; 0];
endfunction