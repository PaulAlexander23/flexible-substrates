function energy = computeEigenfunctionEnergy(k, z, phi)
    u = computeU(z, phi);
    v = computeV(k, phi);
    energy = 0.5 * (u.^2 + v.^2);
end
