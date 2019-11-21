function term1 = computeSurfaceShear(k, z, phi)
    dphidz = gradient(phi, z);
    d2phidz2 = gradient(dphidz, z);
    d2phidz2(1) = 2*d2phidz2(1);
    d2phidz2(end) = 2*d2phidz2(end);
    d2phidz2(2) = 4/3*d2phidz2(2);
    d2phidz2(end-1) = 4/3*d2phidz2(end-1);

    z1LogicIndex = (z == 1);
    
    term1 = 4*pi/k * real(conj(dphidz(z1LogicIndex)) * d2phidz2(z1LogicIndex) ...
        + k^2 * dphidz(z1LogicIndex) * conj(phi(z1LogicIndex)));
end