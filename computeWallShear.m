function term2 = computeWallShear(vec, params)
    phi = computePhi(0, vec);
    dphidz = computedPhidz(0, vec);
    d2phidz2 = computed2Phidz2(0, vec);
    
    term2 = -4*pi/params.k * real(conj(dphidz) * d2phidz2 ...
        + params.k^2 * dphidz * conj(phi));
end
