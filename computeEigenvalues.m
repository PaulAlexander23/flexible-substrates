function out = computeEigenvalues(method, params, modes, numberOfPolynomials)
    if nargin < 12
        numberOfPolynomials = 50;
    end
    
    if (method == "numerical") || (method == "n")
        val = computeNumerical(params.k,params.R,params.cotbeta,params.S,params.AD,params.AT,params.AB,params.AK,params.AI,numberOfPolynomials,modes);
    elseif (method == "longwave") || (method == "l")
        val = computeLongWave(params.k,params.R,params.cotbeta,0,0,0,0,params.AK,0);
    elseif (method == "scaled longwave") || (method == "s")
        val = computeLongWave(params.k,params.R,params.cotbeta,params.S*(params.k.^2),params.AD*(params.k),params.AT*(params.k.^2),params.AB*(params.k.^4),params.AK,params.AI*(params.k.^2));
    elseif (method == "zeroreynolds") || (method == "z")
        val = computeZeroReynolds(params.k,params.cotbeta,params.S,params.AD,params.AT,params.AB,params.AK,params.AI);
    elseif (method == "zeroreynoldspoly") || (method == "p")
        val = computeZeroReynoldsPolySolve(params.k,params.cotbeta,params.S,params.AD,params.AT,params.AB,params.AK);
    elseif (method == "zeroreynoldslongwave") || (method == "zl")
        val = computeZeroReynoldsLongWave(params.k,params.cotbeta,params.AD);
    else
        error("Unknown method.");
    end
    
    out = nan(1,modes) + nan(1,modes)*1i;
    out(1:min(modes,length(val))) = val(1:min(modes,length(val)));
end
