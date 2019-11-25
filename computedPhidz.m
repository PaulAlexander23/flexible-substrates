function dphidz = computedPhidz(z, vec)
    
    D = computeChebyshevDifferentiationMatrix(length(vec));
    
    Dvec = D * vec;
    
    dydx = 2;
    dphidz = dydx * computePhi(z, Dvec);
    
end