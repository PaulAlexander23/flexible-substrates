function Nvec = computeChebyshevNorm(vec)
    
    Nvec = computeChebyshevProduct(real(vec), real(vec)) ...
        + computeChebyshevProduct(imag(vec), imag(vec));
    
end