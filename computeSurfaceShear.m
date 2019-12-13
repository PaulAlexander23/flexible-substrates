function term1 = computeSurfaceShear(vec, params)
    phi = computePhi(1, vec);
    dphidz = computedPhidz(1, vec);
    d2phidz2 = computed2Phidz2(1, vec);
    
    term1 = 4*pi/params.k * real(conj(dphidz) * d2phidz2 ...
        - params.k^2 * dphidz * conj(phi));
end