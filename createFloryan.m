function createFloryan(k, R, cotbeta, kapitza, AD, AT, AB, AK, AI, modes, numberOfPolynomials)
    
    Rl = length(R);
    c = zeros(Rl,length(k),modes);
    
    parfor ki = 1:length(k)
        for Ri = 1:Rl
            S = kapitza * R(Ri)^(-2/3) * (3/2 * sin(acot(cotbeta)))^(-1/3);
            c(Ri,ki,:) = imag(compute_c_switchboard('n', k(ki), R(Ri), cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials));
        end
    end
    
    filename = makeFilename("neutral-curve", 'cotbeta', cotbeta, 'kapitza', kapitza, 'AD', AD, 'AT', AT, 'AB', AB, 'AK', AK, 'AI', AI, 'modes', modes, 'nop', numberOfPolynomials);
    save(filename, 'c', 'k', 'R', 'cotbeta', 'kapitza', 'AD', 'AT', 'AB', 'AK', 'AI', 'modes', 'numberOfPolynomials');
end