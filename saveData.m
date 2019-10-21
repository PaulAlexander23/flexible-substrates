function saveData(prefix, val, vec, k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials)
    filename = makeFilename(prefix, 'cotbeta', cotbeta, 'S', S, 'AD', AD, 'AT', AT, 'AB', AB, 'AK', AK, 'AI', AI, 'modes', modes, 'nop', numberOfPolynomials);
    save(filename, 'val', 'k', 'R', 'cotbeta', 'S', 'AD', 'AT', 'AB', 'AK', 'AI', 'modes', 'numberOfPolynomials','vec');
end
