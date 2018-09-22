function [r, dr, ddr] = line_test(s)
	r = [s; 2 - s];
	dr = [1; -1];
	ddr = [0; 0];
endfunction