% function [params, num_it] = newton(slopes, Jslopes, tolerance, max_it, params_0)
%
% Approximates the root of the function slopes. Finds parameters t and s for which
% the value of the function slopes is approximately [0, 0].

function [params, num_it] = newton_surf(slopes, Jslopes, tolerance, max_it, params_0)
  % Set parameters to initial parameters
  params = params_0;
  % iterate max_it times
  for it = 1:max_it
    % Newton iteration step
    params = params - pinv(Jslopes(params(1), params(2), params(3), params(4)))*slopes(params(1), params(2), params(3), params(4));
    % if difference between old and new parameters is small enough
    if norm(params - params_0) < tolerance
      break
    endif
    % set old parameters to current parameters
    params_0 = params;
  endfor
  % save number of iterations performed
  num_it = it;
endfunction