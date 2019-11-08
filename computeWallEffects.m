function workRate = computeWallEffects(k, c, z, phi, eta, params)
    dphidz = gradient(phi, z);

    z0LogicIndex = (z == 0);
    
    term1 = -4*pi*k*params.AD*abs(c)^2*abs(eta)^2;
    term2 = 4*pi*k*real((4*eta + dphidz(z0LogicIndex))*conj(c)*conj(eta));

    workRate = term1 + term2;
end
