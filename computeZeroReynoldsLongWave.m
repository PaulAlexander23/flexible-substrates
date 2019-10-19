function out = computeZeroReynoldsLongWave(k, cotbeta, AD)
    %COMPUTE_ZERO_REYNOLDS Given required parameters, returns eigenvalue c
    %from the zero Reynolds number analysis
    
    out = [1 + 1./AD + (-4./3 .* AD .* cotbeta .^ 2 + (AD - 1).^2).^(1./2) ./ AD, ...
        1 + 1./AD - (-4./3 .* AD .* cotbeta .^ 2 + (AD - 1).^2).^(1./2) ./ AD];
    
    out = out + 0*k';
    
    for j = 1:size(out,1)
        [~,index] = sort(imag(out(j,:)), 2, 'descend');
        out(j,:) = out(j,index);
    end
end