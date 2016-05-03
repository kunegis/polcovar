%
% Generate the mean and covariance vector/matrix for the normal
% approximation to the distribution of a vector of count statistics. 
%
% Return polynomials in n, stored as cell array and matrices. 
%

function [mu_exp sigma_exp] = polcovar_musigma(statistics)

patterns = konect_patterns(); 

k = length(statistics); 

for i = 1 : k
    statistic = statistics{i}; 
    H = patterns.(statistic);
    mu_exp{1,i} = polcovar_mu(H);
end

for i = 1 : k
    statistic_i = statistics{i}; 
    Hi = patterns.(statistic_i);
    for j = i : k
        statistic_j = statistics{j}; 
        Hj = patterns.(statistic_j); 

        sigma_exp{i,j} = polcovar_sigma(Hi, Hj);
        sigma_exp{j,i} = sigma_exp(i,j); 
    end
end

for i = 1:k
    for j = 1 : i
        sigma_exp{i,j} = sigma_exp{i,j}{1}; 
    end
end