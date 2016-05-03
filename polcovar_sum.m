
function r = polcovar_sum(r1, r2)

if size(r1,2) > size(r2,2)
    d = size(r1,2) - size(r2,2);
    r2 = [[ zeros(1,d); ones(1,d) ] r2];
end

if size(r2,2) > size(r1,2)
    d = size(r2,2) - size(r1,2);
    r1 = [[ zeros(1,d); ones(1,d) ] r1];
end

for i = 1 : size(r1,2)
    r(1:2,i) = polcovar_sumf(r1(1:2,i), r2(1:2,i)); 
end
