function term1 = computeWallDamping(val, vec, params)
    eta = computeEta(val, vec);
    
    term1 = -4*pi*params.k*params.AD*abs(val)^2*abs(eta)^2;
end
