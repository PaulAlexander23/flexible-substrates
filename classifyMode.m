function mode = classifyMode(params, modeRank, debug)
    if nargin < 3, debug = false; end
    
    if isstruct(params)
        mode = classifyModeSingle(params, modeRank, debug);
    elseif iscell(params)
        N = length(params);
        mode = zeros(3, N);
        for n = 1:N
            mode(:,n) = classifyModeSingle(params{n}, modeRank, debug);
        end
    end
end

function mode = classifyModeSingle(params, modeRank, debug)
    numberOfPolynomials = 80;
    
    [val, vec] = computeNumerical(params.k, params.R, ...
        params.cotbeta, params.S, params.AD, params.AT, params.AB, ...
        params.AK, params.AI, numberOfPolynomials);
    
    wavespeed = real(val(modeRank));
    
    z = linspace(0,1)';
    phi = compute_phi(z, vec(:,modeRank));
    [maxPhi, maxPhiIndex] = max(phi);
    maxPhiLocation = z(maxPhiIndex);
    
    energy = computeEigenfunctionEnergy(params.k, z, phi);
    [maxEnergy, maxEnergyIndex] = max(energy);
    maxEnergyLocation = z(maxEnergyIndex);
    
    if debug
        fprintf("Wavespeed: %g\n", wavespeed)
        fprintf("Maximum phi: %g\n", maxPhi)
        fprintf("Maximum phi Location: %g\n", maxPhiLocation)
        fprintf("Maximum energy: %g\n", maxEnergy)
        fprintf("Maximum energy Location: %g\n", maxEnergyLocation)
    end
    
    if maxEnergyLocation == 1
        mode = [1, 0, 0]';
    elseif maxEnergyLocation == 0
        mode = [0, 0, 1]';
    else
        mode = [0, 1, 0]';
    end
end