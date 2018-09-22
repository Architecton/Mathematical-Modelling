function dy = duffing(y, t)
	% right-hand side for the equation for Duffings oscillator
	a = 0; % No damping
	x = y(1); % position
	v = y(2); %velocity
	dy = [v, -a.*v-x.^3 +x];
end