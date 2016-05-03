%
% Evaluate a polynomial
%
% PARAMETERS 
%	r	Polynomial in n to evaluate
%	n	Value of n as a floating point number (i.e., not a
%		rational) 
%

function y = polcovar_eval(r, n)

y = polyval(r(1,:) ./ r(2,:), n); 

