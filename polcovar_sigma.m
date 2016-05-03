%
% Compute the factors of the polynomial (in function of n) which
% equals the covariance of two count statistics.  
%
% Let H_1 and H_2 be two (typically small graphs) which we want to count
% in larger graphs.  Consider the counts of both graphs within a random
% Erdős--Rényi graph on n nodes with parameter 1/2 (i.e., each edge
% exists with probability p = 1/2).  The covariance of both variables is
% then a polynomial in n.
%
% When the same graph is given as input, the result is the variance
% of the corresponding count statistic.
%
% The returned polynomial has degree m < k_1 + k_2, where k_1 and k_2
% are the number of nodes in H_1 and H_2. 
%
% The input graphs matrices must be symmetric and have zero diagonals. 
%
% PARAMETERS 
%	H1, H2	(k1*k1, k2*k2) Adjacency matrices of both graphs; if
%		H2 is not given, it is taken to be equal to H1, in
%		which case the function returns the variance of the
%		corresponding count statistic; both matrices must be
%		symmetric 
%
% RESULT 
%	r	(2*[m+1]) Cofficients of the polynomial; entry r(:,i) is
%		the factor for n^(m+1-i) as a fraction 
%
% PERFORMANCE 
%	Runtime:	Theta(k1! k2! min(k1,k2))
%	Memory:		Theta(k1! + k2!)
%

function r = polcovar_sigma(H1, H2)

if ~exist('H2', 'var')
    H2 = H1; 
end

% The adjacency matrices are quadratic 
assert(size(H1,1) == size(H1,2)); 
assert(size(H2,1) == size(H2,2)); 

% The adjacency matrices have zero diagonals
assert(sum(diag(H1) ~= 0) == 0);
assert(sum(diag(H2) ~= 0) == 0);

k1 = size(H1, 1);
k2 = size(H2, 2);

assert(k1 > 0);
assert(k2 > 0);

% Both patterns are symmetric 
assert(sum(sum(H1 ~= H1')) == 0);
assert(sum(sum(H2 ~= H2')) == 0); 

l1 = nnz(H1) / 2;
l2 = nnz(H2) / 2; 

a1 = polcovar_auto(H1);
a2 = polcovar_auto(H2); 

perms1 = perms(1:k1);
perms2 = perms(1:k2); 

r = [0 ; 1]; 

% i is the number of nodes that overlap between the two patterns   
for i = 0 : min(k1, k2)

    % Inner sum in units of 2^-(l1 + l2)
    count = 0;
        
    for j1 = 1 : size(perms1, 1)

        p1 = perms1(j1, :);
        P1 = H1(p1, p1); 
        
        for j2 = 1 : size(perms2, 1)

            p2 = perms2(j2, :);
            P2 = H2(p2, p2); 

            Q = P1;
            Q(k1+k2-i, k1+k2-i) = 0;
            Q(k1-i+1 : end, k1-i+1 : end) = Q(k1-i+1 : end, k1-i+1 : end) | P2; 
            c = nnz(Q) / 2;
            assert (c <= l1 + l2);
            count = count + 2^(l1 + l2 - c); 

        end
    end

    r = polcovar_sum(r, polcovar_prod(...
        polcovar_coeff(k1+k2-i, factorial(i) * factorial(k1-i) * factorial(k2-i), ...
                       l1+l2), count));
            
end

r = polcovar_div(r, a1 * a2); 

mu1 = polcovar_mu(H1);
mu2 = polcovar_mu(H2);
r = polcovar_minus(r, polcovar_prodr(mu1, mu2));
r = polcovar_sim(r);
