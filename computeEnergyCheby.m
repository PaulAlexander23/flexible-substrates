function energy = computeEnergy(val, vec, params)
    N = length(vec);
    
    D = computeChebyshevDifferentiationMatrix(N);

    dydz = 2;
    Dvec = dydz * D * vec;
    
    integrand = computeChebyshevProduct(Dvec, Dvec) / params.k ...
        + computeChebyshevProduct(vec,vec) * params.k;
    I = computeChebyshevIntegrationMatrix(length(integrand));
    
    integral = I * integrand;
    kinetic = params.R * computePhi(1, integral) - computePhi(0, integral);
    
    
    dz = diff(z);
    dzRescaled = diff(2*z-1);
    dphi = diff(phi);
    mphi = (phi(2:end) + phi(1:end-1))/2;
    integrand = abs(dphi./dzRescaled).^2 / k + abs(mphi).^2 * k;
    
    kinetic = params.R * sum(integrand .* dz);
    wall = (params.AI*k*abs(c).^2 + params.AT*k + params.AB*k^3 + params.AK/k - 2 * params.cotbeta / k)*abs(eta).^2;
    surface = (params.S * k - 2 * params.cotbeta / k) * abs(h).^2;
    
    energy = 2 * pi * (kinetic + wall + surface);
end
