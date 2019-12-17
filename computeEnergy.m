function energy = computeEnergy(val, vec, params)
    N = length(vec);
    
    D = computeChebyshevDifferentiationMatrix(N);

    dydz = 2;
    Dvec = dydz * D * vec;
    
    integrand = computeChebyshevNorm(Dvec) / params.k ...
        + computeChebyshevNorm(vec) * params.k;
    I = computeChebyshevIntegrationMatrix(length(integrand));
    
    integral = I * integrand / dydz;
    kinetic = params.R * computePhi(1, integral) - computePhi(0, integral);
    
    eta = computeEta(val, vec);
    
    wall = (params.AI * params.k * abs(val)^2 + params.AT * params.k + ...
        params.AB * params.k^3 + params.AK / params.k) ...
        * abs(eta)^2;
    
    h = computeH(val, vec);
    
    surface = (params.S * params.k + 2 * params.cotbeta / params.k) * abs(h)^2;
    
    energy = 2 * pi * (kinetic + wall + surface);
end
