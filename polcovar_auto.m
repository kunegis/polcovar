%
% Compute the size of the automorphism group of a graph.
%

function a = polcovar_auto(H)

k = size(H, 1); 

a = 0; 

p = perms(1 : k);

for i = 1 : size(p, 1)

    p_i = p(i,:);
    Q = H(p_i, p_i);

    if 0 == sum(sum(Q ~= H))
        a = a + 1;
    end

end

