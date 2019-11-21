function h = computeH(val,vec)
    
    phi = computePhi(1, vec);
    dphidz = computedPhidz(1, vec)/2;

    h = phi / (val - dphidz);
end
