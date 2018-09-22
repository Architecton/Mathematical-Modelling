function Y = enacba(X)
  x = X(1);
  y = X(2);
  Y = [3*x^2*y - y^3; x^3 - 3*x*y^2 - 1]
  
  

% z anonimno funkcijo
% F = @(x) [3*x(1)^2*x(2) - x(2)^3; (x(1)^3*3*x(1)*x(2)^2 - 1];
% DF = @(x)[6*x(1)*x(2), 3*(x(1)^2 - x(2)^2); 3*(x(1)^2 - x(2)^2), -6*x(1)*x(2)]