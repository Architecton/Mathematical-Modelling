% function [i_func] = make_interpolation_function(data)
% 
% The data matrix contains the required unit square data (see solution.pdf)
%
% The form of the matrix data is as follows:
%
% data = [a, dx_a, dy_a; 
%         b, dx_b, dy_b;
%         c, dx_c, dy_c;
%         d, dx_d, dy_d];
%
% where dx and dy represent derivative values in the x and y directions respectively

function [i_func] = make_interpolation_function(data)
  
  % Extract values from the data matrix.
  a = data(1, 1);
  dx_a = data(1, 2);
  dy_a = data(1, 3);
  b = data(2, 1);
  dx_b = data(2, 2);
  dy_b = data(2, 3);
  c = data(3, 1);
  dx_c = data(3, 2);
  dy_c = data(3, 3);
  d = data(4, 1);
  dx_d = data(4, 2);
  dy_d = data(4, 3);
  
  % Compute third degree polynomial p(x) with properties
  % p(0) = 1, p'(0) = 0, p(1) = 0, p'(1) = 0.
  %
  % Polynomial can be written as p(x) = ax^3 + bx^2 + cx + d.
  % It's derivative with respect to x is 3ax^2 + 2bx + c.
  % 
  % Pass required x values and set equal to result.
  % Solve resulting system of linear equations

  A = [0 0 0 1; 1 1 1 1; 0 0 1 0; 3 2 1 0];
  sol = [1; 0; 0; 0];
  coeff = A\sol;

  % The properties of this polynomial guarantee that the derivative values 
  % on the edges of the unit squares will match (will be zero)
  % See solution.pdf for a detailed explanation of the purpose of this polynomial. 

  % Compute weights.
  % See solution.pdf for a detailed explanation of what these functions do.
  weight_A = @(x, y) polyval(coeff, x)*polyval(coeff, y);
  weight_B = @(x, y) (1 - polyval(coeff, x))*polyval(coeff, y);
  weight_C = @(x, y) polyval(coeff, x)*(1 - polyval(coeff, y));
  weight_D = @(x, y) (1 - polyval(coeff, x))*(1 - polyval(coeff, y));

  % Compute auxilliary functions.
  % See solution.pdf for a detailed explanation of what these functions do.
  aux_A = @(x, y) a + dx_a.*x + dy_a.*y;
  aux_B = @(x, y) b + dx_b.*(x - 1) + dy_b.*y;
  aux_C = @(x, y) c + dx_c.*x + dy_c.*(y - 1);
  aux_D = @(x, y) d + dx_d.*(x - 1) + dy_d.*(y - 1);

  % Compute interpolated function on the given unit square
  % See solution.pdf for a detailed explanation of how this function works.
  i_func = @(x, y) aux_A(x, y) .* weight_A(x, y) + aux_B(x, y) .* weight_B(x, y) + aux_C(x, y) .* weight_C(x, y) + aux_D(x, y) .* weight_D(x, y);
  
  % this should be done for every unit square in the matrix of data we are trying to interpolate.
endfunction