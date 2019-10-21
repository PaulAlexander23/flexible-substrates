function u = computeU(z, phi)
    u = gradient(2 * real(phi), 2*z-1);
end
