function out = computeEigenvalues(method, params, modes, numberOfPolynomials)
    %COMPUTE_C_SWITCHBOARD Returns call to the method prescibed
    %   method = 
    %       "numerical" or "n" - numerical method,
    %       "longwave" or "l" - longwave solution,
    %       "zeroreynolds" or "z" - Zero Reynolds number solution.
    if nargin < 12
        numberOfPolynomials = 50;
    end
    
    out = nan(1,modes) + nan(1,modes)*1i;
    if (method == "numerical") || (method == "n")
        vec = computeNumerical(params.k,params.R,params.cotbeta,params.S,params.AD,params.AT,params.AB,params.AK,params.AI,numberOfPolynomials,modes);
    elseif (method == "longwave") || (method == "l")
        vec = computeLongWave(params.k,params.R,params.cotbeta,0,0,0,0,params.AK,0);
    elseif (method == "scaled longwave") || (method == "s")
        vec = computeLongWave(params.k,params.R,params.cotbeta,params.S*(params.k.^2),params.AD*(params.k),params.AT*(params.k.^2),params.AB*(params.k.^4),params.AK,params.AI*(params.k.^2));
    elseif (method == "zeroreynolds") || (method == "z")
        vec = computeZeroReynolds(params.k,params.cotbeta,params.S,params.AD,params.AT,params.AB,params.AK,params.AI);
    elseif (method == "zeroreynoldspoly") || (method == "p")
        vec = computeZeroReynoldsPolySolve(params.k,params.cotbeta,params.S,params.AD,params.AT,params.AB,params.AK);
    else
        error("Unknown method.");
    end
    out(1:min(modes,length(vec))) = vec(1:min(modes,length(vec)));
end
