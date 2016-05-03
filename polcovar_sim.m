%
% Simplification.
%

function r = polcovar_sim(r)

for i = 1 : size(r,2)

    r(:,i) = polcovar_simf(r(:,i)); 

end

while size(r,2) > 0 && r(1,1) == 0
    r = r(:,2:end);
end
