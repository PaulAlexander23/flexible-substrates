function energy = computeFluidEffects(k, c, z, phi, params)
    dz = diff(z);

    mz = (z(2:end) + z(1:end-1))/2;
    mphi = (phi(2:end) + phi(1:end-1))/2;

    dphidz = diff(phi)./dz;
    d2phidz2 = gradient(dphidz, z);

    term1 = -2*pi/k * sum((2*abs(d2phidz2).^2 + 4*k^2*abs(dphidz).^2 + 2*k^4*abs(mphi).^2) .* dz);
    term2 = -8*pi*params.R * sum((imag(c*mphi.*conj(dphidz)).*(1-mz)) .* dz);

    energy = term1 + term2;
end
