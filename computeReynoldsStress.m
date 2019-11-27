function term2 = computeReynoldsStress(vec, params)
    z = linspace(0, 1)';
    dz = diff(z);
    
    phi = computePhi(z, vec);
    dphidz = computedPhidz(z, vec);
    
    mz = (z(2:end) + z(1:end-1))/2;
    mphi = (phi(2:end) + phi(1:end-1))/2;
    mdphidz = (dphidz(2:end) + dphidz(1:end-1))/2;
    
    term2 = -8*pi*params.R * sum((imag(mphi.*conj(mdphidz)).*(1-mz)) .* dz);
end