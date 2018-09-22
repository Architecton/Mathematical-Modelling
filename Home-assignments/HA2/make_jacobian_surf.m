% function [Jslopes] = make_jacobian_surf(F, d01F, d10F, d11F, d02F, d20F, G, d01G, d10G, d11G, d02G, d20G)
%
% Computes the jacobian of the slopes function for parametric surfaces.
% See help for make_jacobian (for parametric curves) for more information. 
%
function [Jslopes] = make_jacobian_surf(F, d01F, d10F, d11F, d02F, d20F, G, d01G, d10G, d11G, d02G, d20G)
	Jslopes = @(t, s, u, v) [
	dot(F(t, s) - G(u, v), d11F(t, s)) + dot(d01F(t, s), d10F(t, s)), dot(F(t, s) - G(u, v), d20F(t, s)) + dot(d10F(t, s), d10F(t, s)), dot(-d10G(u, v), d10F(t, s)), dot(-d01G(u, v), d10F(t, s));

	dot(F(t, s) - G(u, v), d02F(t, s)) + dot(d01F(t, s), d01F(t, s)), dot(F(t, s) - G(u, v), d11F(t, s)) + dot(d10F(t, s), d01F(t, s)), dot(-d10G(u, v), d01F(t, s)), dot(-d01G(u, v), d01F(t, s));

	dot(d01F(t, s), d10G(u, v)), dot(d10F(t, s), d10G(u, v)), dot(F(t, s) - G(u, v), d20G(u, v)) + dot(-d10G(u, v), d10G(u, v)), dot(F(t, s) - G(u, v), d11G(u, v)) + dot(-d01G(u, v), d10G(u, v));

	dot(d01F(t, s), d01G(u, v)), dot(d10F(t, s), d01G(u, v)), dot(F(t, s) - G(u, v), d11G(u, v)) + dot(-d10G(u, v), d01G(u, v)), dot(F(t, s) - G(u, v), d02G(u, v)) + dot((-d01G(u, v)), d01G(u, v))
		];
endfunction

%	FIRST ROW - PARTIAL DERIVATIVES OF THE FIRST FUNCTION
% dot(F(t, s) - G(u, v), d11F(t, s)) + dot(d01F(t, s), d10F(t, s))
%	dot(F(t, s) - G(u, v), d20F(t, s)) + dot(d10F(t, s), d10F(t, s))
% dot(-d10G(u, v), d10F(t, s))
% dot(-d01G(u, v), d10F(t, s))

% SECOND ROW - PARTIAL DERIVATIVES OF THE SECOND FUNCTION
%	dot(F(t, s) - G(u, v), d02F(t, s)) + dot(d01F(t, s), d01F(t, s))
%	dot(F(t, s) - G(u, v), d11F(t, s)) + dot(d10F(t, s), d01F(t, s))
%	dot(-d10G(u, v), d01F(t, s))
%	dot(-d01G(u, v), d01F(t, s))

% THIRD ROW - PARTIAL DERIVATIVES OF THE THIRD FUNCTION
%	dot(d01F(t, s), d10G(u, v))
%	dot(d10F(t, s), d10G(u, v))
%	dot(F(t, s) - G(u, v), d20G(u, v)) + dot(-d10G(u, v), d10G(u, v))
%	dot(F(t, s) - G(u, v), d11G(u, v)) + dot(-d01G(u, v), d10G(u, v))

% FOURTH ROW - PARTIAL DERIVATIVES OF THE FOURTH FUNCTION
%	dot(d01F(t, s), d01G(u, v))
%	dot(d10F(t, s), d01G(u, v))
%	dot(F(t, s) - G(u, v), d11G(u, v)) + dot(-d10G(u, v), d01G(u, v))
% dot(F(t, s) - G(u, v), d02G(u, v)) + dot((-d01G(u, v)), d01G(u, v))