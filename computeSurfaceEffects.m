function workRate = computeSurfaceEffects(k, c, z, phi, h)
    dphidz = gradient(phi, z);
    d2phidz2 = gradient(dphidz, z);
    d2phidz2(1) = 2*d2phidz2(1);
    d2phidz2(end) = 2*d2phidz2(end);
    d2phidz2(2) = 4/3*d2phidz2(2);
    d2phidz2(end-1) = 4/3*d2phidz2(end-1);

    z1LogicIndex = (z == 1);
    
    term1 = 4*pi/k * real(conj(dphidz(z1LogicIndex)) * d2phidz2(z1LogicIndex));
    term2 = 4*pi*k * real((1 - c)*h*conj(dphidz(z1LogicIndex)));

    workRate = term1 + term2;
end
