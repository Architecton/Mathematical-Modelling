% function [slopes] = make_slopes_surf(F, d10F, d01F, G, d10G, d01G)
%
% This is a function that attains zero value when the distance vector between
% surfaces given by F and G is perpendicular to both tangent planes at points
% F(t, s) and G(u, v)
%
function [slopes] = make_slopes_surf(F, d10F, d01F, G, d10G, d01G)
   % make and return vector function  
   slopes = @(t, s, u, v) [ dot(F(t, s) - G(u, v), d10F(t, s));
							              dot(F(t, s) - G(u, v), d01F(t, s));
							              dot(F(t, s) - G(u, v), d10G(u, v));
							              dot(F(t, s) - G(u, v), d01G(u, v))
							];
endfunction

% FIRST ROW
% dot(F(t, s) - G(u, v), d10F(t, s))
%
% SECOND ROW
% dot(F(t, s) - G(u, v), d01F(t, s))
%
% THIRD ROW
% dot(F(t, s) - G(u, v), d10G(u, v))
%
% FOURTH ROW
% dot(F(t, s) - G(u, v), d01G(u, v))