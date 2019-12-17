function hydrodynamics = computeHydrodynamics(val, vec, params)
    eta = computeEta(val, vec);
    
    hydrodynamics = 8 * pi * params.cotbeta * imag(val) * abs(eta)^2;
end