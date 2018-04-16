% function [d, t, s] = razdalja(F, G, t0, s0)
%
% This function returns the shortest distance between curves given by F and G
% and the parameters t and s at which the the distance between F(t) and G(s) is the
% shortest.
%
% F and G are function handles of the form:
% function [r, dr, ddr] = F(t) and
% function [r, dr, ddr] = G(s)
%
% t0 and s0 are initial estimates for the function parameters

function [d, t, s] = razdalja(F, G, t0, s0)
  % Compute function handles.
  F = @(t) F(t);
  dF = @(t) [~, res] = F(t);
  ddF = @(t) [~, ~, res] = F(t);
  G = @(s) G(s);
  dG = @(s) [~, res] = G(s);
  ddG = @(s) [~, ~, res] = G(s);

  % Compute the slopes function
  slopes = make_slopes(F, dF, G, dG);

  % Compute the Jacobian matrix
  Jslopes = make_jacobian(F, dF, ddF, G, dG, ddG);
  
  % Build vector of initial parameters.
  params_0 = [t0; s0];
  
  % Find the parameters at which the function value is minimum
  params = newton(slopes, Jslopes, 1.0E-13 , 1000000, params_0);
  
  % set computed parameters as function return values
  t = params(1);
  s = params(2);
  
  % Compute distance between curves four parameters returned by the newton method.
  d = norm(F(t) - G(s));
  
endfunction  
