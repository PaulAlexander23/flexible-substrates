function [c, phi] = createWithClassify(k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials)

    Rl = length(R);
    c = zeros(Rl,length(k),modes);
    phi = zeros(Rl, length(k), modes, 2*(numberOfPolynomials+3));
    
    parfor ki = 1:length(k)
        for Ri = 1:Rl
            [val, vec] = computeNumerical(k(ki), R(Ri), cotbeta, S, AD, AT, AB, AK, AI, numberOfPolynomials, modes);
            c(Ri,ki,:) = val;
            phi(Ri,ki,:,:) = vec.';
        end
    end
    
    saveData("neutral-curve", c, phi, k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials)
end
