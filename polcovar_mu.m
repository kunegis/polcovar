%
% The expected value of the distribution of the count of H in a
% random graph of n nodes, as a polynomial of n.
%
% PARAMETERS 
% 	H	(k*k) Adjacency matrix of the subgraph H
%
% RESULT 
%	r	(2*[m+1]) Coefficients of the polynomials; entry
%		ret(:,i) is the factor for n^(m+1-i) as a fraction 
%

function r = polcovar_mu(H)

k = size(H, 1); 
l = nnz(H) / 2; 

a = polcovar_auto(H); 

r = polcovar_coeff(k, a, l);
