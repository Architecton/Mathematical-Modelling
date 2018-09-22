% function [res] = interpolationFunction(data, len)
% 
% Evaluates the interpolated function constructed from the unit square represented by data
% over len x len equaly spaced points from interval [0, 1] x [0, 1].

function [res] = interpolationFunction(data, len)
  % Create grid of x and y values on interval [0, 1] with dimensions len x len.
  x_pts = linspace(0, 1, len);
  y_pts = linspace(0, 1, len);
  [X, Y] = meshgrid(x_pts, y_pts);
  
  % Create a three dimensional matrix for easier visualization of the grid.
  % Each cell contains its x and y value.
  xy_grid = cat(3, X, Y);
  
  % Reshape grid to row vector and compute results.
  xy_grid = reshape(xy_grid, 1, [], 2);
  
  % Compute interpolating function.
  i_func = make_interpolation_function(data);
  
  % Compute interpolated values.
  for i = 1 : length(xy_grid)
    % Replace result with place occupied by the x dimension.
    xy_grid(1, i, 1) = i_func(xy_grid(1, i, 1), xy_grid(1, i, 2));
  end
  
  % Reshape xy_grid array back to square size
  xy_grid = reshape(xy_grid, len, len, 2);
  
  % extract matrix containing the results of applying the interpolation function.
  res = xy_grid(:, :, 1);
  
endfunction