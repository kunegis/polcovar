%
% Return n^{k_} / a / 2^l as a polynomial in n. 
%

function r = polcovar_coeff(k, a, l)

r = [ 1 ; 1 ]; 

for i = 0 : k - 1

    r = polcovar_sum([r [0 ; 1]], polcovar_prod(r, -i));

end

c = a * 2^l;

r(2,:) = c * r(2,:);

r = polcovar_sim(r); 