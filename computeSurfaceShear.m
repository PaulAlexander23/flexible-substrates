function term1 = computeSurfaceShear(k, vec)
    phi = computePhi(1, vec);
    dphidz = computedPhidz(1, vec);
    d2phidz2 = computed2Phidz2(1, vec);
    
    term1 = 4*pi/k * real(conj(dphidz) * d2phidz2 ...
        + k^2 * dphidz * conj(phi));
end