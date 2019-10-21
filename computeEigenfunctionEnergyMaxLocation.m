function maxEnergyLocation = computeEigenfunctionEnergyMaxLocation(k, vec)
    z = linspace(-1,1,200)';
    phi = compute_phi(z, vec);
    [maxPhi, maxPhiIndex] = max(phi);
    maxPhiLocation = z(maxPhiIndex);
    
    energy = computeEigenfunctionEnergy(k, z, phi);
    
    figure;
    plot(z, energy);
    
    [maxEnergy, maxEnergyIndex] = max(energy);
    maxEnergyLocation = z(maxEnergyIndex)/2 + 0.5;
end
