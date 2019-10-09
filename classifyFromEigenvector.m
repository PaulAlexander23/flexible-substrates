function type = classifyFromEigenvector(k, vec, modes)
    z = linspace(0,1)';
    type = zeros(1, modes);
    for modeIndex = 1:min([modes, find(isnan(vec(1,:)))])
        phi = compute_phi(z, vec(:,modeIndex));
        energy = computeEigenfunctionEnergy(k, z, phi);
        
        [~, maxEnergyIndex] = max(energy);
        maxEnergyLocation = z(maxEnergyIndex);
        
        if maxEnergyLocation == 1
            type(modeIndex) = 1; % Surface mode
        elseif maxEnergyLocation == 0
            type(modeIndex) = 3; % Wall mode
        else
            type(modeIndex) = 2; % Shear mode
        end
    end
end
