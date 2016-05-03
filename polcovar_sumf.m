
function r = polcovar_sumf(r1, r2)

r = polcovar_simf([r1(1,1) * r2(2,1) + r1(2,1) * r2(1,1); r1(2,1) * r2(2,1)]);
