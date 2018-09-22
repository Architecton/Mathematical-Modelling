% function [y] = prediction(x, h)
% prediction: computes results y for the moving average model with n delays
% given input x and coefficients h.

function [y] = prediction(x, h)
  % Initialize empty matrices for storing the return value and a auxilliary
  % column vector for constructing the matrix A.
  A = [];
  next_column = [];
  
  % construct matrix A from x values.
  % the outer loop runs on [size(h)(2) - 1, 0].
  % (there are as many columns in A as there are coefficients h)
  % Sub represents the subtraction from current value of t.
  for sub = size(h)(2) - 1 : - 1 : 0
    % Inner loop runs on [size(h), size(x)].
    % It represents the current value of t.
    for k = size(h)(2) : size(x)(2)
      % Construct auxilliary column.
      next_column = [next_column; x(k - sub)];
    end
    % Add auxilliary column to matrix A.
    A = [A, next_column];
    % Prepare next_column matrix for next iteration (empty it).
    next_column = [];
  end
  
  % Multiply matrix A with column vector h to get solution y.
  y = A*h';
endfunction

% let n represent the number of coefficient h given and N the number of X data given
% We can compute N - n + 1 values of the y variable for the given input data
% The function prediction solves a system of linear equations A*h

% Construct matrix A with the characteristic "zig zag" pattern first solve the system
% as an ordinary system of linear equations

% compare the solution with the result returned by the prediction function

## test no. 1 ######################################################################
%!test
%!  n = 3;
%!  x = [1 4 2 6 9 7 6 8 9 7 6 5 6 1 4 8 3 1 4];
%!  constr_x = zeros(size(x)(2) - n + 1, n);
%!    for i = 1 : size(x)(2) - n + 1
%!      for j = 1 : n
%!       constr_x(i, j) = x(1, i + j - 1);
%!      end
%!    end
%!    h = [1.5; 2.4; 8.7];
%!    sol = constr_x*h;
%!    assert(prediction(x, h'), sol, 1e-15);
####################################################################################


## test no. 2 ######################################################################
%!test
%!  n = 5;
%!  x = [1 4 2 6 9 7 6 8 9 7 6 5 6 1 4 8 3 1 4 7 5 8 4 9 7 4 9 8 7 3 1 3 4 5 8 7 9 6 3 1 5 2 4 7 5 8 2 5 6 4 1];
%!  constr_x = zeros(size(x)(2) - n + 1, n);
%!    for i = 1 : size(x)(2) - n + 1
%!      for j = 1 : n
%!       constr_x(i, j) = x(1, i + j - 1);
%!      end
%!    end
%!    h = [5.20; 6.70; 3.14; 9.67; 7.12];
%!    sol = constr_x*h;
%!    assert(prediction(x, h'), sol, 1e-15);
####################################################################################