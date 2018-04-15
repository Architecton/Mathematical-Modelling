% function [k] = slopes(s, t, F, df, G, dG)

% The function returns the slopes of the vector r between F(t) and G(s) and the tangent lines
% to the curves at F(t) and G(s).

% The result k is a 2x1 vector. The component at (1, 1) contains the slope with the tangent
% at F(t) and the component (2, 1) the slope with the tangent at G(s)

% This function attains zero value when the distance vector is perpendicular to both tangent lines

function [k] = slopes(s, t, F, df, G, dG)
	k = @(t, s) [ dot(( F(t) - G(s) ) , dF(t) ) ; dot(( F(t) - G(s) ), dG(s)) ]
endfunction