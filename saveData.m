function saveData(prefix, c, type, k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials)
    filename = makeFilename(prefix, 'cotbeta', cotbeta, 'S', S, 'AD', AD, 'AT', AT, 'AB', AB, 'AK', AK, 'AI', AI, 'modes', modes, 'nop', numberOfPolynomials, 'type', type);
    save(filename, 'c', 'k', 'R', 'cotbeta', 'S', 'AD', 'AT', 'AB', 'AK', 'AI', 'modes', 'numberOfPolynomials','type');
end