function [val, vec, residual] = computeNumerical(k,R,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials)
    
    [val, vec, residual] = chebyshevTauFlexibleOS(k,R,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials);
    [val2, ~, ~] = chebyshevTauFlexibleOS(k,R,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials + 1);
    
    [val, index] = inBoth(val,val2,'AbsTol',1e-3,'RelTol',1e-3);
    
    if ~isempty(val)
        vec = vec(:,index);
        residual = residual(index);
    else
        val = nan(1);
    end
end
