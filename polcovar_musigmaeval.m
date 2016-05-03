%
% Generate the mean and covariance vector/matrix for the normal
% approximation to the distribution of a vector of count statistics. 
%
function [mu_exp sigma_exp] = polcovar_musigmaeval(statistics, n)

patterns = konect_patterns(); 

for i = 1 : length(statistics)
    statistic = statistics{i}; 
    H = patterns.(statistic);
    mu_exp(1,i) = polcovar_eval(polcovar_mu(H), n); 
end

for i = 1 : length(statistics)
    statistic_i = statistics{i}; 
    Hi = patterns.(statistic_i);
    for j = i : length(statistics)
        statistic_j = statistics{j}; 
        Hj = patterns.(statistic_j); 

        sigma_exp(i,j) = polcovar_eval(polcovar_sigma(Hi, Hj), n);
        sigma_exp(j,i) = sigma_exp(i,j); 
    end
end
