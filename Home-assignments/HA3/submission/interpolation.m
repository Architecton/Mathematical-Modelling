% function [] = interpolation(V, len)
%
% Computes and evaluates the interpolating function of the data in matrix V by individually
% interpolating the values in unit squares and pasting together the results of evaluating each
% unit square's interpolation function over equally spaced matrices of dimensions len x len
% with values from interval [0, 1] x [0, 1].
%
% The function plots both the initial data points and the interpolation results evaluations using the surf function.
%

function [] = interpolation(V, len)
  
  % Get sizes of matrix V
  V_x = size(V)(2);
  V_y = size(V)(1);
  
  % Save original V matrix for plot comparison
  V_original = V;
  
  % Pad edges with zeros (for derivative computations).
  V = [zeros(V_y, 1), V, zeros(V_y, 1)];
  V = [zeros(1, size(V)(2)); V; zeros(1, size(V)(2))];
  
  % Define empty matrix for matrix of interpolated values.
  res = [];
  
  % Go over all unit square rows.
  for i = 2:V_y
    
    % Define temp array for storing the current "row" of interpolated values.
    temp = [];
    
    % Go over all unit square columns.
    for j = 2 : V_x
      unit_square = [V(i,j), V(i, j + 1); V(i + 1, j), V(i + 1, j + 1)];
      
      % Construct data matrix.
      % Compute function values and derivative values.
      % The value of the derivative is the slope of the line between the neighboring points
      % in the derivative direction.
     
      % See solution.pdf for more details.
      a = V(i, j);
      b = V(i, j + 1);
      c = V(i + 1, j);
      d = V(i + 1, j + 1);
      dx_a = (V(i, j + 1) - V(i, j - 1))/2;
      dy_a = (V(i + 1, j) - V(i - 1, j))/2;
      dx_b = (V(i, j + 1 + 1) - V(i, j))/2;
      dy_b = (V(i + 1, j + 1) - V(i - 1, j + 1))/2;
      dx_c = (V(i + 1, j + 1) - V(i + 1, j - 1))/2;
      dy_c = (V(i + 1 + 1, j) - V(i, j))/2;
      dx_d = (V(i + 1, j + 2) - V(i + 1, j))/2;
      dy_d = (V(i + 1 + 1, j + 1) - V(i, j + 1))/2;
      
      % Create the data matrix for the unit square.
      data = [a, dx_a, dy_a; b, dx_b, dy_b; c, dx_c, dy_c; d, dx_d, dy_d];
      
      % Compute interpolating function evaluation values and add to temp matrix.
      temp = [temp, interpolationFunction(data, len)];
    end
    % Add new interpolating function evaluation values "row" to results matrix.
    res = [res; temp];
  end
  
  % Plot the original matrix (with surf command that uses linear interpolation)
  x = linspace(1, V_x, V_x);
  y = linspace(1, V_y, V_y);
  [X, Y] = meshgrid(x, y);
  surf(X, Y, V_original);
  xlabel('x');
  ylabel('y');
  zlabel('z');
  title('Matrix V - Interpolation Points');
  
  % Plot the matrix of values of the interpolating function evaluations (with surf command that uses linear interpolation)
  figure;
  x = linspace(1, V_x, size(res)(2));
  y = linspace(1, V_y, size(res)(1));
  [X, Y] = meshgrid(x, y);
  surf(X, Y, res);
  xlabel('x');
  ylabel('y');
  zlabel('z');
  title(sprintf('Matrix V - Unit Squares Interpolation Evaluated Over %d Equally Spaced Points', len ));
  
endfunction