function c = compute_c_numerics(k,R,cotbeta,S,AD,AT,AB,AK)
    
    [~,eigenvalues] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK);
    [~,I] = max(imag(eigenvalues));
    c = eigenvalues(I);
    
end