%
% This is an example of Polcovar usage.  This is the same example as
% shown in the paper. 
%

% Adjacency matrix of a triangle
H = [ 0 1 1; 1 0 1; 1 1 0]

% Compute polynomials
r_mu = polcovar_mu(H)
r_sigma = polcovar_sigma(H, H)

% Evaluate polynomials for a graph with 1,000,000 nodes
n = 1000000
mu = polyval(r_mu(1,:) ./ r_mu(2,:), n)
sigma = polyval(r_sigma(1,:) ./ r_sigma(2,:), n)
sigma_stddev = sqrt(sigma)
