function [val, vec, residual] = compute_numerical(k,R,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials)
    if nargin < 10
        numberOfPolynomials = 50;
    end
    
    [val, vec, residual] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials);
end