function filename = saveData(prefix, val, vec, k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials, uniqueName)
    if nargin < 15, uniqueName = false; end
    filename = makeFilename(prefix, 'cotbeta', cotbeta, 'S', S, 'AD', AD, 'AT', AT, 'AB', AB, 'AK', AK, 'AI', AI, 'modes', modes, 'nop', numberOfPolynomials);
    if uniqueName
        uuid = char(java.util.UUID.randomUUID);
        filename = strcat(filename, "-", uuid);
    end
    save(filename, 'val', 'k', 'R', 'cotbeta', 'S', 'AD', 'AT', 'AB', 'AK', 'AI', 'modes', 'numberOfPolynomials','vec');
end
