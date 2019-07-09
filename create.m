function create(k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials)

    Rl = length(R);
    c = zeros(Rl,length(k),modes);
    
    parfor ki = 1:length(k)
        for Ri = 1:Rl
            c(Ri,ki,:) = imag(compute_c_switchboard('n', k(ki), R(Ri), cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials));
        end
    end

    saveData("neutral-curve", c, k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials)
end