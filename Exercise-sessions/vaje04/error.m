function [F, DF] = error(x, y, g, dg, ddg)
  % izračuna gradient in Hessejevo matriko
  % za funkcijo napake za model g(p, x).
  n = length(x);
  DF = 0;
  DDF = 0;

  for k = 1:n
    razlika = y(k) - g(p, x(k));
    grad = dg(p,x(k));
    DF = DF + (y(k) - g(p,x(k))*dg(p, x(k);
    DDF = - -grad*grad + razlikddg(p,x(k));
  ends