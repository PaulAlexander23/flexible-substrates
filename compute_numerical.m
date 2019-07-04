function [val, vec, residual] = compute_numerical(k,R,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials)
    if nargin < 10
        numberOfPolynomials = 50;
    end
    
    [val, vec, residual] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials);
    [val2, ~, ~] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials + 1);
    
    [val, index] = inBoth(val,val2,'AbsTol',1e-3,'RelTol',1e-3);
    
    if ~isempty(val)
        vec = vec(:,index);
        residual = residual(index);
    else
        val = nan(1);
    end
end