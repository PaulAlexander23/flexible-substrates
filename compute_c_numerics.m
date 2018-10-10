function c = compute_c_numerics(k,R,cotbeta,S,AD,AT,AB,AK)
    
    [~,eigenvalues] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK);
    %[~,I] = max(imag(eigenvalues));
    [~,I] = sort(-imag(eigenvalues));
    c = eigenvalues(I(1:4));
    
end