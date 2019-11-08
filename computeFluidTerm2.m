function term2 = computeFluidTerm2(z, phi, params)
    dz = diff(z);
    mz = (z(2:end) + z(1:end-1))/2;
    
    mphi = (phi(2:end) + phi(1:end-1))/2;
    dphidz = diff(phi)./dz;
    
    term2 = -8*pi*params.R * sum((imag(mphi.*conj(dphidz)).*(1-mz)) .* dz);
end
