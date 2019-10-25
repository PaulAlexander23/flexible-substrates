function workRate = computeWallEffects(k, c, z, phi, eta, params)
    dphidz = gradient(phi, z);

    term1 = -4*pi*k*params.AD*abs(c)^2*abs(eta)^2;
    term2 = -4*pi*k*(eta-dphidz(find(z==0)))*conj(c*eta);

    workRate = term1 + term2;
end
