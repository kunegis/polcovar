%
% PARAMETERS 
%	r	Polynomial
%	a	Integer
%

function r = polcovar_prod(r, a)

r(1,:) = a * r(1,:);
