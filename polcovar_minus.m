%
% Difference of polynomials
%
% RESULT 
%	r	r1 - r2
%

function r = polcovar_minus(r1, r2)

l1 = size(r1,2); 
l2 = size(r2,2); 

l = max(l1, l2); 

for i = 1 : l

    if l1 < l - i + 1
        r(:,i) = r2(l2 - (l - i));
    elseif l2 < l - i + 1
        r(:,i) = r1(l1 - (l - i));
    else
        r(:,i) = polcovar_minusf(r1(:, l1 - (l - i)), r2(:, l2 - (l - i)));
    end

end
