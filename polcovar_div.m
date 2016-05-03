%
% Division by an integer. 
%

function r = polcovar_div(r, a)

r(2,:) = a * r(2,:);
