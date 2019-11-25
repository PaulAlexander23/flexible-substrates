function d2phidz2 = computed2Phidz2(z, vec)
    
    D = computeChebyshevDifferentiationMatrix(length(vec));
    
    Dvec = D^2 * vec;
    
    dydx = 2;
    d2phidz2 = dydx^2 * computePhi(z, Dvec);
    
end