function h = computeH(val,vec)
    
    delta = 0.001;
    phi = computePhi([1-delta/2, 1], squeeze(vec));
    dphidz = (phi(2) - phi(1))/delta;

    h = phi(2) / (val - dphidz);
end
