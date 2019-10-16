function energy = computeEigenfunctionEnergy(z, phi, k)
    u = computeU(z, phi);
    v = computeV(k, phi);
    energy = 0.5 * (u.^2 + v.^2);
end
