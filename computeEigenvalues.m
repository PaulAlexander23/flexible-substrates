function out = computeEigenvalues(method, params, modes, numberOfPolynomials)
    if nargin < 4
        numberOfPolynomials = 50;
    end
    
    if (method == "numerical") || (method == "n")
        val = computeNumerical(params, numberOfPolynomials, modes);
    elseif (method == "longwave") || (method == "l")
        val = computeLongWave(params);
    elseif (method == "scaled longwave") || (method == "s")
        val = computeLongWaveScaled(params);
    elseif (method == "zeroreynolds") || (method == "z")
        val = computeZeroReynolds(params);
    elseif (method == "zeroreynoldspoly") || (method == "p")
        val = computeZeroReynoldsPolySolve(params);
    else
        error("Unknown method.");
    end
    
    out = nan(1,modes) + nan(1,modes)*1i;
    out(1:min(modes,length(val))) = val(1:min(modes,length(val)));
end
