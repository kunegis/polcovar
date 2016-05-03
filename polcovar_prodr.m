%
% Product of two polynomials.
%

function r = polcovar_prodr(r1, r2)

l1 = size(r1,2);
l2 = size(r2,2); 

l = l1 + l2 - 1;

r = [ zeros(1,l) ; ones(1,l) ];

for i = 1 : l1
    for j = 1 : l2
        k = i + j - 1;
        r(:,k) = polcovar_sum(r(:,k), polcovar_prodf(r1(:,i), r2(:,j)));
    end
end

