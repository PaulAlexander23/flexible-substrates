function mode = classifyModeFromScratch(params, modeRank, debug)
    if nargin < 3, debug = false; end
    
    if isstruct(params)
        mode = classifyModeSingle(params, modeRank, debug);
    elseif iscell(params)
        N = length(params);
        mode = zeros(3, N);
        for n = 1:N
            mode(:,n) = classifyModeSingle(params{n}, modeRank, debug);
        end
    end
end

function mode = classifyModeSingle(params, modeRank, debug)
    numberOfPolynomials = 80;
    
    [val, vec] = computeNumerical(params.k, params.R, ...
        params.cotbeta, params.S, params.AD, params.AT, params.AB, ...
        params.AK, params.AI, numberOfPolynomials);
    
    mode = classifyMode(val(modeRank), vec(:, modeRank), params.k);
end
