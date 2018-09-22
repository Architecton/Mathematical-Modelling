%X = sprejemnik(P, d) vrne polozaje 
%X = [x1, y1; x2, y2; ... ; xk, yk] sprejemnikov,
%P = [p1, q1; p2, q2; ... ;pn, qn] so polozaji oddajnikov,
%d = [dij] so razdalje sprejemnikov od oddajnikov (n x k matrika)

function X = sprejemnik(P, d)
% leva stran sistema, matrika A
A = 2*(P(2:end, :) - P(1:end - 1, :));
% desna stran sistema, stolpec b
b = (d(1:end - 1, :).^2 - d(2:end, :).^2) + (P(2:end, 1).^2 - P(1:end - 1, 1).^2) + (P(2:end, 2).^2 - P(1:end - 1, 2).^2);
% sistem A*X = b resimo po metodi najmanjsih kvadratov
X = (A\b)';

% testi
%!test
%!	P = [0 0; 1 1; 2 0];
%!	d = [1; 1; 1];
%!	assert(sprejemnik(P, d), [1, 0], eps);