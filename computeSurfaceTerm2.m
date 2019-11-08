function term2 = computeSurfaceTerm2(k, c, z, phi, h)
    dphidz = gradient(phi, z);
    z1LogicIndex = (z == 1);
    
    term2 = 4*pi*k * real((1 - c)*h*conj(dphidz(z1LogicIndex)));
end
