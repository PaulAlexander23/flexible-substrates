function eta = computeEta(val, vec)
    phi = computePhi(0, squeeze(vec));
    
    eta = phi / val;
end
