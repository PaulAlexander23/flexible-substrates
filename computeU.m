function u = computeU(z, phi)
    u = 2 * gradient(real(phi), z);
end