function term2 = computeReynoldsStress(z, phi, params)    
    dz = diff(z);
    
    mdphidz = diff(phi)./dz;
    
    mz = (z(2:end) + z(1:end-1))/2;
    mphi = (phi(2:end) + phi(1:end-1))/2;
    
    term2 = -8*pi*params.R * sum((imag(mphi.*conj(mdphidz)).*(1-mz)) .* dz);
end
