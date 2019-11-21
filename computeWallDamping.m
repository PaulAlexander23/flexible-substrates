function term1 = computeWallDamping(k, c, eta, params)
    term1 = -4*pi*k*params.AD*abs(c)^2*abs(eta)^2;
end
