% function [k] = slopes(s, t, F, dF, G, dG)
%
% The function returns the vector function slopes that returns the slopes 
% of the vector r between F(t) and G(s) and the tangent lines to the curves at F(t) and G(s).
%
% of the function slopes
% The result of the function slopes is a 2x1 vector. 
% The component at (1, 1) contains the slope with the tangent at F(t) and the component 
% (2, 1) the slope with the tangent at G(s).
%
% The function slopes attains zero value when the distance vector is perpendicular to both tangent lines
%
% F, dF, G and dG should be function handles. F = @(t) F(t); dG = @(s) [~, res] = G(s); and so on.
function [slopes] = make_slopes(F, dF, G, dG)
	slopes = @(t, s) [ dot(( F(t) - G(s) ) , dF(t) ) ; dot(( F(t) - G(s) ), dG(s)) ];
endfunction