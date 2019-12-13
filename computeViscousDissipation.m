function term1 = computeViscousDissipation(vec, params)
    N = length(vec);
    D = computeChebyshevDifferentiationMatrix(N);

    dydz = 2;
    Dvec = dydz * D * vec;
    D2vec = dydz * D * Dvec;
    
    integrand = computeChebyshevNorm(D2vec) ...
    	+ 2 * params.k^2 * computeChebyshevNorm(Dvec) ...
        + params.k^4 * computeChebyshevNorm(vec);
    
    I = computeChebyshevIntegrationMatrix(N^2);
    
    integral = I * integrand / dydz;
    
    integral = (computePhi(1, integral) - computePhi(0, integral)) ;
    
    term1 = - 4 * pi / params.k * integral;

end
