% function [x, it] = newton(funct, der_funct, x0, tolerance, max_iterations)
% finds approximation for F(x) = 0 using the Newton-Raphson method
function [x, it] = newton(funct, der_funct, x0, tolerance, max_iterations)
  % iterate a maximum of max_it times
  for it = 1:max_iterations
    % solve for next x
    x = x0 - der_funct(x0)\funct(x0);
    % if reached inside tolerance, return
    if norm(x - x0) < tolerance
      return
    end
    % repeat from current x
    x0 = x;
  end
end

% test for approximating the root of sqrt(2)
% choose a function that has root at sqrt(2) 
%!test
%! f = @(x) x^2 - 2; 
%! df = @(x) 2*x;
%! [x, it] = newton(f, df, 2, 1e-10, 100)
%! assert(x, sqrt(2), 2e-10)
%! assert(it < 10);