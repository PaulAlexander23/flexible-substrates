function create(k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials)

    Rl = length(R);
    c = zeros(Rl,length(k),modes);
    
    parfor ki = 1:length(k)
        for Ri = 1:Rl
            [val(Ri,ki,:), vec(Ri,ki,:,:)] = computeNumerical(k(ki),R(Ri),cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials,modes);
        end
    end

    saveData("neutral-curve", val, vec, k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials)
end
