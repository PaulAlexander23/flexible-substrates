function energy = computeFluidEffects(k, z, phi, params)
    dz = diff(z);

    mz = (z(2:end) + z(1:end-1))/2;
    mphi = (phi(2:end) + phi(1:end-1))/2;

    dphidz = diff(phi)./dz;
    d2phidz2 = gradient(dphidz, mz);
    
    term1 = -4*pi/k * sum((abs(d2phidz2).^2 + 2*k^2*abs(dphidz).^2 + k^4*abs(mphi).^2) .* dz);
    term2 = -8*pi*params.R * sum((imag(mphi.*conj(dphidz)).*(1-mz)) .* dz);

    energy = term1 + term2;
end