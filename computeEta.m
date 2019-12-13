function eta = computeEta(val, vec)
    phi = computePhi(0, squeeze(vec));
    if val ~= 0
        eta = phi / val;
    else
        eta = 0;
    end
end
