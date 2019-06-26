function out = compute_c_switchboard(method, k,R,cotbeta,S,AD,AT,AB,AK,AI,modes)
    %COMPUTE_C_SWITCHBOARD Returns call to the method prescibed
    %   method = 
    %       "numerical" or "n" - numerical method,
    %       "longwave" or "l" - longwave solution,
    %       "zeroreynolds" or "z" - Zero Reynolds number solution.
    out = nan(1,modes) + nan(1,modes)*1i;
    if (method == "numerical") || (method == "n")
        vec = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI);
    elseif (method == "longwave") || (method == "l")
        vec = compute_long_wave(k,R,cotbeta,0,0,0,0,AK,0);
    elseif (method == "scaled longwave") || (method == "s")
        vec = compute_long_wave(k,R,cotbeta,S*(k.^2),AD*(k),AT*(k.^2),AB*(k.^4),AK,AI*(k.^2));
    elseif (method == "zeroreynolds") || (method == "z")
        vec = compute_zero_reynolds(k,cotbeta,S,AD,AT,AB,AK,AI);
    elseif (method == "zeroreynoldspoly") || (method == "p")
        vec = compute_zero_reynolds_poly_solve(k,cotbeta,S,AD,AT,AB,AK);
    else
        error("Unknown method.");
    end
    out(1:min(modes,length(vec))) = vec(1:min(modes,length(vec)));
end
