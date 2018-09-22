g = @(p, x) p(1)*x./(p(2) + x);
dg = @(p,x)[x/(p(2)+x); -p(1)*x/p(2) + x)^2];
ddg = @(p,x) [0, -x/(p(2)+x)^2;
              -x/(p(2)+x)^2, 2*p(1)*x/(p(2) + x)^3];
              
% podatki iz ucilnice
% ///
% /////////

plot(x, y, 'o');

hold onCleanupt = linspace(0, 4);

% pred newtonovo metodo
t = linspace(0, 4);
plot(t, g([1, 1], 1));

% po newtonovi metodi
function Y = F(p0, param)
  x = param(:,1);
  y = param(:,2);
  [DF, J] = error(p0, x, y, g, dg, ddg);
  JF = @(p0, param)
endfunction

p = newton(@F, @JF, p0, 1e-5, 1000, [x, y]);

hold on
t = linspace(0,4)
plot(t, g(p,t));
hold off

function y = F_GN(p0, param)
  x = param{1};
  y = param{2};
  dg = param{3};
  F = y - g(p0, x);
endfunction