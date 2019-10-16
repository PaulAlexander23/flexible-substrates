function u = computeU(z, phi)
    u = gradient(2 * real(phi), z);
end
