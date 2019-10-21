function mode = classifyMode(c, vec, k, debug)
    if nargin < 3, debug = false; end
    
    wavespeed = real(c);
    
    z = linspace(0,1)';
    phi = computePhi(z, vec);
    energy = computeEigenfunctionEnergy(z, phi, k);
    
    [maxPhi, maxPhiIndex] = max(phi);
    maxPhiLocation = z(maxPhiIndex);
    u = computeU(z, phi);
    [maxU, maxUIndex] = max(u);
    maxULocation = z(maxUIndex);
    v = computeV(k, phi);
    [maxV, maxVIndex] = max(v);
    maxVLocation = z(maxVIndex);
    [maxEnergy, maxEnergyIndex] = max(energy);
    maxEnergyLocation = z(maxEnergyIndex);
    
    if debug
        fprintf("Wavespeed: %g\n", wavespeed)
        fprintf("Maximum phi: %g\n", maxPhi)
        fprintf("Maximum phi Location: %g\n", maxPhiLocation)
        fprintf("Maximum u: %g\n", maxU)
        fprintf("Maximum u Location: %g\n", maxULocation)
        fprintf("Maximum v: %g\n", maxV)
        fprintf("Maximum v Location: %g\n", maxVLocation)
        fprintf("Maximum energy: %g\n", maxEnergy)
        fprintf("Maximum energy Location: %g\n", maxEnergyLocation)
    end
    
    if wavespeed > 1
        mode = [1, 0, 0]';
    elseif wavespeed < 1
        mode = [0, 1, 0]';
    else
        mode = [0, 0, 1]';
    end
    %if maxEnergyLocation == 1
    %    mode = [1, 0, 0]';
    %elseif maxEnergyLocation == 0
    %    mode = [0, 0, 1]';
    %else
    %    mode = [0, 1, 0]';
    %end
end
