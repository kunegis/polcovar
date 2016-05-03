%
% Simplify a fraction
%

function f = polcovar_simf(f)

if f(1) == 0
    f(2) = 1;
    return;
end

i = 2; 
while i <= min(abs(f))

    if f(1) / i == floor(f(1) / i) && f(2) / i == floor(f(2) / i)
        f = f / i; 
        continue;
    end
    
    i = i+1; 
end

