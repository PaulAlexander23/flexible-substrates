function term2 = computeWallShear(k, z, phi)
    dphidz = gradient(phi, z);
    d2phidz2 = gradient(dphidz, z);
    d2phidz2(1) = 2*d2phidz2(1);
    d2phidz2(end) = 2*d2phidz2(end);
    d2phidz2(2) = 4/3*d2phidz2(2);
    d2phidz2(end-1) = 4/3*d2phidz2(end-1);
    
    z0LogicIndex = (z == 0);
    
    term2 = -4*pi/k * real(conj(dphidz(z0LogicIndex)) * d2phidz2(z0LogicIndex) ...
        + k^2 * dphidz(z0LogicIndex) * conj(phi(z0LogicIndex)));
end
