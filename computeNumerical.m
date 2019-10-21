function [val, vec, residual] = computeNumerical(k,R,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials,modes)
    
    [val, vec, residual] = chebyshevTauFlexibleOS(k,R,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials);
    [val2, ~, ~] = chebyshevTauFlexibleOS(k,R,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials + 1);
    
    [~, index] = inBoth(val,val2,'AbsTol',1e-3,'RelTol',1e-3);

    logicIndex = zeros(size(val));
    logicIndex(index) = 1;
    
    val(~logicIndex) = nan;
    vec(:, ~logicIndex) = nan;
    residual(~logicIndex) = nan;
end
