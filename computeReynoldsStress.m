function reynoldsStress = computeReynoldsStress(vec, params)    
    N = length(vec);
    
    D = computeChebyshevDifferentiationMatrix(N);

    dydz = 2;
    Dvec = dydz * D * vec;
    
    integrand = imag(computeChebyshevProduct(vec, conj(Dvec)));
    integrand = computeChebyshevProduct(integrand, [1,-1]');
    
    I = computeChebyshevIntegrationMatrix(2*N^2);
    
    integral = I * integrand;
    computePhi(1, integral)
    computePhi(0, integral)
    integral = computePhi(1, integral) - computePhi(0, integral);
    
    reynoldsStress = - 8 * pi * params.R * integral;
    
end
