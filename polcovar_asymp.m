%
% Test the asymptotic behavior of polcovar_sigma.
%

statistics = {'volume', 'twostars', 'triangles'};

k = length(statistics); 


[mx sx] = polcovar_musigmaeval(statistics, 34) 
stdmin34_d = sqrt(min(eig(sx)))

[mu_exp sigma_exp] = polcovar_musigma(statistics);

for n = floor(logspace(1, 6, 50))

    for i = 1:k
        for j = 1:k
            r = sigma_exp{i,j}; 
            sigma_exp_n(i,j) = polcovar_eval(r, n);
        end        
    end

    std_min = sqrt(min(eig(sigma_exp_n)));

    [m s] = polcovar_musigmaeval(statistics, n);
    stdmin = sqrt(min(eig(s))); 

    fprintf(1, '%10u %20g %20g\n', n, std_min, stdmin); 
end


