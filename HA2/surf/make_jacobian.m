% function [J] = make_jacobian(F, dF, ddF, G, dG, ddG)
%
% Function for creating a Jacobian matrix of the slopes vector function.
% The resulting matrix Jslopes is a Jacobian matrix of the vector function slopes
% containing the appropriate function handle arithmetics
%
% F, dF, G and dG should be function handles. F = @(t) F(t); dG = @(s) [~, res] = G(s); and so on.

function [Jslopes] = make_jacobian(F, dF, ddF, G, dG, ddG)
	Jslopes = @(t, s) [dot(( F(t) - G(s) ), ddF(t)) + dot( dF(t), dF(t) ), dot( -dG(s), dF(t)); 
                      dot(dF(t), dG(s)), dot( (F(t) - G(s)), ddG(s) ) + dot( -dG(s), dG(s) ) ];
endfunction