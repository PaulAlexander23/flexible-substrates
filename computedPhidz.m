function dphidz = computedPhidz(z, vec)
    
    D = computeChebyshevDifferentiationMatrix(length(vec));
    
    Dvec = D * vec;
    
    dphidz = 2 * computePhi(z, Dvec);
    
end