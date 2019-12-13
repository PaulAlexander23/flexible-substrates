function h = computeH(val,vec)
    
    phi = computePhi(1, vec);
    dphidz = computedPhidz(1, vec)/2;

    if val - dphidz ~= 0
        h = phi / (val - dphidz);
    else
        h = 0;
    end
end
