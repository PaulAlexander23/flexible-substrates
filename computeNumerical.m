function [val, vec, residual] = computeNumerical(params, numberOfPolynomials, modes)
    
    [val, vec, residual] = chebyshevTauFlexibleOS(params, numberOfPolynomials);
    [val2, ~, ~] = chebyshevTauFlexibleOS(params, numberOfPolynomials + 1);
    
    [~, index] = inBoth(val,val2,'AbsTol',1e-3,'RelTol',1e-3);
    logicIndex = zeros(size(val));
    logicIndex(index) = 1;
    val(~logicIndex) = nan;
    vec(:, ~logicIndex) = nan;
    residual(~logicIndex) = nan;
    
    if nargin>2
        temp = nan(1,modes) + nan(1,modes)*1i;
        temp(1:min(modes,length(val))) = val(1:min(modes,length(val)));
        val = temp;

        temp = nan(2 * (3 + numberOfPolynomials),modes) + nan(2 * (3 + numberOfPolynomials),modes)*1i;
        temp(:,1:min(modes,length(val))) = vec(:,1:min(modes,length(val)));
        vec = temp;

        temp = nan(1,modes) + nan(1,modes)*1i;
        temp(1:min(modes,length(val))) = residual(1:min(modes,length(val)));
        residual = temp;
    end
end
