function filename = saveData(prefix, val, vec, k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials, jobid)
    if nargin < 15, jobid = ""; end
    filename = makeFilename(prefix, 'cotbeta', cotbeta, 'S', S, 'AD', AD, 'AT', AT, 'AB', AB, 'AK', AK, 'AI', AI, 'modes', modes, 'nop', numberOfPolynomials);
    if jobid ~= ""
        filename = strcat(filename, "-", jobid);
    end
    save(filename, 'val', 'k', 'R', 'cotbeta', 'S', 'AD', 'AT', 'AB', 'AK', 'AI', 'modes', 'numberOfPolynomials','vec');
end
