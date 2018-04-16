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
  
  % If we are computing the solution for parametric curves 
  if length(t0) == 1
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
  % if computing solutiong for parametric surfaces
  else
    
    % function F evaluated at (u, v)
    F = @(t, s) F(t, s);
    
    % partial derivatives of all the coordinate functions of F with respect to t
    d10F = @(t, s) ([~, res] = F(t, s))(:, 1);
    
    % partial derivatives of all the coordinate functions of F with respect to s
    d01F = @(t, s) ([~, res] = F(t, s))(:, 2);
    
    % partial derivatives of all the coordinate functions of F with respect to t and s
    d11F = @(t, s) ([~, ~, res] = F(t, s))(:, 1, 2);
    
    % second partial derivatives of all the coordinate functions of F with respect to t
    d20F = @(t, s) ([~, ~, res] = F(t, s))(:, 1, 1);
    
    % second partial derivatives of all the coordinate functions of F with respect to s
    d02F = @(t, s) ([~, ~, res] = F(t, s))(:, 2, 2);
    
    % function G evaluated at (u, v)
    G = @(u, v) G(u, v);
    
    % derivatives of all the coordinate functions of G by u
    d10G = @(u, v) ([~, res] = G(u, v))(:, 1);
    
    % derivatives of all the coordinate functions of G by v
    d01G = @(u, v) ([~, res] = G(u, v))(:, 2);
    
    % partial derivatives of all the coordinate functions of F with respect to u and v
    d11G = @(u, v) ([~, ~, res] = G(u, v))(:, 1, 2);
    
    % second partial derivatives of all the coordinate functions of F with respect to t
    d20G = @(u, v) ([~, ~, res] = G(u, v))(:, 1, 1);
    
    % second partial derivatives of all the coordinate functions of F with respect to s
    d02G = @(u, v) ([~, ~, res] = G(u, v))(:, 2, 2);
    
    % compute the slopes function
    slopes = make_slopes_surf(F, d10F, d01F, G, d10G, d01G);
    % compute the Jacobian matrix for the slopes function
    Jslopes = make_jacobian_surf(F, d01F, d10F, d11F, d02F, d20F, G, d01G, d10G, d11G, d02G, d20G);
    
    % set initial parameters
    params_0 = [t0(1); t0(2); s0(1), s0(2)];
    
    % estimate solution using Newton's method    
    params = newton_surf(slopes, Jslopes, 1.0E-13, 1000000, params_0);
    
    % set output parameters t and s
    t = [params(1); params(2)];
    s = [params(3); params(4)];
    
    % compute the return distance 
    d = norm(F(params(1), params(2)), G(params(2), params(3)));
    
  end
  
endfunction  
