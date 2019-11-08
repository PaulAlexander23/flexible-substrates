function term2 = computeWallTerm2(k, c, z, phi, eta)
    dphidz = gradient(phi, z);

    z0LogicIndex = (z == 0);
    
    term2 = 4*pi*k*real((4*eta + dphidz(z0LogicIndex))*conj(c)*conj(eta));
end
