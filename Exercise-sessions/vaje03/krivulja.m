% Funkcija poisce ocke na krivulji, ki je podana implicitno z enacbo f(x, y) = 0,
% tako, da so sosednje tocke oddaljene za d
function K = krivulja(f, gradf, T0, d, n)
  K = zeros(2, n);
  % zacetna tocka
  g = gradf(T0);
  F = @(x) [g(1)*(x(2) - T0(2)) - g(2)*(x(1)-T0(1)); f(x)];
  DF = @(x) [[0 -1; 1 0]*gradf(x) gradf(x)];
  K(:, 1) = newton(F, DF, T0, 1e-10, 100);

  % tocka na krivulji
  smer = rand(2,1)*d;
  for i = 1:(n - 1)
    T0 = K(:, i); % zacetna tocka
    F = @(x) [(x(1)-T0(1))^2+(x(1)-T0(2))^2-d^2; f(x)];
    DF = @(x) [2*(x(1) - t0(1)), 2*(x(2)-T0(2)); gradf(x)'];
    % zacetni priblizek
    K(:, i+1) = newton(F, DF, T0 + smer, 1e-10, 100);
    smer = K(:, i+1)-K(:,i);
  end