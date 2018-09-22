function [t, Y] = rk4(f, interval, Y0, h)
%[t, Y] = rk4(f, [t0, tk], Y0, h) resi DE
%Y' = f(Y, t) pri zacetnem pogoju Y(t0) = Y0 s standardno 
%Runge-Kutta metodo 4. reda s korakom h na intervalu [t0, tk].

%pripravimo vrstico casov t
t = interval(1):h:interval(2);

%pripravimo vrednosti Y
Y = zeros(length(Y0), length(t));
Y(:, 1) = Y0;

%pozenemo Runge-Kutta metodo
for k = 2:length(t)
	%poracunamo vrednosti k1, ..., k4 in...
	k1 = h*f(Y(:, k-1), t(k-1));
	k2 = h*f(Y(:, k-1) + k1/2, t(k-1) + h/2);
	k3 = h*f(Y(:, k-1) + k2/2, t(k-1) + h/2);
	k4 = h*f(Y(:, k-1) + k3, t(k-1) + h);
	%... dodamo utezeno povprecje teh vrednosti Y
	Y(:, k) = Y(:, k-1) + 1/6*(k1 + 2*k2 + 2*k3 + k4);
end